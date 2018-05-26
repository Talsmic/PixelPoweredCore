///_mouseInRegion(region_array,[override_mouse_layer]);
/// @arg region_array			#region#
/// @arg override_mouse_layer	{boolean}	(default: detect) (false: normal, true: gui mouse]
/*
	<< Returns >> {boolean}
*/
#region Arguments
if argument_count < 1 { show_debug_message("ArgError"); return false };//[!Break!]~~~~~>
var region_array =	_validateRegion(argument[0]);
var mouse_layer =	argument_count > 1 ? argument[1] : _useGUIMouse();
#endregion

var m_x = mouse_layer ? global.GUI_MouseX : mouse_x;
var m_y = mouse_layer ? global.GUI_MouseY : mouse_y;

if ( point_in_rectangle(m_x, m_y, region_array[eR.x1], region_array[eR.y1], region_array[eR.x2], region_array[eR.y2]) ) {
	return true;
	};
	
return false;