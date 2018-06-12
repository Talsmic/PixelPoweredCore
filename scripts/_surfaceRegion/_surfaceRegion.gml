///_surfaceRegion([surface],[x],[y]);
/// @arg [surface]		#view_id#
/// @arg [x]			{real}
/// @arg [y]			{real}
/*
	<< Returns >> #region#
*/
#region Arguments & Variables
var _surface =	argument_count > 0 ? argument[0] : application_surface;
var _x =		argument_count > 1 ? argument[1] : 0;
var _y =		argument_count > 2 ? argument[2] : 0;
#endregion

var _x1 =	_x;
var _y1 =	_y;
var _w =	surface_get_width(_surface);
var _h =	surface_get_height(_surface);
var _x2 =	_x1 + surface_get_width(_surface);
var _y2 =	_y1 + surface_get_height(_surface);
	
var output = [_x1, _y1, _x2, _y2, _w, _h];

return output;