if ( !DebugDraw ) exit;

_setFont(ft_Pixis06);
drawText_Outlined(global.MouseX+5, global.MouseY+20, string(global.MouseX)   +","+string(global.MouseY),	c_nature, c_nature_dark);
drawText_Outlined(global.MouseX+5, global.MouseY+10, string(global.GUIMouseX)+","+string(global.GUIMouseY), c_shadow, c_shadow_dark);