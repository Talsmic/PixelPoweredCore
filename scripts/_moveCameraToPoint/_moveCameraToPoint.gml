///_moveCameraToPoint(camera,target_x,target_y,[x_speed],[y_speed]);
/// @arg camera		#camera_id#
/// @arg target_x	{real}		
/// @arg target_y	{real}	
/// @arg [x_speed]	{real}		
/// @arg [y_speed]	{real}	
#region Arguments & Variables
//Arguments
var _camera =		argument[0]
var _x_target =		argument[1]
var _y_target =		argument[2]
var _x_speed =		argument_count > 3 ? argument[3] : -1; //-1 = instant
var _y_speed =		argument_count > 4 ? argument[4] : -1; //-1 = instant
//Other Variables
var _camera_x =		camera_get_view_x(_camera);
var _camera_y =		camera_get_view_y(_camera);
var _x =			_camera_x;
var _y =			_camera_y;
#endregion

//Move X
if ( _x_target > _camera_x ) { 
	if ( _x_speed > 0 )   { var _x = clamp(_camera_x+_x_speed, _camera_x, _x_target) };
	if ( _x_speed == -1 ) { var _x = _x_target };
	};
if ( _x_target < _camera_x ) { 
	if ( _x_speed > 0 )   { var _x = clamp(_camera_x-_x_speed, _x_target, _camera_x) };
	if ( _x_speed == -1 ) { var _x = _x_target };
	};

//Move Y
if ( _y_target > _camera_y ) { 
	if ( _y_speed > 0 )   { var _y = clamp(_camera_y+_y_speed, _camera_y, _y_target) };
	if ( _y_speed == -1 ) { var _y = _y_target };
	};
if ( _y_target < _camera_y ) { 
	if ( _y_speed > 0 )   { var _y = clamp(_camera_y-_y_speed, _y_target, _camera_y) };
	if ( _y_speed == -1 ) { var _y = _y_target };
	};

//Update Camera
camera_set_view_pos(_camera, _x, _y);