///_upto(input,cap,[increment],[overflow_event]);
/// @arg input				{real}		
/// @arg cap				{real}			
/// @arg [increment]		{real}		(default: 1)
/// @arg [overflow_event]	#eUpto#	(default: eUpto.stop)
/*
	<< Returns >>	{integer}
	Increases [input] by [increment] but only if it won't go over [cap]
	[overflow_event] triggers one of the following if [input] would exceed [cap]:
		"stop"		returns input unchanged
		"cap"		returns cap
		"zero"		returns 0
		"loop"		loops until a value is under cap
		"allow"		returns input+increment, but only if input was lower than cap before _upto
*/
enum eUpto {
	stop, cap, zero, loop, allow, first };
#region Arguments & Variables
if argument_count < 2 { show_debug_message("_upto requires an input and cap"); return argument[0] };//[!Break!]
//Arguments
var _input =		argument[0];
var _cap =			argument[1];
var _increment =	argument_count > 2 ? argument[2] : 1;
var _event =		argument_count > 3 ? argument[3] : eUpto.stop;
//Other Variables
var _output;
#endregion

_output = _input + _increment;

if ( _output > _cap ) {
	
	switch ( _event ) {		
		default:
		case eUpto.stop:		return _input;
		case eUpto.cap:			return _cap;
		case eUpto.zero:		return 0;
		case eUpto.allow:		return _input > _cap ? _input : _output ;	
		case eUpto.loop:		do { _output -= _cap } until ( _cap > _output );  break;
		};
		
	};

return _output;