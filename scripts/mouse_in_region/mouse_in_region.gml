///mouse_in_region(region_array,[depth_layer]);
/// @arg region_array		{region}
/// @arg [depth_layer]	{eDepthLayer}	(default: global.DepthLayer)
/*
	>>Returns {boolean}
*/
#region Arguments
var region_array = fix_region(argument[0]);
var depth_layer = argument_count > 1 ? argument[1] : global.DepthLayer;
var m_x = (depth_layer == eDepthLayer.GUI) ? global.GUI_MouseX : mouse_x;
var m_y = (depth_layer == eDepthLayer.GUI) ? global.GUI_MouseY : mouse_y;
#endregion

if point_in_rectangle(m_x, m_y, region_array[eR.x1], region_array[eR.y1], region_array[eR.x2], region_array[eR.y2]) {
	return true;
	};
	
return false;