///parse_array1d(text,[spacer]);
/// @arg text		{string}	
/// @arg [spacer]	{string}	(default: "|")
/*
	Converts a string of text into a list
*/
#region Arguments
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~>
var text =	 argument[0];
var spacer = argument_count > 1 ? argument[1] : "|";
#endregion

var parsed_array = [0];
var spacer_size = string_length(spacer);
var parse_ref = 1;
var position = 0;

//Parse
do {
	//Find the next spacer
	position = string_pos(spacer,text);
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
	} until ( text == "" or !position )

//Save parse and Return
global.ParsedArray = 0; //Clear Old Data
global.ParsedArray = parsed_array; 
return parsed_array;
