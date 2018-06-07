///_textRegion(x,y,text,[align_array],[padding]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg text			{string}
/// @arg [align_array]	#align#		(default: [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo]);
/// @arg [padding]		{integer}	[+width, +height]
/*
	<< Returns >> #region#
	!!Remember to set the correct font before using this!!
	This will correct for alignment.
*/
#region Arguments & Variables
if argument_count < 3 { show_debug_message("_textRegion requires inputs"); exit };//[!Break!]~~~>
var _x1 =		argument[0];
var _y1 =		argument[1];
var _text =		argument[2];
var _align =	argument_count > 3 ? _storeAlign(argument[3]) : [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo];
var _padding =	argument_count > 4 ? _validateArray(argument[4], 2, 2, argument[4]) : [0, 0];
#endregion

_x1 -= _padding[0];
_y1 -= _padding[1];
var _w = string_width(_text) + _padding[0] * 2;
var _h = string_height(_text) + _padding[1] * 2;
var _x2 = _x1 + _w;
var _y2 = _y1 + _h;
	
var output = [_x1, _y1, _x2, _y2, _w, _h];

return _alignRegion(output, _align, [_x1, _y1]);