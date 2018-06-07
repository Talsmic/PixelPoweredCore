///drawGameSurface([width],[height],[scale]);
/// @arg [width]		{integer}		(default: res_PlayableWidth)
/// @arg [height]		{integer}		(default: res_PlayableHeight)
/// @arg [scale]		{real}			(default: res_Magnification)
/*
	[[ Draws ]]		Game Surface
*/ 
#region Arguments & Variables & Variables
//Arguments
var _width =	argument_count > 0 ? argument[0] : res_PlayableWidth;
var _height =	argument_count > 1 ? argument[1] : res_PlayableHeight;
var _scale =	argument_count > 2 ? argument[2] : res_Magnification;
//Other Variables
var _window_width =		_windowWidth();
var _window_height =	_windowHeight();
var _padx =				floor( ( _window_width - _width * _scale ) div 2 );
var _pady =				floor( ( _window_height - _height * _scale ) div 2 );

#endregion

//Draw Application Surface
if !surface_exists(application_surface) { show_debug_message("Error: Application Surface Not Found") }
else {
	gpu_set_blendenable(false);
	surface_resize( application_surface, res_PlayableWidth, res_PlayableHeight );
	draw_surface_ext( application_surface, _padx, _pady, _scale, _scale, 0, c_white, 2);
	gpu_set_blendenable(true);
	};
