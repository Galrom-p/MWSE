#pragma once

#include "LuaUtil.h"

#include "NINode.h"
#include "TES3GameFile.h"
#include "TES3ReferenceList.h"

namespace mwse {
	namespace lua {
		template <typename T>
		void setUserdataForTES3BaseObject(sol::usertype<T>& usertypeDefinition) {
			// Basic property binding.
			usertypeDefinition["objectType"] = sol::readonly_property(&TES3::BaseObject::objectType);
			usertypeDefinition["objectFlags"] = sol::readonly_property(&TES3::BaseObject::objectFlags);

			// Allow object to be converted to strings using their object ID.
			usertypeDefinition[sol::meta_function::to_string] = &TES3::BaseObject::getObjectID;

			// Allow objects to be serialized to json using their ID.
			usertypeDefinition["__tojson"] = &TES3::BaseObject::toJson;

			// Functions exposed as properties.
			usertypeDefinition["id"] = sol::readonly_property(&TES3::BaseObject::getObjectID);
			usertypeDefinition["sourceMod"] = sol::readonly_property(&TES3::BaseObject::getSourceFilename);
			usertypeDefinition["modified"] = sol::property(&TES3::BaseObject::getObjectModified, &TES3::BaseObject::setObjectModified);
			usertypeDefinition["disabled"] = sol::readonly_property(&TES3::BaseObject::getDisabled);
			usertypeDefinition["deleted"] = sol::readonly_property(&TES3::BaseObject::getDeleted);
			usertypeDefinition["persistent"] = sol::property(&TES3::BaseObject::getPersistent, &TES3::BaseObject::setPersistent);
			usertypeDefinition["blocked"] = sol::property(&TES3::BaseObject::getBlocked, &TES3::BaseObject::setBlocked);
			usertypeDefinition["sourceless"] = sol::property(&TES3::BaseObject::getSourceless, &TES3::BaseObject::setSourceless);
		}

		template <typename T>
		void setUserdataForTES3Object(sol::usertype<T>& usertypeDefinition) {
			setUserdataForTES3BaseObject(usertypeDefinition);

			// Basic property binding.
			usertypeDefinition["nextInCollection"] = sol::readonly_property(&TES3::Object::nextInCollection);
			usertypeDefinition["previousInCollection"] = sol::readonly_property(&TES3::Object::previousInCollection);
			usertypeDefinition["sceneNode"] = sol::readonly_property(&TES3::Object::sceneNode);
			usertypeDefinition["sceneCollisionRoot"] = sol::readonly_property(&TES3::Object::sceneCollisionRoot);

			// Functions exposed as properties.
			usertypeDefinition["owningCollection"] = sol::readonly_property(&TES3::Object::getOwningCollection);
			usertypeDefinition["scale"] = sol::property(&TES3::Object::getScale, &TES3::Object::setScale_lua);
		}

		template <typename T>
		void setUserdataForTES3PhysicalObject(sol::usertype<T>& usertypeDefinition) {
			setUserdataForTES3Object(usertypeDefinition);

			// Basic property binding.
			usertypeDefinition["boundingBox"] = sol::readonly_property(&TES3::PhysicalObject::boundingBox);

			// Functions exposed as properties.
			usertypeDefinition["stolenList"] = sol::readonly_property(&TES3::PhysicalObject::getStolenList);
		}
	}
}