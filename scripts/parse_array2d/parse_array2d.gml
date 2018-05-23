///parse_array2d(text,[spacerA],[spacerB]);
/// @arg text		{string}	
/// @arg [spacerA]	{string}	(default: "|")
/// @arg [spacerB]	{string}	(default: ",")
/*
	Converts a string of text into a grid
*/
#region Arguments
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~>
var text =	 argument[0];
var spacerA = argument_count > 1 ? argument[1] : "|";
var spacerB = argument_count > 2 ? argument[2] : ",";
#endregion

var parsed_array = 0;
var spacer_size = string_length(spacerA);
var parse_ref = 1;
var position = 0;

//Parse Height
do {
	//Find the next spacer
	position = string_pos(spacerB,text);
	//Cut
	if position {
		parsed_array[parse_ref] = string_copy(text,0,position-1);
		text = string_delete(text,1,position+spacer_size-1);
		parse_ref++;
		};
	else { 
		parsed_array[parse_ref] = text;
		parse_ref++;
		break; 
		};
	}
until ( text == "" or !position );

spacer_size = string_length(spacerB);
position = 0;

//Parse Length
var i,j,temp_array;
for ( i=1 ; i<array_height_2d(parsed_array) ;  i++ ) {
	temp_array = parse_array1d(parsed_array[i,0],spacerB);
	for ( j=1; j<array_length_1d(temp_array);  j++ ) {
		parsed_array[i,j] = temp_array[j];
		};
	};

//Save parse and Return
global.ParsedArray = 0; //Clear Old Data
global.ParsedArray = parsed_array; 
return parsed_array;