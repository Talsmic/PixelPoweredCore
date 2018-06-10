///_moveCamera(camera,x,y,[boundary]);
/// @arg camera		#camera_id#
/// @arg x			{real}		
/// @arg y			{real}	
/// @arg boundary	#region#
#region Arguments & Variables
//Arguments
var _camera =	argument[0]
var _x_move =	argument[1]
var _y_move =	argument[2]
var _boundary =	argument_count > 3 ? _validateRegion(argument[3]) : _roomRegion();
//Other Variables
var _camera_x =	camera_get_view_x(_camera);
var _camera_y =	camera_get_view_y(_camera);
#endregion

var _x = clamp(_camera_x+_x_move, _boundary[aR.x1], _boundary[aR.x2]);
var _y = clamp(_camera_y+_y_move, _boundary[aR.y1], _boundary[aR.y2]);

camera_set_view_pos(_camera, _x, _y);