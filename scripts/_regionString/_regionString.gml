///_regionString(region_array);
/// @arg region_array	#region#
/*
	<< Returns >> {string}
*/
#region Arguments & Variables
var region_array =	_validateRegion(argument0);
#endregion
		
var output = "[ "
				+ string(region_array[aR.x1]) + ", "
				+ string(region_array[aR.y1]) + ", "
				+ string(region_array[aR.x2]) + ", "
				+ string(region_array[aR.y2]) + ", "
				+ string(region_array[aR.w])  + ", "
				+ string(region_array[aR.h])  
				+" ]"

return output;