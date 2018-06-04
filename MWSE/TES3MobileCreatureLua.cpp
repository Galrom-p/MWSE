#include "TES3MobileCreatureLua.h"

#include "sol.hpp"
#include "LuaManager.h"
#include "LuaUtil.h"

#include "TES3MobileCreature.h"
#include "TES3Creature.h"
#include "TES3Statistic.h"

namespace mwse {
	namespace lua {
		void bindTES3MobileCreature() {
			// Get our lua state.
			sol::state& state = LuaManager::getInstance().getState();

			// Start our usertype. We must finish this with state.set_usertype.
			auto usertypeDefinition = state.create_simple_usertype<TES3::MobileCreature>();
			usertypeDefinition.set("new", sol::no_constructor);

			// Define inheritance structures. These must be defined in order from top to bottom. The complete chain must be defined.
			usertypeDefinition.set(sol::base_classes, sol::bases<TES3::MobileActor, TES3::MobileObject>());

			// Basic property binding.
			usertypeDefinition.set("combat", sol::readonly_property(&TES3::MobileCreature::combatSkill));
			usertypeDefinition.set("magic", sol::readonly_property(&TES3::MobileCreature::magicSkill));
			usertypeDefinition.set("stealth", sol::readonly_property(&TES3::MobileCreature::stealthSkill));

			// Access to other objects that need to be packaged.
			usertypeDefinition.set("object", sol::readonly_property([](TES3::MobileCreature& self) { return makeLuaObject(self.creatureInstance); }));

			// Finish up our usertype.
			state.set_usertype("TES3MobileCreature", usertypeDefinition);
		}
	}
}
