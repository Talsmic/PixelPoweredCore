///_surfaceRegion([surface]);
/// @arg [surface]		#view_id#
/*
	<< Returns >> #region#
*/
#region Arguments & Variables
var _surface =	argument_count > 0 ? argument[0] : application_surface;
#endregion

var _x1 =	0;
var _y1 =	0;
var _w =	surface_get_width(_surface);
var _h =	surface_get_height(_surface);
var _x2 =	surface_get_width(_surface);
var _y2 =	surface_get_height(_surface);
	
var output = [_x1, _y1, _x2, _y2, _w, _h];

return output;