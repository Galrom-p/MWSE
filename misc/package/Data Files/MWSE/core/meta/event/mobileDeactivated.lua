-- This file is autogenerated. Do not edit this file manually. Your changes will be ignored.
-- More information: https://github.com/MWSE/MWSE/tree/master/docs

--- @meta
--- @diagnostic disable:undefined-doc-name

--- This event is called when a mobile object is deactivated. This includes NPCs, creatures and projectiles, but not the player. Typically this happens when an actor dies, a creature gets unsummoned, a projectile collides with something or expires or when the player transitions from one cell to another, causing actors in previously visited cells to get deactivated.
--- @class mobileDeactivatedEventData
--- @field claim boolean If set to `true`, any lower-priority event callbacks will be skipped. Returning `false` will set this to `true`.
--- @field mobile tes3mobileActor|tes3mobileCreature|tes3mobileNPC|tes3mobilePlayer|tes3mobileProjectile|tes3mobileSpellProjectile *Read-only*. The deactivated mobile object.
--- @field reference tes3reference *Read-only*. The reference that the mobile object has been deactivated for.
