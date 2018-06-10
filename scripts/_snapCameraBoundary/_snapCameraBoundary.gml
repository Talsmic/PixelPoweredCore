///_snapCameraBoundary(camera,[boundary]);
/// @arg camera				#camera_id#
/// @arg boundary			#region#	
#region Arguments & Variables
//Arguments
var _camera =		argument[0];
var _boundary =		argument_count > 1 ? _validateRegion(argument[1]) : _roomRegion();
//Other Variables
var _camera_region = _cameraRegion(_camera);
var _x =			_camera_region[aR.x1];
var _y =			_camera_region[aR.y1];
#endregion

if ( _boundary[aR.x1] > _camera_region[aR.x1] ) { 	_x = _boundary[aR.x1]							};
if ( _boundary[aR.x2] < _camera_region[aR.x2] ) { 	_x = _boundary[aR.x2] - _camera_region[aR.w]	};
if ( _boundary[aR.y1] > _camera_region[aR.y1] ) { 	_y = _boundary[aR.y1]							};
if ( _boundary[aR.y2] < _camera_region[aR.y2] ) { 	_y = _boundary[aR.y2] - _camera_region[aR.h]	};

//Update Camera
camera_set_view_pos(_camera, _x, _y);