///_arrayValue(input_array,value_id,[overflow_event]);
/// @arg input				{array}		
/// @arg value				{integer}			
/// @arg [overflow_event]	#eUpto#		(default: eUpto.loop)
/*
	<< Returns >>	{integer}
	Increases [input] by [increment] but only if it won't go over [cap]
	[overflow_event] triggers one of the following if [input] would exceed [cap]:
		"cap"		returns the last value in the array
		"first"		returns the first value in the array
		"zero"		returns 0
		"loop"		loops through the array to find a value
*/
#region Arguments & Variables
if argument_count < 2 { show_debug_message("_upto requires an input and cap"); return argument[0] };//[!Break!]
//Arguments
var _input_array =	argument[0];
var _value =		argument[1];
var _event =		argument_count > 2 ? argument[2] : eUpto.loop;
//Other Variables
var _cap =			array_length_1d(_input_array)
var _output;
#endregion

if ( _cap > _value ) { 

	switch ( _event ) {
		default:
		case eUpto.loop:		do { _value -= _cap } until ( _cap > _value ); _value += _cap;  break;
		case eUpto.cap:			_value = _cap; break;
		case eUpto.first:		_value = 0; break;
		case eUpto.zero:		return 0;
		};
		
	};

_output = _input_array[_value]

return _output;