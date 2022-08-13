-- This file is autogenerated. Do not edit this file manually. Your changes will be ignored.
-- More information: https://github.com/MWSE/MWSE/tree/master/docs

--- @meta
--- @diagnostic disable:undefined-doc-name

--- A data structure that represents a weather particle, such as a rain drop or snow flake.
--- @class tes3weatherControllerParticle
--- @field diameter number The diameter of the particle.
--- @field object niAmbientLight|niBillboardNode|niCamera|niCollisionSwitch|niDirectionalLight|niDynamicEffect|niLight|niNode|niParticles|niPointLight|niRotatingParticles|niSpotLight|niSwitchNode|niTextureEffect|niTriShape The visual used for the particle.
--- @field rainRoot niBillboardNode|niCollisionSwitch|niNode|niSwitchNode *Read-only*. A shortcut to the root rain node.
--- @field remainingLifetime number The remaining time before the particle becomes inactive.
--- @field velocity tes3vector3 The velocity of the particle.
--- @field weatherController tes3weatherController *Read-only*. A shortcut to the weather controller.
tes3weatherControllerParticle = {}

