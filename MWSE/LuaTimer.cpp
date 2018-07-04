#include "LuaTimer.h"

#include <algorithm>

#include "LuaManager.h"

#include "LuaUtil.h"

namespace mwse {
	namespace lua {
		//
		// TimeComparer
		//

		bool TimerComparer::operator()(const std::shared_ptr<Timer>& first, double second) {
			return first->timing < second;
		}

		bool TimerComparer::operator()(const std::shared_ptr<Timer>& first, const std::shared_ptr<Timer>& second) {
			return first->timing < second->timing;
		}

		// Single instance to the comparator used for std::upper_bound.
		TimerComparer comparer;

		//
		// TimerController
		//

		TimerController::TimerController() :
			m_Clock(0.0)
		{

		}

		TimerController::TimerController(double initialClock) :
			m_Clock(initialClock)
		{

		}

		void TimerController::setClock(double clock) {
			m_Clock = clock;
			update();
		}

		void TimerController::incrementClock(double delta) {
			m_Clock += delta;
			update();
		}

		double TimerController::getClock() {
			return m_Clock;
		}

		std::shared_ptr<Timer> TimerController::createTimer(double duration, sol::protected_function callback, int iterations) {
			// Validate parameters.
			if (duration < 0.0 || iterations < 0 || callback.get_type() != sol::type::function) {
				return nullptr;
			}

			// Setup the timer structure.
			auto timer = std::make_shared<Timer>();
			timer->controller = this;
			timer->duration = duration;
			timer->timing = m_Clock + duration;
			timer->iterations = iterations;
			timer->callback = callback;

			// Find the position in the list to add this timer, and add it.
			insertActiveTimer(timer);

			return timer;
		}

		bool TimerController::pauseTimer(std::shared_ptr<Timer> timer) {
			// Validate timer.
			if (timer->state != TimerState::Active) {
				return false;
			}

			// Remove from the active timer list.
			auto result = std::find(m_ActiveTimers.begin(), m_ActiveTimers.end(), timer);
			if (result == m_ActiveTimers.end()) {
				return false;
			}
			m_ActiveTimers.erase(result);

			// And add it to the paused list.
			m_PausedTimers.insert(timer);

			// Update its state.
			timer->state = TimerState::Paused;
			timer->timing = timer->timing - m_Clock;

			return true;
		}

		bool TimerController::resumeTimer(std::shared_ptr<Timer> timer) {
			// Validate timer.
			if (timer->state != TimerState::Paused) {
				return false;
			}

			// Remove from the paused timer list.
			m_PausedTimers.erase(timer);

			// Add to the active list.
			insertActiveTimer(timer);

			return true;
		}

		bool TimerController::resetTimer(std::shared_ptr<Timer> timer) {
			// Validate timer.
			if (timer->state != TimerState::Active) {
				return false;
			}

			// Change timing.
			timer->timing = m_Clock + timer->duration;

			// Move it to the right place in the list.
			repositionTimer(timer);

			return true;
		}

		bool TimerController::cancelTimer(std::shared_ptr<Timer> timer) {
			TimerState::TimerState previousState = timer->state;
			timer->state = TimerState::Expired;

			// Remove from the active list.
			if (previousState == TimerState::Active) {
				auto position = std::find(m_ActiveTimers.begin(), m_ActiveTimers.end(), timer);
				if (position == m_ActiveTimers.end()) {
					return false;
				}
				m_ActiveTimers.erase(position);
				return true;
			}

			// Remove from the paused timer list.
			else if (previousState == TimerState::Paused) {
				return m_PausedTimers.erase(timer) == 1;
			}

			return false;
		}

		void TimerController::clearTimers() {
			// Mark all timers as expired.
			for (auto itt = m_ActiveTimers.begin(); itt != m_ActiveTimers.end(); itt++) {
				(*itt)->state = TimerState::Expired;
			}

			// Free the timers from internal storage.
			m_ActiveTimers.clear();
			m_PausedTimers.clear();
		}

		void TimerController::update() {
			if (m_ActiveTimers.empty()) {
				return;
			}

			std::shared_ptr<Timer> timer = m_ActiveTimers.front();
			while (timer != nullptr && timer->timing <= m_Clock) {
				timer->callback();

				if (timer->iterations > 0) {
					timer->iterations--;
					if (timer->iterations == 0) {
						cancelTimer(timer);
						return;
					}
				}

				timer->timing += timer->duration;
				repositionTimer(timer);

				if (m_ActiveTimers.empty()) {
					return;
				}

				timer = m_ActiveTimers.front();
			}
		}

