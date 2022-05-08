--- @meta
--- @diagnostic disable:undefined-doc-name

--- A creature object that has been cloned. Typically represents a creature that has been instanced in the world.
--- @class tes3creatureInstance : tes3actor, tes3physicalObject, tes3object, tes3baseObject
--- @field aiConfig tes3aiConfig *Read-only*. Simplified access to the base creature's AI configuration.
--- @field attacks tes3rangeInt[] Simplified access to the base creature's attacks. A table of three attacks, represented by a trio of [`tes3rangeInt`](https://mwse.github.io/MWSE/types/tes3rangeInt/).
--- @field attributes number[] Simplified access to the base creature's attributes. A table of eight numbers, representing the base values for the creature's attributes.
--- @field baseObject tes3creature Access to creature that this one is instanced from.
--- @field biped boolean Access to the creature's biped flag.
--- @field equipment tes3iterator *Read-only*. A collection that contains the currently equipped items.
--- @field fatigue number *Read-only*. The creature's current fatigue.
--- @field flies boolean Access to the creature's flies flag.
--- @field health number *Read-only*. The creature's current health.
--- @field isAttacked boolean *Read-only*. If true, the creature attacked flag is set.
--- @field isEssential boolean *Read-only*. If true, the creature essential flag is set.
--- @field isInstance boolean Always returns true.
--- @field isRespawn boolean *Read-only*. If true, the creature respawn flag is set.
--- @field level number *Read-only*. The base level of the creature.
--- @field magicka number *Read-only*. The creature's current magicka.
--- @field mesh string The path to the object's mesh.
--- @field mobile tes3mobileActor|tes3mobileCreature|tes3mobileNPC|tes3mobilePlayer *Read-only*. The mobile that the object is represented by.
--- @field name string The player-facing name for the object.
--- @field reference tes3reference *Read-only*. The reference that the object is represented by.
--- @field respawns boolean Access to the creature's respawns flag.
--- @field script tes3script The script that runs on the object.
--- @field skills number[] Simplified access to the base creature's skills. A table of three numbers, representing the base values for the creature's combat, magic, and stealth skills.
--- @field soul number Simplified access to the base creature's soul. The amount of soul value that the creature provides.
--- @field soundCreature tes3creature Simplified access to the base creature's sound generator. A creature to use instead of this one for sound generation.
--- @field spells tes3spellList *Read-only*. Quick access to the base creature's spell list. It is a `tes3spellList`, which is a list wrapper with helper functions. The actual list is accessed with `.iterator`. e.g. `for _, spell in pairs(creature.spells.iterator) do print(spell.name) end`
--- @field swims boolean Access to the creature's swims flag.
--- @field type number Simplified access to the base creature's type. The type of the creature, maps to values in [`tes3.creatureType`](https://mwse.github.io/MWSE/references/creature-types/) namespace.
--- @field usesEquipment boolean Access to the creature's usesEquipment flag.
--- @field walks boolean Access to the creature's walks flag.
--- @field weapon tes3weapon *Read-only*. The creature's currently equipped weapon.
tes3creatureInstance = {}

--- Causes the creature to reevaluate its equipment choices and equip the best available.
function tes3creatureInstance:reevaluateEquipment() end

