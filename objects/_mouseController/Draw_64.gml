/// @desc Debug Overlays
if ( !DebugDrawGUI ) exit;
DebugDraw_CursorTracker =	true;
DebugDraw_Vars =			true;
DebugDraw_WindowOutputs =	true;
DebugDraw_DeviceOutputs =	true;

var _region = global.DisplayRegion_GUI;
var colA =  5;
var colAA = 32;
var colB =  150;
var row =   10;
var r =		0;

_setFont(ft_Pixis06);
_setAlign([fa_left, fa_bottom]);

if ( DebugDraw_Vars ) { #region
	
	//Titles
	drawText_Outlined(_region[aR.x1]+colA,  _region[aR.y2]-5-row*(2+r), "global.",												c_power, c_power_dark);
	drawText_Outlined(_region[aR.x1]+colAA, _region[aR.y2]-5-row*(2+r), "Mouse[X/Y]:",											c_potency, c_potency_dark);
	drawText_Outlined(_region[aR.x1]+colA,  _region[aR.y2]-5-row*(1+r), "global.",												c_power, c_power_dark);
	drawText_Outlined(_region[aR.x1]+colAA, _region[aR.y2]-5-row*(1+r), "GUIMouse[X/Y]:",										c_potency, c_potency_dark);
	drawText_Outlined(_region[aR.x1]+colA,  _region[aR.y2]-5-row*(0+r), "mouse_[x/y]:",											c_recovery, c_recovery_dark);
	
	//Values
	drawText_Outlined(_region[aR.x1]+colB,  _region[aR.y2]-5-row*(2+r), string(global.MouseX)+", "+string(global.MouseY),			c_nature, c_nature_dark);
	drawText_Outlined(_region[aR.x1]+colB,  _region[aR.y2]-5-row*(1+r), string(global.GUIMouseX)+", "+string(global.GUIMouseY),		c_potency, c_potency_dark);
	drawText_Outlined(_region[aR.x1]+colB,  _region[aR.y2]-5-row*(0+r), string(mouse_x)+", "+string(mouse_y),						c_nature, c_nature_dark);

	r += 3.5;
	
	};	#endregion
	
if ( DebugDraw_WindowOutputs ) { #region
	
	//Titles
	drawText_Outlined(_region[aR.x1]+colA,  _region[aR.y2]-5-row*(3+r), "display_mouse_get_[x/y]()",							c_speed, c_speed_dark);
	drawText_Outlined(_region[aR.x1]+colA,  _region[aR.y2]-5-row*(2+r), "window_mouse_get_[x/y]()",								c_speed, c_speed_dark);
	drawText_Outlined(_region[aR.x1]+colA,  _region[aR.y2]-5-row*(1+r), "window_view_mouse_get_[x/y](0)",						c_speed, c_speed_dark);
	drawText_Outlined(_region[aR.x1]+colA,  _region[aR.y2]-5-row*(0+r), "window_views_mouse_get_[x/y]()",						c_speed, c_speed_dark);
	
	//Values
	drawText_Outlined(_region[aR.x1]+colB,  _region[aR.y2]-5-row*(3+r), string(display_mouse_get_x())+", "+string(display_mouse_get_y()),												c_speed, c_speed_dark);
	drawText_Outlined(_region[aR.x1]+colB,  _region[aR.y2]-5-row*(2+r), string(window_mouse_get_x())+", "+string(window_mouse_get_y()),													c_shadow, c_shadow_dark);
	drawText_Outlined(_region[aR.x1]+colB,  _region[aR.y2]-5-row*(1+r), string(window_view_mouse_get_x(global.PrimaryView))+", "+string(window_view_mouse_get_y(global.PrimaryView)),	c_power, c_power_dark);
	drawText_Outlined(_region[aR.x1]+colB,  _region[aR.y2]-5-row*(0+r), string(window_views_mouse_get_x())+", "+string(window_views_mouse_get_y()),										c_power, c_power_dark);

	r += 4.5;
	
	};	#endregion	
	
if ( DebugDraw_DeviceOutputs ) { #region
	
	//Titles
	drawText_Outlined(_region[aR.x1]+colA,  _region[aR.y2]-5-row*(2+r), "device_mouse_[x/y](0)",								c_speed, c_speed_dark);
	drawText_Outlined(_region[aR.x1]+colA,  _region[aR.y2]-5-row*(1+r), "device_mouse_raw_[x/y](0)",							c_speed, c_speed_dark);
	drawText_Outlined(_region[aR.x1]+colA,  _region[aR.y2]-5-row*(0+r), "device_mouse_[x/y]_to_gui(0)",							c_speed, c_speed_dark);
	
	//Values
	drawText_Outlined(_region[aR.x1]+colB,  _region[aR.y2]-5-row*(2+r),string(device_mouse_x(0))+", "+string(device_mouse_y(0)),														c_nature, c_nature_dark);
	drawText_Outlined(_region[aR.x1]+colB,  _region[aR.y2]-5-row*(1+r),string(device_mouse_raw_x(0))+", "+string(device_mouse_raw_y(0)),												c_shadow, c_shadow_dark);
	drawText_Outlined(_region[aR.x1]+colB,  _region[aR.y2]-5-row*(0+r), string(device_mouse_x_to_gui(0))+", "+string(device_mouse_y_to_gui(0)),											c_potency, c_potency_dark);

	r += 3.5;
	
	};	#endregion	

if ( DebugDraw_CursorTracker ) { #region
	
	_setFont(ft_Pixis06);
	_setAlign(fa_left, fa_top)
	drawText_Outlined(global.GUIMouseX+5, global.GUIMouseY+20, string(global.MouseX)   +","+string(global.MouseY),	c_nature, c_nature_dark);
	drawText_Outlined(global.GUIMouseX+5, global.GUIMouseY+10, string(global.GUIMouseX)+","+string(global.GUIMouseY), c_shadow, c_shadow_dark);
	
	};	#endregion