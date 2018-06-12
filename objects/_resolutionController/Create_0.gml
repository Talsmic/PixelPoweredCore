event_inherited();

//Variables to be found later
Width =				0;
Height =			0;
Scaling =			0;
Resize_Width =		0;
Resize_Height =		0; 
Resize_Scaling =	0;
Check_Width =		0;
Check_Height =		0; 

//Default Variables
//Ideal Resolution
IdealWidth =		480;
IdealHeight =		270;
IdealScaling =		2;

//Minimum Resolution
MinWidth =			200;
MinHeight =			200;
MinScaling =		1;
//Maximum Resolution
MaxWidth =			512;
MaxHeight =			512;
MaxScaling =		5;
	
//Other
Breakpoint =		0.5;
MarginColour =		c_orange;
MarginWidth =		0;
MarginHeight =		0;
Fullscreen =		false;
FullscreenToggle =	true;
LockScaling =		false;
RefreshRate =		5;
DebugDraw =			false; 
DebugDrawGUI =		false;
visible =			true;

//Events
Event_ResizeResolution =	true; //alarm[0]
Event_CenterScreen =		false; //alarm[1]
Event_ResizeWindow =		false; //alarm[2]
Event_SizeCheck =			false; //alarm[3]
DrawApplicationSurface =	false;//true;

//Set Resolution
_windowResize(IdealWidth, IdealHeight, IdealScaling);
_globalCamera(IdealWidth, IdealHeight, global.PrimaryView);

//Store variables to detect for required resolution changes
Stored_Width =		_windowWidth();
Stored_Height =		_windowHeight();
Stored_Room =		room;

//Resolution Regions
global.DisplayRegion =			_regionBySize(0, 0, 0, 0);
global.DisplayRegion_Scaled =	_regionBySize(0, 0, 0, 0);
global.DisplayRegion_View =		_viewRegion(global.PrimaryView);
global.DisplayRegion_GUI =		_guiRegion();

alarm[0] = 1; //Resolution Updates
alarm[9] = 2; //Low Priority Updates
