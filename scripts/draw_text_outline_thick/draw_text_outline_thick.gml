///draw_text_outline_thick(x,y,string,colour,ol_colour,thickness);
/// @arg x			
/// @arg y
/// @arg string		
/// @arg colour
/// @arg ol_colour
/// @arg thickness
/*
	[Edited 20/3/2018] (variant of: draw_text_outline)
	Draws text with a [coloured] [thickness]px outline
*/
var olX = argument0; 
var olY = argument1; 
var ol_string = argument2; 
var colour = argument3;
var ol_colour = argument4;
var thickness = argument5;

draw_set_colour(ol_colour);
for ( var i=thickness ; i>0 ; i-- ) {
	for ( var j=thickness ; j>0 ; j-- ) {
		draw_text(olX-j,olY,ol_string);
		draw_text(olX+j,olY,ol_string);
		
		draw_text(olX+j,olY-i+1,ol_string);
		draw_text(olX+j,olY+i,ol_string);
		draw_text(olX-j,olY-i+1,ol_string);
		draw_text(olX-j,olY+i,ol_string);
		};
	draw_text(olX,olY+i,ol_string);
	draw_text(olX,olY-i,ol_string);
	};
draw_set_colour(colour);
draw_text(olX,olY,ol_string);
