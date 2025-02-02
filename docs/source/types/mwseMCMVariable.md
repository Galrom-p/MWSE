# mwseMCMVariable
<div class="search_terms" style="display: none">mwsemcmvariable</div>

<!---
	This file is autogenerated. Do not edit this file manually. Your changes will be ignored.
	More information: https://github.com/MWSE/MWSE/tree/master/docs
-->

A Variable is an object that determines the type and location of the value being set by a setting. It could be a field on a table, or inside a config file, etc.

The Variable base class can be used for custom variables by defining the get and set fields to retrieve and save the value to a specified location. Variable subclasses exist for default behavior.

## Properties

### `class`
<div class="search_terms" style="display: none">class</div>

The type of the variable.

**Returns**:

* `result` (string)

***

### `componentType`
<div class="search_terms" style="display: none">componenttype</div>

The type of this component.

**Returns**:

* `result` ("Variable")

***

### `converter`
<div class="search_terms" style="display: none">converter</div>

This function is called when the value of the variable is changed. The function can modify the new value before it is stored.

**Returns**:

* `result` (fun(newValue: ): unknown)

***

### `id`
<div class="search_terms" style="display: none">id</div>

The unique identifier for the variable.

**Returns**:

* `result` (string)

***

### `inGameOnly`
<div class="search_terms" style="display: none">ingameonly</div>

If true, the setting containing this variable will be disabled while the game is on main menu.

**Returns**:

* `result` (boolean)

***

### `restartRequired`
<div class="search_terms" style="display: none">restartrequired</div>

If true, updating the setting containing this variable will notify the player to restart the game.

**Returns**:

* `result` (boolean)

***

### `restartRequiredMessage`
<div class="search_terms" style="display: none">restartrequiredmessage</div>

The default text is a localized version of: "The game must be restarted before this change will come into effect.".

**Returns**:

* `result` (string)

***

### `value`
<div class="search_terms" style="display: none">value</div>

The value stored in the variable.

**Returns**:

* `result` (unknown)

***

## Methods

### `get`
<div class="search_terms" style="display: none">get</div>

Returns the value stored in the variable.

```lua
local value = myObject:get()
```

**Returns**:

* `value` (unknown)

***

### `new`
<div class="search_terms" style="display: none">new</div>

Creates a new variable of this type.

```lua
local variable = myObject:new({ id = ..., inGameOnly = ..., numbersOnly = ..., restartRequired = ..., restartRequiredMessage = ..., converter = ... })
```

**Parameters**:

* `variable` (table, string): *Optional*. If passing only a string, it will be used as variable's id.
	* `id` (string): *Optional*. The unique identifier for the variable.
	* `inGameOnly` (boolean): *Default*: `false`. If true, the setting containing this variable will be disabled if the game is on main menu.
	* `numbersOnly` (boolean): *Default*: `false`. If true, only numbers will be allowed for this variable in TextFields.
	* `restartRequired` (boolean): *Default*: `false`. If true, updating the setting containing this variable will notify the player to restart the game.
	* `restartRequiredMessage` (string): *Optional*.  The default text is a localized version of: "The game must be restarted before this change will come into effect.".
	* `converter` (fun(newValue: ): unknown): *Optional*. This function is called when the value of the variable is changed. The function can modify the new value before it is saved.

**Returns**:

* `variable` ([mwseMCMVariable](../types/mwseMCMVariable.md))

***

### `set`
<div class="search_terms" style="display: none">set</div>

Changes the value stored in the variable. Calls the `converter` function with the new value before saving.

```lua
myObject:set(newValue)
```

**Parameters**:

* `newValue` (unknown)

