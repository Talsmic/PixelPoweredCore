///_arrayValue(input_array,value_id,[overflow_event]);
/// @arg input				{array}		
/// @arg value				{integer}			
/// @arg [overflow_event]	#eUpto#		(default: eUpto.loop)
/*
	<< Returns >>	{integer}
	Increases [input] by [increment] but only if it won't go over [cap]
	[overflow_event] triggers one of the following if [input] would exceed [cap]:
		eUpto.cap		returns the last value in the array
		eUpto.first		returns the first value in the array
		eUpto.zero		returns 0
		eUpto.loop		loops through the array to find a value
*/
#region Arguments & Variables
if argument_count < 1 { show_debug_message("_upto requires an input and cap"); return argument[0] };//[!Break!]
//Arguments
var _input_array =	argument[0];
var _value =		argument_count > 1 ? argument[1] : 0 ;
var _event =		argument_count > 2 ? argument[2] : eUpto.loop;
//Other Variables
var _cap =			array_length_1d(_input_array)-1
var _output;
#endregion

if ( !_cap ) { return _input_array[0] };//[!Break!]

if ( _value > _cap ) { 

	switch ( _event ) {
		default:
		case eUpto.loop:		
			var _oldvalue = _value;
			_value = 0;
			do { 
				_value++
				_oldvalue--
				if ( _value > _cap ) { _value = 0 };
				} until ( _oldvalue <= 0 ); 
			break;
		case eUpto.cap:			_value = _cap; break;
		case eUpto.first:		_value = 0; break;
		case eUpto.zero:		return 0;
		};
		
	};

_output = _input_array[_value]

//show_debug_message("_arrayValue["+string(argument[1])+"/"+string(_cap)+"] = "+string(_value));

return _output;