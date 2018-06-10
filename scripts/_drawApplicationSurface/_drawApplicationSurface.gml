///_drawApplicationSurface([x],[y],[width],[height],[scale]);
/// @arg [x]		{real}	
/// @arg [y]		{real}	
/// @arg [width]	{integer}
/// @arg [height]	{integer}
/// @arg [scale]	{real}	
/*
	[[ Draws ]]		Game Surface
*/ 
#region Arguments & Variables & Variables
var _surface_region = _applicationRegion();
//Arguments
_surface_region[aR.x1] =	argument_count > 0 ? argument[0] : _surface_region[aR.x1];
_surface_region[aR.y1] =	argument_count > 1 ? argument[1] : _surface_region[aR.y1];
_surface_region[aR.w] =		argument_count > 2 ? argument[2] : _surface_region[aR.w];
_surface_region[aR.h] =		argument_count > 3 ? argument[3] : _surface_region[aR.h];
var _scale =				argument_count > 4 ? argument[4] : 1;
//Other Variables
var _window_width =		_windowWidth();
var _window_height =	_windowHeight();
#endregion

//Draw Application Surface
if !surface_exists(application_surface) { show_debug_message("Error: Application Surface Not Found") }
else {
	gpu_set_blendenable(false);
	surface_resize( application_surface, _surface_region[aR.w], _surface_region[aR.h] );
	draw_surface_ext( application_surface, _surface_region[aR.x1], _surface_region[aR.y1], _scale, _scale, 0, c_white, 2);
	gpu_set_blendenable(true);
	};

_log(_regionString(_surface_region)+" * "+string(_scale));