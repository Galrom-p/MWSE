-- This file is autogenerated. Do not edit this file manually. Your changes will be ignored.
-- More information: https://github.com/MWSE/MWSE/tree/master/docs

--- @meta
--- An abstract base class from which all the animation controllers inherit. It has all the functionality needed to control the timing and update animations.
--- @class niTimeController : niObject
--- @field active boolean If the controller is active. When inactive, the target does not get updated and animation timing does not advance.
--- @field animTimingType ni.animType How the time parameter passed to the update function is treated. Type 0 is the default, which treats the update time as a delta time. Type 1 treats the update time an offset from the start of the animation.
--- 
--- Maps to values in [`ni.animType`](https://mwse.github.io/MWSE/references/ni/animation-types/) table.
--- @field cycleType ni.animCycleType The animation cycle type. Type 0 is looping, type 2 is reverse, type 4 is clamped.
--- 
--- Maps to values in [`ni.animCycleType`](https://mwse.github.io/MWSE/references/ni/animation-cycle-types/) table.
--- @field frequency number The animation controller's frequency value. It is a scaling value used to convert from update time units to keyframe time units, if necessary.
--- @field highKeyFrame number This is the end animation key time of the animation controller.
--- @field lastScaledTime number This function returns the last scaled time computed by this controller. The scaled time takes the `frequency` and `phase` into account, along with the `cycleType` and `animTimingType`. This is the last value used to interpolate animation keys.
--- @field lastTime number No description.
--- @field lowKeyFrame number This is the beginning animation key time of the animation controller.
--- @field nextController niKeyframeController|niKeyframeManager|niLookAtController|niParticleSystemController|niPathController The next animation controller in the list of controllers containing the calling controller.
--- @field phase number The phase value. It is an offset applied to the animation's update time, in seconds.
--- @field startTime number The time at which the animation controller starts playing its animation.
--- @field target niAlphaProperty|niAmbientLight|niBillboardNode|niCamera|niCollisionSwitch|niDirectionalLight|niFogProperty|niMaterialProperty|niNode|niParticles|niPointLight|niRenderedTexture|niRotatingParticles|niSortAdjustNode|niSourceTexture|niSpotLight|niStencilProperty|niSwitchNode|niTextureEffect|niTexturingProperty|niTriShape|niVertexColorProperty|niZBufferProperty *Read-only*. The scene graph object that this animation controller is to animate.
niTimeController = {}

--- This method assigns a new target to the animation controller.
--- @param target niAlphaProperty|niAmbientLight|niBillboardNode|niCamera|niCollisionSwitch|niDirectionalLight|niFogProperty|niMaterialProperty|niNode|niParticles|niPointLight|niRenderedTexture|niRotatingParticles|niSortAdjustNode|niSourceTexture|niSpotLight|niStencilProperty|niSwitchNode|niTextureEffect|niTexturingProperty|niTriShape|niVertexColorProperty|niZBufferProperty The new target to assign.
function niTimeController:setTarget(target) end

--- Starts the controller at the specified time. Intended for controllers with `animTimingType` of 1.
--- @param time number No description yet available.
function niTimeController:start(time) end

--- Stops the controller. If you only want to pause the controller, use the `update` property.
function niTimeController:stop() end

