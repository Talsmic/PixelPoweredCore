///uiDraw_dsMap(x,y,dsmap,[ui_settings]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg dsmap			#ds_map#		
/// @arg ui_settings	#ds_map#		
#region Arguments & Variables
if argument_count < 3 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
//Arguments
var _draw_x =		argument[0];
var _draw_y =		argument[1];
var _dsmap =		argument[2];
var _ui_settings =	argument_count > 3 ? argument[1] : 3;
//Other Variables
#endregion

