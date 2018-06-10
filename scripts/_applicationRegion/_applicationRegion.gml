///_applicationRegion();
/// @arg [surface]		#view_id#
/*
	<< Returns >> #region#
*/

var _surface_position =	application_get_position();

var _x1 =	_surface_position[0];
var _y1 =	_surface_position[1];
var _x2 =	_surface_position[2];
var _y2 =	_surface_position[3];
var _w =	surface_get_width(application_surface);
var _h =	surface_get_height(application_surface);
	
var output = [_x1, _y1, _x2, _y2, _w, _h];

return output;