///array_to_string(array,[spacer]);
/// @arg array		{array}
/// @arg [spacer]	{string}	(default: "|")
/*
	>>Returns {string}
*/
#region Arguments
var array = argument[0];
var spacer = argument_count > 1 ? argument[1] : "|";
var output = "";
#endregion

for ( var i=1; i<array_length_1d(array); i++ ) {
	if i > 1 { output += "|" };
    output += string(array[i]);
	};
	
return output;