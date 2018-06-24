//_ibetween(a, b, [between])
/// @arg a			{real}	
/// @arg b			{real}	
/// @arg [between]	{real}		(default: 0.5);
#region Arguments & Variables
//Arguments
if argument_count < 2 { show_debug_message("ArgError drawText"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var _a =		argument[0];
var _b =		argument[1];
var _between =	argument_count > 2 ? argument[2]: 0.5;
#endregion

return floor( lerp(_a, _b, _between) );