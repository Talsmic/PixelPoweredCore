///draw_parsed_text(x,y,max_width,seperator_size);
/// @arg x		
/// @arg y		
/// @arg max_width		
/// @arg seperator_size
/*
	[Edited 24/4/2018]
	Draws the text outputted by a parse_text command, complete with colour codes
	!USE parse_text FIRST!
*/
var text_array = global.ParsedText;
var colour_array = global.ParsedText_Colour;
var draw_x = argument0;		var x_position = draw_x;
var draw_y = argument1;		var y_position = draw_y;
var max_width = argument2;
var sep = argument3;

//Draw Loop
for ( var i=1 ; i<array_length_1d(text_array) ; i++ ) {
	//Hashed Linebreaks
	if ( text_array[i] == "#" or text_array[i] == "# " or text_array[i] == " # ") {
		x_position = draw_x; //Reset x
		y_position += sep+1; //Increase y
		continue;
		};
	//Natural Linebreaks
	if ( x_position + string_width(text_array[i]) > draw_x + max_width ) {
		x_position = draw_x; //Reset x
		y_position += sep; //Increase y
		};
	//Draw Text
	draw_set_colour( colour_array[i] );
	draw_text( x_position, y_position, text_array[i] );
	x_position += string_width(text_array[i]); //Increase x
	};
