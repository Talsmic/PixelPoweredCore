///parse_array2d(text,spacer,spacer2);
/// @arg text		
/// @arg spacer	
/// @arg spacer2
/*
	[Edited 24/4/2018]
	Converts a string of text into a 2d array
*/

var text = argument0;
var spacer = string(argument1);
var sw = string_length(spacer);
var spacer2 = string(argument2);
var sw2 = string_length(spacer2);
var parse_reference = 1;

ParsedArray2D = 0; //Clear Old Data

//Parse Height
repeat 100 {
	//Find the next spacer
	var position = string_pos(spacer,text);
	//Cut
	if ( position ) {
		ParsedArray2D[parse_reference,0] = string_copy(text,0,position-1);
		text = string_delete(text,1,position+sw-1);
		parse_reference++;
		};
	//If no spacers are found, end the parse.
	if ( position == 0 ) { 
		ParsedArray2D[parse_reference,0] = text;
		parse_reference++;
		break; 
		};
	};
	
//Parse Length
var i; var j;
var temp_array;
for ( i=1 ; i<array_height_2d(ParsedArray2D) ;  i++ ) {
	temp_array = parse_array1d(ParsedArray2D[i,0],spacer2);
	for ( j=1 ; j<array_length_1d(temp_array) ;  j++ ) {
		ParsedArray2D[i,j] = temp_array[j];
		};
	};

//Save parse and Return
global.ParsedArray2D = 0; //Clear Old Data
global.ParsedArray2D = ParsedArray2D; 
return ParsedArray2D;
