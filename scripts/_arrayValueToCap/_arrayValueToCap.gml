///_arrayValueToCap(input_array,value_id);
/// @arg input				{array}		
/// @arg value				{integer}		
/*
	<< Returns >>	
*/
#region Arguments & Variables
//Arguments
var _input_array =	argument0;
var _value =		argument1;
//Other Variables
var _cap =			array_length_1d(_input_array)-1;
#endregion

if ( !_cap ) { return _input_array[0] };//[!Break!]
if ( _value > _cap ) { _value = _cap };

var _output = _input_array[_value]

//show_debug_message("_arrayValue["+string(argument1)+"/"+string(_cap)+"] = "+string(_value));

return _output;