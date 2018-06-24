/// @desc Debug Overlays
if ( !DebugDraw ) exit;

if ( DebugDraw_CursorTracker ) { #region
	
	_setFont(ft_Pixis06);
	_setAlign(fa_left, fa_top)
	drawText_Outlined(mouse_x+5, mouse_y+20, string(global.MouseX)   +","+string(global.MouseY),	c_nature, c_nature_dark);
	drawText_Outlined(mouse_x+5, mouse_y+10, string(global.GUIMouseX)+","+string(global.GUIMouseY), c_shadow, c_shadow_dark);
	
	};	#endregion