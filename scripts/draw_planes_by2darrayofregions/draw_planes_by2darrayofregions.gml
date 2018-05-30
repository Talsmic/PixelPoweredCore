///_drawPlanes_by2darrayofregions({array_of_regions},[outline]);
/// @arg array_of_regions	{array|regions}	
/// @arg [outline]	{boolean+}			(default: 2) [false, true&thickness]
/*
	[[ Draws ]] multiple regions
	This is really just a debug tool
*/
#region Arguments
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var array_of_regions = argument[0];
var outline =	argument_count > 1 ? argument[1] : 2;
#endregion

for ( var i=0; i<array_height_2d(array_of_regions); ++i ) {
	for ( var j=0; j<array_length_2d(array_of_regions,i); ++j ) {
		var region_array = array_of_regions[i,j];
		if is_array(region_array) {
			_drawPlane(region_array[eR.x1],region_array[eR.y1],region_array[eR.w],region_array[eR.h],find_colour(j),draw_get_alpha(),0,outline);
			};
		};
	};