		std::vector<std::shared_ptr<Timer>>::iterator TimerController::insertActiveTimer(std::shared_ptr<Timer> timer) {
			auto position = std::upper_bound(m_ActiveTimers.begin(), m_ActiveTimers.end(), timer, comparer);
			return m_ActiveTimers.insert(position, timer);
		}

		void TimerController::repositionTimer(std::shared_ptr<Timer> timer) {
			// Remove from current position.
			auto position = std::find(m_ActiveTimers.begin(), m_ActiveTimers.end(), timer);
			if (position == m_ActiveTimers.end()) {
				return;
			}
			m_ActiveTimers.erase(position);

			// Then insert it back in.
			insertActiveTimer(timer);
		}

		//
		// Legacy functions, to help people migrate their code to the new method of performing timers.
		//

		// Create and return a timer given a controller and a table of parameters.
		std::shared_ptr<Timer> startTimer(TimerController* controller, sol::table params) {
			// Get the timer variables.
			double duration = getOptionalParam<double>(params, "duration", 0.0);
			sol::function callback = getOptionalParam<sol::function>(params, "callback", sol::nil);
			int iterations = getOptionalParam<int>(params, "iterations", 1);

			// Allow infinite repeat.
			if (iterations <= 0) {
				iterations = 0;
			}

			// Create the timer.
			return controller->createTimer(duration, callback, iterations);
		}

		// Create a timer, as above, but get the controller from params.type.
		std::shared_ptr<Timer> startTimerAmbiguous(sol::table params) {
			// Get the timer controller we care about.
			unsigned int type = getOptionalParam<unsigned int>(params, "type", TimerType::SimulationTime);
			std::shared_ptr<TimerController> controller = LuaManager::getInstance().getTimerController(static_cast<TimerType::TimerType>(type));
			if (controller == nullptr) {
				return nullptr;
			}

			// Create the timer.
			return startTimer(controller.get(), params);
		}

		// Directly create a real-time timer.
		std::shared_ptr<Timer> startTimerLegacyReal(double duration, sol::protected_function callback, sol::optional<int> iterations) {
			std::shared_ptr<TimerController> controller = LuaManager::getInstance().getTimerController(TimerType::RealTime);
			if (controller == nullptr) {
				return nullptr;
			}

			return controller->createTimer(duration, callback, iterations.value_or(1));
		}

		// Directly createa  simulation-time timer.
		std::shared_ptr<Timer> startTimerLegacySimulation(double duration, sol::protected_function callback, sol::optional<int> iterations) {
			std::shared_ptr<TimerController> controller = LuaManager::getInstance().getTimerController(TimerType::SimulationTime);
			if (controller == nullptr) {
				return nullptr;
			}

			return controller->createTimer(duration, callback, iterations.value_or(1));
		}

		// Function to pause a given timer.
		bool legacyTimerPause(std::shared_ptr<Timer> timer) {
			return timer->controller->pauseTimer(timer);
		}

		// Function to resume a given timer.
		bool legacyTimerResume(std::shared_ptr<Timer> timer) {
			return timer->controller->resumeTimer(timer);
		}

		// Function to reset a given timer.
		bool legacyTimerReset(std::shared_ptr<Timer> timer) {
			return timer->controller->resetTimer(timer);
		}

		// Function to cancel a given timer.
		bool legacyTimerCancel(std::shared_ptr<Timer> timer) {
			return timer->controller->cancelTimer(timer);
		}

		// Create a timer that will complete in the next cycle.
		std::shared_ptr<Timer> legacyTimerDelayOneFrame(sol::protected_function callback) {
			std::shared_ptr<TimerController> controller = LuaManager::getInstance().getTimerController(TimerType::RealTime);
			if (controller == nullptr) {
				return nullptr;
			}
			return controller->createTimer(0.0000001, callback, 1);
		}

