/// @desc Update Camera
if ( !CameraActive ) exit;

var _width =	camera_get_view_width(global.PrimaryCamera);
var _height =	camera_get_view_height(global.PrimaryCamera);

//Update follow region if relative
if ( CameraBorder_Relative[0] > 0 ) { CameraBorder_Object[0] = clamp(round(_width * CameraBorder_Relative[0]) div 2,  1, (_width div 2) - 1);
									  CameraBorder_Object[2] = clamp(round(_width * CameraBorder_Relative[0]) div 2,  1, (_width div 2) - 1) };
if ( CameraBorder_Relative[1] > 0 ) { CameraBorder_Object[1] = clamp(round(_height * CameraBorder_Relative[1]) div 2, 1, (_height div 2) - 1); 
									  CameraBorder_Object[3] = clamp(round(_height * CameraBorder_Relative[1]) div 2, 1, (_height div 2) - 1) };
//_log( CameraBorder_Object );


//Update Boundary
var _boundary = _findRoomBoundary(CameraBorder_Room[0], CameraBorder_Room[1], CameraBorder_Room[2], CameraBorder_Room[3]);

//Find target point or object
var _target =	_alignRegion(_cameraRegion(Camera), [fa_center, fa_middle], [x, y]);
if ( CameraFollowObject ) { 
	_target = _alignRegion(_alterRegion([0,0,0,0,0,0],CameraBorder_Object), [fa_center, fa_middle], [CameraFollowObject.x, CameraFollowObject.y]);
	};	

//Move Camera towards Target
_moveCameraToRegion(Camera, _target, CameraSpeed_X, CameraSpeed_Y, _boundary, CameraSpeed_Multi, CameraSpeed_Interval);

//Snap Camera to Boundary
_snapCameraBoundary(Camera, _boundary);

//Update Stored Variables
CameraX =		camera_get_view_x(Camera);
CameraY =		camera_get_view_y(Camera);
	
//Update View Camera
view_camera[global.PrimaryView] = Camera;