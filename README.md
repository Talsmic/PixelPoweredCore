# PixelPowered Devkit - Expanding GameMakerStudio
Version 0.2.0 - \_utility Edition

## Index
### [\[Core\]: \_utility Library](#_utility)
* [align and font](#align and font) 

## \[Core\]: \_utility Library

### array
A set of very useful functions for getting exactly what you need from arrays with ease

| Function Name | Description |
| --- | --- |
| `_validateArray` | Allows you to clamp a 1D array inbetween a range of lengths, provides options for how to decide extended values |
| `_arrayValue` | Returns a value from the given 1D array, provides options for if the array isn't long enough, such as looping through the array |
| `_arrayRowAsArray` <br> `_arrayColumnAsArray` | Returns the specific row or column from a 2D array as a 1D array |
| `_arrayFromStringList` <br> `_arrayAsStringList`  | Converts between a string list (of format "X|Y|Z" or similar) and a 1D array |
| `_arrayFromStringGrid` <br> `_arrayAsStringGrid` |  Converts between a string list (of format "X1,X2|Y1,Y2,Y3|Z" or similar) and a 2D array |
| `_arrayDrawVertical` <br> `_arrayDrawHorizontal` |  Draw the values of a 1D array as strings |
| `_arrayDrawGrid` |  Draw the values of a 2D array as strings |
| `_arrayContains` | Check if a value exists in a 1D/2D array (does not return it's location) |
| `_arrayCompare_Greaters` <br> `_arrayCompare_Equals` <br> `_arrayCompare_NotEquals` | Compare values in two 1D/2D arrays |
| `_arrayAppend` | Attach a value or 1D array to the end of another value or 1D array to return a single 1D array |

### boolean
Simple boolean operations

| Function Name | Description |
| --- | --- |
| `_toggle` | Swaps between True and False |
| `_booleanString` | Converts a boolean into a string that says "True" or "False" or optionally, custom values |

### number
Extra operations for dealing with integers or reals

| Function Name | Description |
| --- | --- |
| `_upto` | Increases a number, upto a cap. Includes options for what happens when the number exceeds the cap |
| `_numberAsHex` | \[Experimental] Converts a number into a Hex string |
| `_smallestOf` <br> `_largestOf` | Returns the smallest/largest value from a 1D Array of numbers | 

### string
Expanding your options with strings

| Function Name | Description |
| --- | --- |
| `_stringClip` | Reduces the length of the string to the requested length, adding an optional marker if it changed in size |
| `_stringHeight` <br> `_stringWidth` | **Alternatives to string_get_height / string_get_width** Allows you to check the height or width of a string with a specific font |
| `_stringPosFromArray` | Finds the position of the first substring in an array when given an array of substrings, and returns an array of useful information about the winning substring |

### align | font
These functions, working with the \_globalController object, add global tracking to text aligment and font that GMS2 doesn't offer easy access to. This then enables additional functions that play around with them. Align functions use the standard GMS2 alignment definitions of fa_left|fa_top, fa_center|fa_middle, fa_right|fa_bottom.  
A lot of my functions ask for an align_array, this takes the format of  `[h_align, v_align, x_offset (optional), y_offset (optional)]` 

| Function Name | Description | |
| --- | --- |--- |
| `_setAlign` | **Replacement for draw_set_halign / draw_set_valign** Sets the alignment and updates the alignment global tracking |
| `_storeAlign` | Returns an alignment array containing either the provided values, or the global values if nothing was provided |
| `_setFont` | **Replacement for draw_set_font** Sets the font and updates the font global tracking |
| `_setFontStyle` | Allows you to change a font style on the fly | !Edit this function to add your own fonts! |
| `_baseFont` | Returns the font family of the font | !Edit this function to add your own fonts! |

### beat
Beats are a special array format that lets you increase a value at a steady rate (at the increment and frequency) you choose. You can make them loop or fluctuate and they're easily customisable on the fly without being a hassle to use.  
General useage is simply to use `MyBeat = _beatArray(0, 10, 1)` in the creation of the object and `MyBeat = _beat(MyBeat)` in the step event then access `MyBeat[aBeat.value]` to get the value at any time.  
Beat arrays use the format: `[eBeat.value, eBeat.min, eBeat.max, eBeat.increment, eBeat.rate]` and can be indexed with the `aBeat` enum.

| Function Name | Description |
| --- | --- |
| `_beat` | Increment a beat |
| `_beatArray` | Creates a new beat array to be used with \_beat |

### dsmap
Extra options for working with DSMap data structures.

| Function Name | Description |
| --- | --- |
| `_dsMapCreate` | Create a new DSMap and add whatever values you want to it |
| `_dsMapValue` | Retrieve the value from a DSMap, with the option of a defined default value if it doesn't exist in the DSMap |
| `_dsMapAddValues` | Add or change a list of values within a DSMap |
| `_drawDSMap` | Draws the values of a DSMap as strings, with lots of options |

### region
Regions are a special array format that defines a rectangle.
These functions use this predefined format in creative ways to make regions a highly useful time saver.
Regions use the format: `[aRegion.x1, aRegion.y1, aRegion.x2, aRegion.y2, aRegion.w, aRegion.h]` and can be indexed with the `aR` or `aRegion` enums.

| Function Name | Description |
| --- | --- |
| `_validateRegion` | Makes sure the array given is a complete region, generally by calculating missing values |
| `_regionBySize` | Returns a region when given an x, y, width and height |
| `_textRegion` | Returns the region text would fill if it was drawn at x,y (accounts for alignment) |
| `_spriteRegion` | Returns the region a sprite would fill if it was drawn |
| `_alignRegion` | Moves a region based on alignment, an x,y anchor, or both |
| `_alterRegion` | Resize, move and/or pivot a region |
| `_alterRegionByDirection` | Resize, move and/or pivot a region if given a direction (LEFT, RIGHT, UP, DOWN) |
| `_positionInRegion` | Return the x,y of a position relative to a region given an alignment and offset |
| `_mouseInRegion` | Checks if the mouse is in a region, can use the gui mouse position |
| `_mouseInRegions_Array1D` <br> `_mouseInRegions_Array2DRow` <br> `_mouseInRegions_Array2DColumn` | Finds which region the mouse is in when given an array of regions |

### objv
Ease of referencing variables in object instances

| Function Name | Description |
| --- | --- |
| `_objv` | Retrieve the value of a variable from an object instance, with the option to define the default value should it not exist |
| `_objvExists` | Check if a variable exists in an object instance |

### ...misc
Extra functions that don't fit a category

| Function Name | Description |
| --- | --- |
| `_validate` | Convert a input into the correct datatype |
| `_useGUIMouse` | A quick check to see if an event is occuring during the GUI draw step and should use the GUI mouse tracking functions |
