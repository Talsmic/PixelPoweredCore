///_booleanString(input,[true_string],[false_string]);
/// @arg input				{boolean}
/// @arg [true_string]		{string}	(default: "True")
/// @arg [false_string]		{string}	(default: "False")
#region Arguments & Variables
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
//Arguments
var true_string =	argument_count > 1 ? string(argument[1]) : "True";
var false_string =	argument_count > 2 ? string(argument[2]) : "False";
#endregion

if argument0 { return true_string } else { return false_string };