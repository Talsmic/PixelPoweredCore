//_windowResize(width,height,scaling);
#region Arguments
var _width =	argument0;
var _height =	argument1;
var _scaling =	argument2;
#endregion

var _window_width =	 _width  * _scaling;
var _window_height = _height * _scaling;

//No _resolutionController version
if ( !instance_exists(_resolutionController) ) {
	window_set_size(					_window_width,	_window_height);
	display_set_gui_size(				_width,			_height);		
	surface_resize(application_surface, _window_width,	_window_height);
	exit;
	};

with ( _resolutionController ) {
	
	if ( !Fullscreen ) { 
		
		_log("Resolution Event[2]: Window Resized: ["+string(_windowWidth())+","+string(_windowHeight())+"] > ["+string(_window_width)+","+string(_window_height)+"]");
		window_set_size(					_window_width,	_window_height);
		display_set_gui_size(				_width,			_height);		
		surface_resize(application_surface, _window_width,	_window_height);
		
		Event_SizeCheck = true;
		Event_ResizeResolution = true;
		
		Resize_Width =		_width;
		Resize_Height =		_height; 
		Resize_Scaling =	_scaling;
		Check_Width =		_window_width;
		Check_Height =		_window_height; 
		Stored_Width =		_windowWidth();
		Stored_Height =		_windowHeight();
		
		};
		
};
