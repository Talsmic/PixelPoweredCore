///parsed_text_width(max_width);
/// @arg max_width		

/*
	[Edited 24/4/2018]
	Returns the width of the currently stored parse_text result
*/

var max_width = argument0;

var text_array = global.ParsedText;
var width = 0;
var x_position = 0;

//Find Dimensions
for ( var i=1; i<array_length_1d(text_array); i++ ) {
	//Hashed Linebreaks
	if ( text_array[i] == "#" or text_array[i] == "# " or text_array[i] == " # ") {
		x_position = 0; //Reset x
		continue;
		};
	//Natural Linebreaks
	if ( x_position + string_width(text_array[i]) > max_width ) {
		x_position = 0; //Reset x
		};
	//Track Size
    x_position += string_width(text_array[i]);
    if ( x_position > width ) { width = x_position + 8 };
	};
	
//Return Width
return width;
