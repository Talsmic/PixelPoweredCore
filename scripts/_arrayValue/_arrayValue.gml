///_arrayValue(input_array,[value_id],[default_output]);
/// @arg input_array		{array}
/// @arg [value_id]			{integer}
/// @arg [overflow_event]	{string}	(default: "cap")
/*
	<< Returns >>	{any} [array][i]
	For when you want a single value from an array and don't want to save the rest of the array		
	[overflow_event] triggers one of the following if the array isn't long enough
		"cap"		returns last value in array
		"first"		returns value [0]
		"zero"		returns 0
		"loop"		loops through the array
*/ 
#region Arguments
if argument_count < 2 { show_debug_message("_arrayValue needs an input and a value"); exit };//[!Break!]
var input_array =		_validateArray(argument[0]);
var value_id =			argument_count > 1 ? argument[1] : 0;
var overflow_event =	argument_count > 2 ? argument[2] : "cap";
#endregion

if ( array_length_1d(input_array) < value_id ) { return input_array[value_id] } else { return 0 };