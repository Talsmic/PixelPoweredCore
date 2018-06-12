if ( !DebugDrawGUI ) exit;

var _region = global.DisplayRegion_GUI;
_setFont(ft_Pixis07_Bold);
_setAlign(fa_left, fa_bottom);
drawText_Outlined(_region[aR.x2]+25, _region[aR.y1]+5, "mouse_:",												c_nature, c_nature_dark);
drawText_Outlined(_region[aR.x2]+25, _region[aR.y1]+50, string(mouse_x)+","+string(mouse_y),					c_nature, c_nature_dark);
drawText_Outlined(_region[aR.x2]+15, _region[aR.y1]+5, "Mouse:",												c_nature, c_nature_dark);
drawText_Outlined(_region[aR.x2]+15, _region[aR.y1]+50, string(global.MouseX)+","+string(global.MouseY),		c_nature, c_nature_dark);
drawText_Outlined(_region[aR.x2]+5,  _region[aR.y1]+5, "GUIMouse:",												c_shadow, c_shadow_dark);
drawText_Outlined(_region[aR.x2]+5,  _region[aR.y1]+50, string(global.GUIMouseX)+","+string(global.GUIMouseY),	c_shadow, c_shadow_dark);