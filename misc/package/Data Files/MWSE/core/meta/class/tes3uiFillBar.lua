--- @meta
--- @diagnostic disable:undefined-doc-name

--- A structure containing properties specific to fillbars.
--- @class tes3uiFillBar
--- @field current number The current value. The size of the filled portion is determined by dividing `current` by `max`.
--- @field fillAlpha number The alpha value of `fillColor`. Setting this will also set the alpha value of `fillColor`.
--- @field fillColor niColor The RGB color of the filled portion. An array of 3 floats with value range [0.0, 1.0]. Does not affect the background or the border.
--- @field max number The maximum value. The size of the filled portion is determined by dividing `current` by `max`.
--- @field showText boolean If `true`, shows a centered text with the format `current/max` inside the fillbar.
tes3uiFillBar = {}

