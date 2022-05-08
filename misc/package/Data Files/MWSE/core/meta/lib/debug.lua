--- @meta
--- @diagnostic disable:undefined-doc-name

--- This is an extension of Lua Debug library.
--- @class debuglib
debug = {}

--- Clears any prefix information from cache for use with `debug.log`. This is useful if your file loads dynamically via `dofile`, and is subject to change during development.
--- @param file string? The path to the file. If omitted, the calling file will have its associated log cache removed.
function debug.clearLogCacheForFile(file) end

--- Logs a message to `MWSE.log` file. The output format is `[path] "msg" = msg`, where the `path` is the path and line at which the function was called.
--- @param value string The message to log.
--- @return string value No description yet available.
function debug.log(value) end

