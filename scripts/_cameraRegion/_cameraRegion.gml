///_cameraRegion([camera]);
/// @arg [camera]	#camera_id#
/*
	<< Returns >> #region#
*/
#region Arguments & Variables
var _camera =	argument_count > 0 ? argument[0] : view_camera[view_current];
#endregion

var _x1 =	camera_get_view_x(_camera);
var _y1 =	camera_get_view_y(_camera);
var _w =	camera_get_view_width(_camera);
var _h =	camera_get_view_height(_camera);
var _x2 =	_x1 + _w;
var _y2 =	_y1 + _h;
	
var output = [_x1, _y1, _x2, _y2, _w, _h];

return output;