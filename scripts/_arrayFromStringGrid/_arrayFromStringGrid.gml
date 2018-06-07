///_arrayFromStringGrid(input_string,[datatype],[height_spacers],[length_spacers]);
/// @arg input_string		{string}	
/// @arg [datatype]			#eDataType#				(default: eDataType.string)
/// @arg [height_spacers]	{string} OR {array}		(default: [", ", ","])
/// @arg [length_spacers]	{string} OR {array}		(default: ["|"])
/*
	<< Returns >> {array}
	Converts a string of text into a list, breaking it in to chunks at the defined spacers
*/
#region Arguments & Variables
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var input_string =		argument[0];
var datatype =			argument_count > 1 ? argument[1] : eDataType._string;
var height_spacers =	argument_count > 2 ? _validateArray(argument[2]) : [", ", ","];
var length_spacers =	argument_count > 3 ? _validateArray(argument[3]) : ["|"];
var output = [0,0];
#endregion

var pos;
var array_pos = 1;

//Parse Height
do {	
	//Find the next spacer
	pos = _stringPosFromArray(input_string, height_spacers)
	
	//Cut
	if ( pos[0] ) {
		output[array_pos, 0] = string_copy(input_string, 0, pos[0]-1);
		input_string = string_delete(input_string, 1, pos[0]+pos[3]-1);
		array_pos++;
		};
	else { 
		output[array_pos, 0] = input_string;
		array_pos++;
		break; 
		};
		
	} until ( input_string == "" or !pos[0] )

//Parse Length
var i,j,temp_array;
for ( i=1 ; i<array_height_2d(output) ;  ++i ) {
	
	temp_array = _arrayFromStringList(output[i,0], length_spacers);
	for ( j=1 ; j<array_length_1d(temp_array) ;  ++j ) {
		
		output[i,j] = temp_array[j];
		
		};
		
	};

return output;
