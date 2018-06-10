//_resolutionAdapt();
//_log("Resolution Event[0]: Resolution Check");

//Get the current window dimensions
var _window_width =	 _windowWidth();
var _window_height = _windowHeight();

#region Fullscreen Correction
/*	Checks to make sure fullscreen is active if it should be, or turns it off if it shouldn't be.*/
	
if ( window_get_fullscreen() != Fullscreen ) {
	Event_ResizeResolution = true;
	window_set_fullscreen(Fullscreen);
	};
	
#endregion

#region Define Scaling Breakpoints
/*	These dictate how the controller decides what what resoution magnification level to use, based
	on the closest ideal
	The calculation for these breakpoints 
	*/
var _breakpoints_width  = [ 0, MinWidth, MinWidth*2 ]
var _breakpoints_height = [ 0, MinHeight, MinWidth*2 ]
for ( var i=2 ; i<=MaxScaling ; ++i ) {
	
	//Points below Minimum Scaling
	if ( i <= MinScaling ) {
		_breakpoints_width[i]	 = MinWidth;
		_breakpoints_height[i]	 = MinHeight;
		_breakpoints_width[i-1]	 = 0;
		_breakpoints_height[i-1] = 0;
		continue;
		};
	
	//Set to Ideal
	_breakpoints_width[i]  = IdealWidth*i;
	_breakpoints_height[i] = IdealHeight*i;
	
	//Clamp
	_breakpoints_width[i]  = clamp( ceil((IdealWidth*(i-1))+(IdealWidth*Breakpoint) ),   MinWidth*i,  IdealWidth*i);
	_breakpoints_height[i] = clamp( ceil((IdealHeight*(i-1))+(IdealHeight*Breakpoint) ), MinHeight*i, IdealHeight*i);
		
	}; 

#endregion

#region Find new scaling
/*	Forces the resolution of the window to seek an ideal resolution */

if ( !LockScaling ) {
	var _scaling = MinScaling;
	for ( var i=MinScaling ; i<=MaxScaling ; ++i ) {
		
		if ( _window_width >= _breakpoints_width[i] and _window_height >= _breakpoints_height[i] ) {	_scaling = i		}
		else if ( _window_width >= _breakpoints_width[i] and _window_height >= MinHeight*i ) {			_scaling = i		}
		else if ( _window_width >= MinWidth*i and _window_height >= _breakpoints_height[i] ) {			_scaling = i		};
			
		};
	}
else { var _scaling = Scaling };
	
#endregion
	
#region Calculate height and width
var _width	=  _window_width  div _scaling;
var _height	=  _window_height div _scaling;
var _float_w = _window_width  mod _scaling;
var _float_h = _window_height mod _scaling;
MarginWidth  = 0;
MarginHeight = 0;

//Resize window to remove floating pixels if not in fullscreen
if ( !Fullscreen ) {
	
	Resize_Width = _width;
	Resize_Height = _height; 
	Resize_Scaling = _scaling;
	
	if ( _float_h ) {
		_log("Resolution Error[0]: Vertical Floating Pixels Detected");
		Event_ResizeWindow = true;
		};
		
	if ( _float_w ) {
		_log("Resolution Error[0]: Horizontal Floating Pixels Detected");
		Event_ResizeWindow = true;
		};		
		
	};
	
//Clamp width and height
if ( _width > MaxWidth ) { 
	MarginWidth = _width - MaxWidth;
	_width = MaxWidth;
	};
if ( _height > MaxHeight ) { 
	MarginHeight = _height - MaxHeight;
	_height = MaxHeight;
	};

#endregion


#region Apply new height and width (if necessary)

if ( Height != _height or Width != _width ) {
	_log("Resolution Event[0]: Resolution Adapted: ["+string(_width)+","+string(_height)+"]");
	//Update GUI
	display_set_gui_size( _width, _height);
	//Update Surface
	surface_resize(application_surface, _width*_scaling,	_height*_scaling);
	//Update View
	view_set_wport(global.PrimaryView, _width);
	view_set_hport(global.PrimaryView, _height);
	//Update Cameras
	camera_set_view_size(view_camera[global.PrimaryView],	_width,	_height);
	camera_set_view_size(global.PrimaryCamera,				_width,	_height);
	//Store New Values
	Height =	_height;
	Width =		_width;
	Scaling =	_scaling;
	};

#endregion

#region Update Cursor
/*	If RES_Cursor is enabled, this sets the cursor graphic to match the 
	maginfication size of the screen.
	[WIP] I may update this with a better solution down the track*/
	
switch ( _scaling ) {
	case 1: 			cursor_sprite = spr_cursor;		break;
	case 2:				cursor_sprite = spr_cursor_x2;	break;
	case 3:				cursor_sprite = spr_cursor_x3;	break;
	case 4:				cursor_sprite = spr_cursor_x4;	break;
	case 5:	default:	cursor_sprite = spr_cursor_x5;	break;
	}; 
	
#endregion