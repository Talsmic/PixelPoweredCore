///_viewRegion([view]);
/// @arg [view]		#view_id#
/*
	<< Returns >> #region#
*/
#region Arguments & Variables
var _view =	argument_count > 0 ? argument[0] : view_current;
#endregion

var _x1 =	view_xport[_view];
var _y1 =	view_yport[_view];
var _w =	view_wport[_view];
var _h =	view_hport[_view];
var _x2 =	_x1 + _w;
var _y2 =	_y1 + _h;
	
var output = [_x1, _y1, _x2, _y2, _w, _h];

return output;