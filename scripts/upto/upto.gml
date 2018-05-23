///upto(input,cap,[loop]);
/// @arg input	{integer}		
/// @arg cap	{integer}			
/// @arg [loop]	{boolean}	(default: false)
/*
	>>Returns	{integer}
*/
#region Arguments
if argument_count < 2 { show_debug_message("ArgError"); return argument[0] };//[!Break!]
var input = argument[0];
var cap = argument[1];
var loop = argument_count > 2 ? argument[2] : false;
var output = 0;
#endregion

input++; 
if loop { output = input > cap ? 0 : input };
else	{ output = input > cap ? cap : input };

return output;