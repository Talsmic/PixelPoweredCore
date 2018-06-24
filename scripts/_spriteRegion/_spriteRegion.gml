///_spriteRegion(x,y,sprite_id,[padding]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg sprite_id		#sprite_id#
/// @arg [padding]		{integer} [+width, +height]
/*
	<< Returns >> #region#
	This will correct for alignment.
*/
#region Arguments & Variables
if argument_count < 3 { show_debug_message("_textRegion requires inputs"); exit };//[!Break!]~~~>
var _x1 =			argument[0];
var _y1 =			argument[1];
var _sprite_id =	argument[2];
var _padding =		argument_count > 3 ? _arrayOfLength(argument[3], 2) : [0, 0];
#endregion

_x1 -= _padding[0];
_y1 -= _padding[1];
var _w = sprite_get_width(_sprite_id) + _padding[0] * 2;
var _h = sprite_get_height(_sprite_id) + _padding[1] * 2;
var _x2 = _x1 + _w;
var _y2 = _y1 + _h;
	
var output = [_x1, _y1, _x2, _y2, _w, _h];

return _alignRegion(output, [fa_left, fa_top, 0, 0], [_x1+sprite_get_xoffset(_sprite_id), _y1+sprite_get_xoffset(_sprite_id)]);