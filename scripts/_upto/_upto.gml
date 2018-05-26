///_upto(input,cap,[increment],[overflow_event]);
/// @arg input				{real}		
/// @arg cap				{real}			
/// @arg [increment]		{real}		(default: 1)
/// @arg [overflow_event]	{string}	(default: "stop")
/*
	<< Returns >>	{integer}
	Increases [input] by [increment] but only if it won't go over [cap]
	[overflow_event] triggers one of the following if [input] would exceed [cap]:
		"stop"		returns input unchanged
		"cap"		returns cap
		"zero"		returns 0
		"loop"		returns the overflow amount
		"allow"		returns input+increment, but only if input was lower than cap before _upto
*/
#region Arguments
if argument_count < 2 { show_debug_message("_upto requires an input and cap"); return argument[0] };//[!Break!]
var input =			 argument[0];
var cap =			 argument[1];
var increment =		 argument_count > 2 ? argument[2] : 1;
var overflow_event = argument_count > 3 ? argument[3] : "stop";
var output;
#endregion

output = input + increment;

if ( output > cap ) {
	switch ( overflow_event ) {
		
		default:
		case "stop":		return input;
		case "cap":			return cap;
		case "zero":		return 0;
		case "loop":		return output-input;
		case "allow":		return input > cap ? input : output ;
	
		};
	};

return output;