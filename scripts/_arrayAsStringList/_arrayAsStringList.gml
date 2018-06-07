///_arrayAsStringList(array,[spacer]);
/// @arg array		{array}
/// @arg [spacer]	{string}	(default: "|")
/*
	<< Returns >> {string}
*/
#region Arguments & Variables
var array = argument[0];
var spacer = argument_count > 1 ? argument[1] : "|";
var output = "";
#endregion

for ( var i=0; i<array_length_1d(array); ++i ) {
	if i > 0 { output += spacer };
    output += string(array[i]);
	};
	
return output;