		// Create a timer that will complete in the next simulation cycle.
		std::shared_ptr<Timer> legacyTimerDelayOneSimulationFrame(sol::protected_function callback) {
			std::shared_ptr<TimerController> controller = LuaManager::getInstance().getTimerController(TimerType::SimulationTime);
			if (controller == nullptr) {
				return nullptr;
			}
			return controller->createTimer(0.0000001, callback, 1);
		}

		//
		// Lua binding for new data types and functions.
		//

		void bindLuaTimer() {
			// Get our lua state.
			sol::state& state = LuaManager::getInstance().getState();

			// Bind TimerController.
			{
				// Start our usertype. We must finish this with state.set_usertype.
				auto usertypeDefinition = state.create_simple_usertype<TimerController>();
				usertypeDefinition.set("new", sol::constructors<TimerController(), TimerController(double)>());

				// Basic property binding.
				usertypeDefinition.set("clock", sol::property(&TimerController::getClock, &TimerController::setClock));

				// Allow creating timers.
				usertypeDefinition.set("create", [](TimerController& self, sol::table params) {
					return startTimer(&self, params);
				});

				// Finish up our usertype.
				state.set_usertype("mwseTimerController", usertypeDefinition);
			}

			// Bind Timer.
			{
				// Start our usertype. We must finish this with state.set_usertype.
				auto usertypeDefinition = state.create_simple_usertype<Timer>();
				usertypeDefinition.set("new", sol::no_constructor);

				// Basic property binding.
				usertypeDefinition.set("duration", sol::readonly_property(&Timer::duration));
				usertypeDefinition.set("iterations", sol::readonly_property(&Timer::iterations));
				usertypeDefinition.set("state", sol::readonly_property(&Timer::state));
				usertypeDefinition.set("timing", sol::readonly_property(&Timer::timing));

				// Legacy value binding.
				usertypeDefinition.set("t", &Timer::duration);
				usertypeDefinition.set("c", &Timer::callback);
				usertypeDefinition.set("i", &Timer::iterations);
				usertypeDefinition.set("f", &Timer::timing);

				// Allow creating timers.
				usertypeDefinition.set("pause", [](std::shared_ptr<Timer> self) {
					return self->controller->pauseTimer(self);
				});
				usertypeDefinition.set("resume", [](std::shared_ptr<Timer> self) {
					return self->controller->resumeTimer(self);
				});
				usertypeDefinition.set("reset", [](std::shared_ptr<Timer> self) {
					return self->controller->resetTimer(self);
				});
				usertypeDefinition.set("cancel", [](std::shared_ptr<Timer> self) {
					return self->controller->cancelTimer(self);
				});

				// Finish up our usertype.
				state.set_usertype("mwseTimer", usertypeDefinition);
			}

			// Create our timer library.
			state["timer"] = state.create_table();

			// Expose timer types.
			state["timer"]["real"] = TimerType::RealTime;
			state["timer"]["simulate"] = TimerType::SimulationTime;
			state["timer"]["game"] = TimerType::GameTime;

			// Expose timer states.
			state["timer"]["active"] = TimerState::Active;
			state["timer"]["paused"] = TimerState::Paused;
			state["timer"]["expired"] = TimerState::Expired;

			// Bind the legacy and new start functions.
			state["timer"]["start"] = sol::overload(&startTimerAmbiguous, &startTimerLegacySimulation);

			// Legacy support for frame timers.
			state["timer"]["frame"] = state.create_table();
			state["timer"]["frame"]["start"] = &startTimerLegacyReal;

			// Legacy support for functions.
			state["timer"]["pause"] = &legacyTimerPause;
			state["timer"]["frame"]["pause"] = &legacyTimerPause;
			state["timer"]["resume"] = &legacyTimerResume;
			state["timer"]["frame"]["resume"] = &legacyTimerResume;
			state["timer"]["reset"] = &legacyTimerReset;
			state["timer"]["frame"]["reset"] = &legacyTimerReset;
			state["timer"]["cancel"] = &legacyTimerCancel;
			state["timer"]["frame"]["cancel"] = &legacyTimerCancel;
			state["timer"]["delayOneFrame"] = &legacyTimerDelayOneSimulationFrame;
			state["timer"]["frame"]["delayOneFrame"] = &legacyTimerDelayOneFrame;

			// Let new TimerControllers get made.
			state["timer"]["createController"] = []() {
				return std::make_shared<TimerController>();
			};
		}
	}
}
