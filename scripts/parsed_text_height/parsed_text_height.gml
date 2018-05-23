///parsed_text_height(max_width,seperator_size);
/// @arg max_width		
/// @arg seperator_size
/*
	[Edited 24/4/2018]
	Returns the height of the currently stored parse_text result
*/

var max_width = argument0;
var sep = argument1;

var text_array = global.ParsedText;
var height = sep;
var width = 0;
var x_position = 0;
var y_position = 0;

//Find Dimensions
for ( var i=1; i<array_length_1d(text_array); i++ ) {
	//Hashed Linebreaks
	if ( text_array[i] == "#" or text_array[i] == "# " or text_array[i] == " # ") {
		x_position = 0; //Reset x
		y_position += sep+1; //Increase y
		continue;
		};
	//Natural Linebreaks
	if ( x_position + string_width(text_array[i]) > max_width ) {
		x_position = 0; //Reset x
		y_position += sep; //Increase y
		};
	//Track Size
    x_position += string_width(text_array[i]);
	};
	
//Return Height
height = y_position + sep + 8;
return height;
