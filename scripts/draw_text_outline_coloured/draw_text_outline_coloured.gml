///draw_text_outline_coloured(x,y,string,colour,ol_colour);
/// @arg x			
/// @arg y
/// @arg string		
/// @arg colour
/// @arg ol_colour
/*
	[Edited 11/5/2017] (variant of: draw_text_outline)
	Draws text with a [coloured] 1px outline
*/
var olX = argument0; 
var olY = argument1; 
var ol_string = argument2; 
var colour = argument3;
var ol_colour = argument4;

draw_set_colour(ol_colour);
draw_text(olX+1,olY-1,ol_string);
draw_text(olX+1,olY,ol_string);
draw_text(olX+1,olY+1,ol_string);
draw_text(olX-1,olY-1,ol_string);
draw_text(olX-1,olY,ol_string);
draw_text(olX-1,olY+1,ol_string);
draw_text(olX,olY+1,ol_string);
draw_text(olX,olY-1,ol_string);
draw_set_colour(colour);
draw_text(olX,olY,ol_string);
