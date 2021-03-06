///_mouseInRegion(region_array,[gui_layer]);
/// @arg region_array	#region#
/// @arg gui_layer		{boolean}	(default: detects)
/*
	<< Returns >> {boolean}
*/
#region Arguments & Variables
if argument_count < 1 { show_debug_message("ArgError"); return false };//[!Break!]~~~~~>
var region_array =	_validateRegion(argument[0]);
var mouse_layer =	argument_count > 1 ? argument[1] : _useGUIMouse();
#endregion

var m_x = mouse_layer ? global.GUIMouseX : mouse_x;
var m_y = mouse_layer ? global.GUIMouseY : mouse_y;

if ( point_in_rectangle(m_x, m_y, region_array[aR.x1], region_array[aR.y1], region_array[aR.x2], region_array[aR.y2]) ) {
	return true;
	};
	
return false;