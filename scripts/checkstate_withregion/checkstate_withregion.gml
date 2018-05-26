///checkstate_withregion(region_array,[override_mouse_layer]);
/// @arg region_array	#region#
/// @arg override_mouse_layer	{boolean}	(default: detect) (false: normal, true: gui mouse]
/*
	<< Returns >> #eButtonState#
*/
if !infocus() { return eButtonState.disabled }//[!Break!]~~~~~~~~~~~~~~~~~~~~~~>
#region Arguments
if argument_count < 1 { show_debug_message("ArgError"); return false };//[!Break!]~>
var region_array = argument[0];
var mouse_layer =	argument_count > 1 ? argument[1] : _useGUIMouse();
#endregion

var output = _mouseInRegion(region_array,mouse_layer) ? ( mouse_check_button(mb_left) ? eButtonState.pressed : eButtonState.mouseover ) : eButtonState.enabled;
return output;
