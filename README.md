# PixelPowered Devkit - Expanding GameMakerStudio
Version 0.2.0 - \_utility Edition

## Index
### [\[Core\]: \_utility Library](#_utility)
* [align and font](#align and font) 

## \[Core\]: \_utility Library
### align and font
These functions, working with the \_globalController object, add global tracking to text aligment and font that GMS2 doesn't offer easy access to. This then enables additional functions that play around with them. Align functions use the standard GMS2 alignment definitions of fa_left|fa_top, fa_center|fa_middle, fa_right|fa_bottom.  
A lot of my functions ask for an align_array, this takes the format of  `[h_align, v_align, x_offset (optional), y_offset (optional)]` 

| Function Name | Description | |
| --- | --- |--- |
| `_setAlign` | **Replacement for draw_set_halign and draw_set_valign** Sets the alignment and updates the alignment global tracking |
| `_alignStore` | Returns an alignment array containing either the provided values, or the global values if nothing was provided |
| `_setFont` | **Replacement for draw_set_font** Sets the font and updates the font global tracking |
| `_setFontStyle` | Allows you to change a font style on the fly | Edit this function to add your own fonts |
| `_baseFont` | Returns the font family of the font | Edit this function to add your own fonts |
| `_stringHeight` \ `_stringWidth` | Returns an alignment array containing either the provided values, or the global values if nothing was provided  |
