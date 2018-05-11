///parse_array1d(text,spacer);
/// @arg text		
/// @arg spacer
/*
	[Edited 24/4/2018]
	Converts a string of text into a list
*/

var text = argument0;
var spacer = string(argument1);
var sw = string_length(spacer);
var parse_reference = 1;

ParsedArray = 0; //Clear Old Data

//Parse
repeat 100 {
	//Find the next spacer
	var position = string_pos(spacer,text);
	//Cut
	if ( position ) {
		ParsedArray[parse_reference] = string_copy(text,0,position-1);
		text = string_delete(text,1,position+sw-1);
		parse_reference++;
		};
	//If no spacers are found, end the parse.
	if ( position == 0 ) { 
		ParsedArray[parse_reference] = text;
		parse_reference++;
		break; 
		};
	};

//Save parse and Return
global.ParsedArray = 0; //Clear Old Data
global.ParsedArray = ParsedArray; 
return ParsedArray;
