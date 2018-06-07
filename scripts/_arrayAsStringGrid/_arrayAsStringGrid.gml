///_arrayAsStringGrid(array,[spacer]);
/// @arg array		{array}
/// @arg [spacer]	{string}	(default: ",")
/// @arg [spacer2]	{string}	(default: "|")
/*
	<< Returns >> {string}
*/
#region Arguments & Variables
var array = argument[0];
var spacer = argument_count > 1 ? argument[1] : ",";
var spacer2 = argument_count > 2 ? argument[2] : "|";
var output = "";
#endregion

for ( var i=0; i<array_height_2d(array); ++i ) {
	if i > 0 { output += spacer2 };
	for ( var j=0; j<array_length_2d(array, i); ++j ) {
		if j > 0 { output += spacer };
		output += string(array[i, j]);
		};
	};
	
return output;