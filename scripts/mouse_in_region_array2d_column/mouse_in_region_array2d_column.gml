///mouse_in_region_array2d_column(array_of_regions,column,[depth_layer]);
/// @arg array_of_regions	{array|regions}
/// @arg column				{integer}
/// @arg [depth_layer]		{eDepthLayer}	(default: global.DepthLayer)
/*
	>>Returns {integer} The first region in the array the mouse is found in
*/
#region Arguments
var array_of_regions = fix_region(argument[0]);
var column = argument[1];
var depth_layer = argument_count > 1 ? argument[1] : global.DepthLayer;
var m_x = (depth_layer == eDepthLayer.GUI) ? global.GUI_MouseX : mouse_x;
var m_y = (depth_layer == eDepthLayer.GUI) ? global.GUI_MouseY : mouse_y;
var region_array = 0;
#endregion

for ( var i=0; i<array_height_2d(array_of_regions); i++ ) {
	if array_length_2d(region_array,i) <= column continue;
	region_array = array_of_regions[i,column]
	if is_array(region_array) {
		if point_in_rectangle(m_x, m_y, region_array[eR.x1], region_array[eR.y1], region_array[eR.x2], region_array[eR.y2]) {
			return i;
			};
		};
	};
	
return 0;