/// @desc Debug Only

if ( !DebugDraw ) { exit };

var _draw =		global.DisplayRegion_View;
drawRegionFrame(_draw);

_setFont(ft_Pixis07_Bold);
var _c1 = c_black;
var _c2 = c_white;
var _c3 = c_nature;
var _c4 = c_gray3;
drawText_Outlined(_draw[aR.x1]+20,  _draw[aR.y1]+20, "Resolution:", _c2, _c1);
drawText_Outlined(_draw[aR.x1]+100, _draw[aR.y1]+20, string(Width)+", "+string(Height)+" x"+string(Scaling)+"  ["+string(Width*Scaling)+", "+string(Height*Scaling)+"]", _c3, _c4);
drawText_Outlined(_draw[aR.x1]+20,  _draw[aR.y1]+30, "Window:", _c2, _c1);
drawText_Outlined(_draw[aR.x1]+100, _draw[aR.y1]+30, string(_windowWidth())+", "+string(_windowHeight()), _c3, _c4);
drawText_Outlined(_draw[aR.x1]+20,  _draw[aR.y1]+40, "Display: ", _c2, _c1);
drawText_Outlined(_draw[aR.x1]+100, _draw[aR.y1]+40, string(display_get_width())+", "+string(display_get_height()), _c3, _c4);
drawText_Outlined(_draw[aR.x1]+20,  _draw[aR.y1]+50, "View["+string(view_current)+"]:", _c2, _c1);
drawText_Outlined(_draw[aR.x1]+100, _draw[aR.y1]+50, string(view_get_wport(view_current))+", "+string(view_get_hport(view_current)), _c3, _c4);
drawText_Outlined(_draw[aR.x1]+16,  _draw[aR.y1]+60, "g.Camera["+string(global.PrimaryCamera)+"]:", _c2, _c1);
drawText_Outlined(_draw[aR.x1]+100, _draw[aR.y1]+60, string(camera_get_view_width(global.PrimaryCamera))+", "+string(camera_get_view_height(global.PrimaryCamera)), _c3, _c4);
drawText_Outlined(_draw[aR.x1]+16,  _draw[aR.y1]+70, "v.Camera["+string(view_camera[view_current])+"]:", _c2, _c1);
drawText_Outlined(_draw[aR.x1]+100, _draw[aR.y1]+70, string(camera_get_view_width(view_camera[view_current]))+", "+string(camera_get_view_height(view_camera[view_current])), _c3, _c4);
var _surf = _applicationRegion();
drawText_Outlined(_draw[aR.x1]+20,  _draw[aR.y1]+80, "Surface:", _c2, _c1);
drawText_Outlined(_draw[aR.x1]+100, _draw[aR.y1]+80, _regionString(_surf), _c3, _c4);