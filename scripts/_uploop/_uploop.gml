///_uploop(input,cap,[base],[increment]);
/// @arg input			{real}		
/// @arg cap			{real}			
/// @arg [base]			{real}		(default: 0)
/// @arg [increment]	{real}		(default: 1)
/*
	<< Returns >>	{integer}
*/
#region Arguments & Variables
if argument_count < 2 { show_debug_message("_uploop requires an input and cap"); return argument[0] };//[!Break!]
//Arguments
var _input =		argument[0];
var _cap =			argument[1];
var _base =			argument_count > 2 ? argument[2] : 0;
var _increment =	argument_count > 3 ? argument[3] : 1;
//Other Variables
var _output;
#endregion

_output = _input + _increment;

if ( _output > _cap ) {	
	_output = _base + (_output mod _cap) - 1;	
	};

show_debug_message("_uploop["+string(_input + _increment)+"/"+string(_cap)+"] = "+string(_output));

return _output;