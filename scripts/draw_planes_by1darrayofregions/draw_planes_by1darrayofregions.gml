///draw_planes_by1darrayofregions({array_of_regions},[outline]);
/// @arg array_of_regions	{array|regions}	
/// @arg [outline]	{boolean+}			(default: 2) [false, true&thickness]
/*
	[[ Draws ]] multiple regions
	This is really just a debug tool
*/
#region Arguments
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var array_of_regions = argument[0];
var outline =	argument_count > 1 ? argument[1] : 1;
#endregion

for ( var i=0; i<array_length_1d(array_of_regions); i++ ) {
	var region_array = array_of_regions[i];
	if is_array(region_array) {
		draw_plane(region_array[eR.x1],region_array[eR.y1],region_array[eR.w],region_array[eR.h],find_colour(i),draw_get_alpha(),0,outline);
		};
	};