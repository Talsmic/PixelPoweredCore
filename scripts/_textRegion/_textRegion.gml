///_textRegion(x,y,text,[align_array],[padding]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg text			{string}
/// @arg [align_array]	#align#		(default: global.AlignArray);
/// @arg [padding]		{integer}	[+width, +height]
/*
	<< Returns >> #region#
	!!Remember to set the correct font before using this!!
	This will correct for alignment.
*/
#region Arguments & Variables
if argument_count < 3 { show_debug_message("_textRegion requires inputs"); exit };//[!Break!]~~~>
var _x =		argument[0];
var _y =		argument[1];
var _text =		argument[2];
var _align =	argument_count > 3 ? _alignArray(argument[3]) : global.AlignArray;
var _padding =	argument_count > 4 ? _arrayOfLength(argument[4], 2) : [0, 0];
#endregion
	
switch ( _align[0] ) {
	default:	
	case fa_left:		var _x1 = _x - _padding[0];									break;
	case fa_center:		var _x1 = _x + _padding[0]  - (string_width(_text) div 2);	break;
	case fa_right:		var _x1 = _x + _padding[0]*2 - string_width(_text);			break;
	};

switch ( _align[1] ) {
	default:	
	case fa_top:		var _y1 = _y - _padding[1];									break;
	case fa_middle:		var _y1 = _y + _padding[1]  - (string_width(_text) div 2);	break;
	case fa_bottom:		var _y1 = _y + _padding[1]*2 - string_width(_text);			break;
	};
	
var _w = string_width(_text) + _padding[0] * 2 - 1;
var _h = string_height(_text) + _padding[1] * 2;
var _x2 = _x1 + _w;
var _y2 = _y1 + _h;

return [_x1, _y1, _x2, _y2, _w, _h];