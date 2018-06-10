
//Create actual camera
Camera =				camera_create_view(x, y, camera_get_view_width(global.PrimaryCamera), camera_get_view_height(global.PrimaryCamera), 0, -1, 0, 0, 0, 0);

//Camera view dimensions
CameraX =				x;
CameraY =				y;
CameraWidth =			_resolutionController.Width;
CameraHeight =			_resolutionController.Height;
CameraMagnification =	1;
CameraAngle =			0;

//Camera speeds
CameraSpeed_X =			2;
CameraSpeed_Y =			2;
CameraSpeed_Multi =		2;
CameraSpeed_Interval =  0.1;

//Camera borders
CameraBorder_Room =		[0, 0, 0, 0];
CameraBorder_Object =	[80, 80, 80, 80];
CameraBorder_Relative = [1, 1]

CameraFollowObject =	-1;
CameraActive =			true;
DrawTo_View =			-1; //-1 for global.PrimaryView
DebugDrawGUI =			true;