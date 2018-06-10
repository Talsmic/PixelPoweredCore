///_windowRegion();
/*
	<< Returns >> #region#
*/

var _x1 =	window_get_x();
var _y1 =	window_get_y();
var _w =	_windowWidth();
var _h =	_windowHeight();
var _x2 =	_x1 + _w;
var _y2 =	_y1 + _h;
	
var output = [_x1, _y1, _x2, _y2, _w, _h];

return output;