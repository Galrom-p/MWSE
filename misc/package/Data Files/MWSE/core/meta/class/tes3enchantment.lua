--- @meta
--- @diagnostic disable:undefined-doc-name

--- An enchantment game object.
--- @class tes3enchantment : tes3object, tes3baseObject
--- @field castType number The enchantment's cast type. Maps to [`tes3.enchantmentType`](https://mwse.github.io/MWSE/references/enchantment-types/) constants.
--- @field chargeCost number The cost of using the enchantment.
--- @field effects tes3effect[] *Read-only*. An array-style table of the [`tes3effect`](https://mwse.github.io/MWSE/types/tes3effect/) data on the object.
--- @field flags number A bit field for the enchantment's flags.
--- @field maxCharge number The maximum charge for the associated enchantment.
tes3enchantment = {}

--- Use [`tes3.createObject()`](https://mwse.github.io/MWSE/apis/tes3/#tes3createobject) instead. This function created a new enchantment object, which will be stored as part of the current saved game.
--- @deprecated
--- @param params tes3enchantment.create.params This table accepts the following values:
--- 
--- `id`: string? — *Optional*. The new object's ID. Must be unique if provided.
--- 
--- `castType`: number — The enchantment castType. See [`tes3.enchantmentType`](https://mwse.github.io/MWSE/references/enchantment-types/) constants.
--- 
--- `chargeCost`: number — The new enchantment charge cost. Must be greater than `0`.
--- 
--- `maxCharge`: number — The new enchantment maximum charge. Must be greater than `0`
--- 
--- `flags`: number? — *Optional*. The new enchantment flags.
--- 
--- `objectFlags`: number? — *Default*: `0`. The object flags initially set. Force set as modified.
function tes3enchantment.create(params) end

---Table parameter definitions for `tes3enchantment.create`.
--- @class tes3enchantment.create.params
--- @field id string? *Optional*. The new object's ID. Must be unique if provided.
--- @field castType number The enchantment castType. See [`tes3.enchantmentType`](https://mwse.github.io/MWSE/references/enchantment-types/) constants.
--- @field chargeCost number The new enchantment charge cost. Must be greater than `0`.
--- @field maxCharge number The new enchantment maximum charge. Must be greater than `0`
--- @field flags number? *Optional*. The new enchantment flags.
--- @field objectFlags number? *Default*: `0`. The object flags initially set. Force set as modified.

--- Creates a copy of this object.
--- @param params tes3enchantment.createCopy.params This table accepts the following values:
--- 
--- `id`: string? — *Optional*. The new object's ID. If one is not provided, a randomly generated one will be used.
--- 
--- `addToObjectList`: boolean? — *Default*: `true`. If true, the object will be added to the data handler. If this is false, the new object may not have a randomly generated ID. Do not use this without knowing the implications.
--- 
--- `sourceless`: boolean? — *Default*: `false`. If true, the object will be made sourceless, and will not be serialized to the save game. If the object is copied outside of a save game, the object will **always** be sourceless.
--- @return tes3enchantment newObject No description yet available.
function tes3enchantment:createCopy(params) end

---Table parameter definitions for `tes3enchantment.createCopy`.
--- @class tes3enchantment.createCopy.params
--- @field id string? *Optional*. The new object's ID. If one is not provided, a randomly generated one will be used.
--- @field addToObjectList boolean? *Default*: `true`. If true, the object will be added to the data handler. If this is false, the new object may not have a randomly generated ID. Do not use this without knowing the implications.
--- @field sourceless boolean? *Default*: `false`. If true, the object will be made sourceless, and will not be serialized to the save game. If the object is copied outside of a save game, the object will **always** be sourceless.

--- Returns the amount of effects the `tes3enchantment` object has.
--- @return number count No description yet available.
function tes3enchantment:getActiveEffectCount() end

--- Returns the index of a first effect of a given effectId in the parent `tes3enchantment` object.
--- @param effectId number The effectId to perform a check for. Maps to [`tes3.effect`](https://mwse.github.io/MWSE/references/magic-effects/) constants, including magic effects added with [`tes3.addMagicEffect()`](https://mwse.github.io/MWSE/apis/tes3/#tes3addmagiceffect).
--- @return number index No description yet available.
function tes3enchantment:getFirstIndexOfEffect(effectId) end

