///checkstate_withregion(region_array,[depth_layer]);
/// @arg region_array	{region}
/// @arg [depth_layer]	{eDepthLayer}	(default: global.DepthLayer)
/*
	>>Returns {eButtonState}
*/
if !infocus() { return eButtonState.disabled }//[!Break!]~~~~~~~~~~~~~~~~~~~~~~>
#region Arguments
if argument_count < 1 { show_debug_message("ArgError"); return false };//[!Break!]~>
var region_array = argument[0];
var depth_layer = argument_count > 1 ? argument[1] : global.DepthLayer;
#endregion

var output = mouse_in_region(region_array,depth_layer) ? ( mouse_check_button(mb_left) ? eButtonState.pressed : eButtonState.mouseover ) : eButtonState.enabled;
return output;
