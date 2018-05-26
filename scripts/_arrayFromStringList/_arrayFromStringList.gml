///_arrayFromStringList(input_string,[datatype],[spacer_array]);
/// @arg input_string	{string}	
/// @arg [datatype]		#eDataType#				(default: eDataType.string)
/// @arg [spacer_array]	{string} or {array}		(default: ["|", ", ", ","])
/*
	<< Returns >> {array}
	Converts a string of text into a list, breaking it in to chunks at the defined spacers
*/
#region Arguments
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var input_string =	argument[0];
var datatype =		argument_count > 1 ? argument[1] : eDataType._string;
var spacer_array =	argument_count > 2 ? _validateArray(argument[2]) : ["|", ", ", ","];
var output = [0];
#endregion

var pos;
var array_pos = 1;

//Parse
do {	
	//Find the next spacer
	pos = _stringPosFromArray(input_string, spacer_array)
	
	//Cut
	if ( pos[0] ) {
		output[array_pos] = string_copy(input_string, 0, pos[0]-1);
		input_string = string_delete(input_string, 1, pos[0]+pos[3]-1);
		array_pos++;
		};
	else { 
		output[array_pos] = input_string;
		array_pos++;
		break; 
		};
		
	} until ( input_string == "" or !pos[0] )

return output;
