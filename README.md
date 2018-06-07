# PixelPowered Devkit - Expanding GameMakerStudio
Version 0.2.0 - \_utility Edition

## Index
### [\[Core\]: \_utility Library](#_utility)
* [align and font](#align and font) 

## \[Core\]: \_utility Library

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

### array
A set of very useful functions for getting exactly what you need from arrays with ease

| Function Name | Description |
| --- | --- |
| `_validateArray` | Allows you to clamp a 1D array inbetween a range of lengths, provides options for how to decide extended values |
| `_arrayValue` | Returns a value from the given 1D array, provides options for if the array isn't long enough, such as looping through the array |
| `_arrayRowAsArray` `_arrayColumnAsArray` | Returns the specific row or column from a 2D array as a 1D array |
| `_arrayFromStringList` `_arrayAsStringList`  | Converts between a string list (of format "X|Y|Z" or similar) and a 1D array |
| `_arrayFromStringGrid` `_arrayAsStringGrid` |  Converts between a string list (of format "X1,X2|Y1,Y2,Y3|Z" or similar) and a 2D array |
| `_arrayDrawVertical`  `_arrayDrawHorizontal` |  Draw the values of a 1D array as strings |
| `_arrayDrawGrid` |  Draw the values of a 2D array as strings |
| `_arrayContains` | Check if a value exists in a 1D/2D array (does not return it's location) |
| `_arrayCompare_Greaters` `_arrayCompare_Equals` `_arrayCompare_NotEquals` | Compare values in two 1D/2D arrays |
| `_arrayAppend` | Attach a value or 1D array to the end of another value or 1D array to return a single 1D array |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |

### beat
Expanding your options with arrays

| Function Name | Description |
| --- | --- |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |

### boolean
Expanding your options with arrays

| Function Name | Description |
| --- | --- |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |

### string
Expanding your options with strings

| Function Name | Description |
| --- | --- |
| `_stringClip` | Reduces the length of the string to the requested length, adding an optional marker if it changed in size |
| `_stringHeight`  `_stringWidth` | **Alternatives to string_get_height / string_get_width** Allows you to check the height or width of a string with a specific font |
| `_stringPosFromArray` | Finds the position of the first substring in an array when given an array of substrings, and returns an array of useful information about the winning substring |

### array
Expanding your options with arrays

| Function Name | Description |
| --- | --- |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |

### array
Expanding your options with arrays

| Function Name | Description |
| --- | --- |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |

### array
Expanding your options with arrays

| Function Name | Description |
| --- | --- |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |

### array
Expanding your options with arrays

| Function Name | Description |
| --- | --- |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |


### array
Expanding your options with arrays

| Function Name | Description |
| --- | --- |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |


### array
Expanding your options with arrays

| Function Name | Description |
| --- | --- |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |

### array
Expanding your options with arrays

| Function Name | Description |
| --- | --- |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
| `_validateArray` |  |
