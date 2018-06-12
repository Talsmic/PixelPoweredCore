///_setClass_Camera();

//Parent Class: None
//  ---

#region Default Flags

visible	=				false;
persistent =			false;
solid =					false;

#endregion

#region Variable Definitions

CameraView =			-1;		//-1 for global.PrimaryView
CameraX =				x;
CameraY =				y;
CameraWidth =			_resolutionController.Width;
CameraHeight =			_resolutionController.Height;

CameraSpeed_X =			2;
CameraSpeed_Y =			2;
CameraSpeed_Multi =		2;
CameraSpeed_Interval =  0.1;
CameraBorder_Room =		[0, 0, 0, 0];
CameraBorder_Object =	[80, 80, 80, 80];
CameraBorder_Relative = [1, 1]

CameraFollowObject =	noone;
CameraActive =			true;
DebugDraw =				false;
DebugDrawGUI =			false;

#endregion

#region Event: Creation

Camera =	camera_create_view(CameraX, CameraY, CameraWidth, CameraHeight, 0, -1, 0, 0, 0, 0);

#endregion
