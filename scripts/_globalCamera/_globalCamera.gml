///_globalCamera(width,height,view);
#region Arguments
var _width =	argument0;
var _height =	argument1;
var _view =		argument2;
#endregion

//Create Camera
if ( !global.PrimaryCamera ) {
	global.PrimaryCamera = camera_create_view(0, 0, _width, _height, 0, noone, 0, 0, 0, 0);
	};
if ( !global.RoomCamera ) {
	global.RoomCamera = camera_create_view(0, 0, _width, _height, 0, noone, 0, 0, 0, 0);
	};

camera_set_view_size(global.PrimaryCamera, _width, _height);

//Apply Camera to rooms
for ( var i=1 ; i<=room_last ; ++i ) {
	if( room_exists(i) ) {  
		
		room_set_view_enabled(i, true);
		for ( var j=0 ; j<=7 ; ++j ) {
			room_set_viewport(i, j, false, 0, 0, _width, _height);
			room_set_camera(i, j, global.PrimaryCamera);
			};
		room_set_viewport(i, _view, true, 0, 0, _width, _height);
		room_set_camera(i, _view, global.PrimaryCamera);
		
		};
	};