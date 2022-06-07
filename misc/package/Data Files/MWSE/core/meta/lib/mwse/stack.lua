--- @meta
--- @diagnostic disable:undefined-doc-name

--- The stack library provides functions to interact with the mwse mwscript stack, for dealing with custom mwscript extensions.
--- @class mwse.stacklib
mwse.stack = {}

--- Purges all elements from the stack.
function mwse.stack.clear() end

--- Prints all values on the stack in hex format to the log file.
function mwse.stack.dump() end

--- Determines if the stack is empty.
--- @return boolean result No description yet available.
function mwse.stack.empty() end

--- Pops a value of mwscript type "float" off of the stack.
--- @return number? result *Optional*. No description yet available.
function mwse.stack.popFloat() end

--- Pops a value of mwscript type "long" off of the stack.
--- @return number? result *Optional*. No description yet available.
function mwse.stack.popLong() end

--- Pops a value of mwscript type "long" off of the stack, and tries to reinterpret as a game object.
--- @return tes3activator|tes3alchemy|tes3apparatus|tes3armor|tes3birthsign|tes3bodyPart|tes3book|tes3cell|tes3class|tes3clothing|tes3container|tes3containerInstance|tes3creature|tes3creatureInstance|tes3dialogue|tes3dialogueInfo|tes3door|tes3enchantment|tes3faction|tes3gameSetting|tes3globalVariable|tes3ingredient|tes3leveledCreature|tes3leveledItem|tes3light|tes3lockpick|tes3magicSourceInstance|tes3misc|tes3npc|tes3npcInstance|tes3probe|tes3quest|tes3race|tes3reference|tes3region|tes3repairTool|tes3script|tes3skill|tes3sound|tes3soundGenerator|tes3spell|tes3startScript|tes3static|tes3weapon|nil result *Optional*. No description yet available.
function mwse.stack.popObject() end

--- Pops a value of mwscript type "short" off of the stack.
--- @return number? result *Optional*. No description yet available.
function mwse.stack.popShort() end

--- Pops a value of mwscript type "long" off of the stack, and tries to reinterpret as a string.
--- @return string? result *Optional*. No description yet available.
function mwse.stack.popString() end

--- Pushes a value of mwscript type "float" onto the stack.
--- @param value number No description yet available.
--- @return nil result No description yet available.
function mwse.stack.pushFloat(value) end

--- Pushes a value of mwscript type "long" onto the stack.
--- @param value number No description yet available.
--- @return nil result No description yet available.
function mwse.stack.pushLong(value) end

--- Pushes a value of mwscript type "long" onto the stack, which matches the address of a given game object.
--- @param value tes3activator|tes3alchemy|tes3apparatus|tes3armor|tes3birthsign|tes3bodyPart|tes3book|tes3cell|tes3class|tes3clothing|tes3container|tes3containerInstance|tes3creature|tes3creatureInstance|tes3dialogue|tes3dialogueInfo|tes3door|tes3enchantment|tes3faction|tes3gameSetting|tes3globalVariable|tes3ingredient|tes3leveledCreature|tes3leveledItem|tes3light|tes3lockpick|tes3magicSourceInstance|tes3misc|tes3npc|tes3npcInstance|tes3probe|tes3quest|tes3race|tes3reference|tes3region|tes3repairTool|tes3script|tes3skill|tes3sound|tes3soundGenerator|tes3spell|tes3startScript|tes3static|tes3weapon No description yet available.
--- @return nil result No description yet available.
function mwse.stack.pushObject(value) end

--- Pushes a value of mwscript type "short" onto the stack.
--- @param value number No description yet available.
--- @return nil result No description yet available.
function mwse.stack.pushShort(value) end

--- Adds a string to mwse's string storage, and pushes a value of mwscript type "long" onto the stack that represents the string.
--- @param value string No description yet available.
--- @return nil result No description yet available.
function mwse.stack.pushString(value) end

--- Returns the number of elements currently on the stack.
--- @return number result No description yet available.
function mwse.stack.size() end

