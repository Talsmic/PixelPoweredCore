///buttonStateInRegion(region_array,[keys],[gui_layer]);
/// @arg region_array	#region#
/// @arg [keys]			{array}			(default: -1)
/// @arg [gui_layer]	{boolean}	(default: detects)
/*
	<< Returns >> #eButtonState#
*/
if !inFocus() { return eButtonState.disabled }//[!Break!]~~~~~~~~~~~~~~~~~~~~~~>
#region Arguments & Variables
if argument_count < 1 { show_debug_message("ArgError"); return false };//[!Break!]~>
var _region =		_validateRegion(argument[0]);
var _keys =			argument_count > 1 ? argument[1] : -1;
var _mouse_layer =	argument_count > 2 ? argument[2] : _useGUIMouse();
#endregion

var output = _mouseInRegion(_region, _mouse_layer) ? ( mouse_check_button(mb_left) ? eButtonState.pressed : eButtonState.mouseover ) : eButtonState.enabled;

if ( is_array(_keys) ) {
	
	for ( var i=0 ; i<array_length_1d(_keys) ; ++i ) { if keyboard_check(_keys[i]) { output = eButtonState.pressed } };
	
	};
	
return output;
