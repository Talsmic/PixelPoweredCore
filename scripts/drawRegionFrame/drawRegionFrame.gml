///drawRegionFrame(region,[x],[y]);
/// @arg region		#region#
/// @arg x			{real}
/// @arg y			{real}
#region Arguments & Variables
var _region =	_validateRegion(argument[0]);
var _x =		argument_count > 1 ? argument[1] : _region[aR.x1];
var _y =		argument_count > 2 ? argument[2] : _region[aR.x1];
#endregion

var _draw =				[_x, _y, _x+_region[aR.w], _y+_region[aR.h], _region[aR.w], _region[aR.h]]
var _colour =			c_white;
var _colour_outline =	c_black;
var _inset_x =			2;
var _inset_y =			2;
var _textinset_x =		8;
var _textinset_y =		6;
var _length =			16;
var _thick =			3;
var _ol =				1;
var _ol2 =				_ol*2;


//Top Left
drawPlane(_draw[aR.x1]+_inset_x-_ol,			_draw[aR.y1]+_inset_y-_ol,			_length+_ol2,	_thick+_ol2,	_colour_outline);
drawPlane(_draw[aR.x1]+_inset_x-_ol,			_draw[aR.y1]+_inset_y-_ol,			_thick+_ol2,	_length+_ol2,	_colour_outline);
drawPlane(_draw[aR.x1]+_inset_x,				_draw[aR.y1]+_inset_y,				_length,		_thick,			_colour);
drawPlane(_draw[aR.x1]+_inset_x,				_draw[aR.y1]+_inset_y,				_thick,			_length,		_colour);
//Top Right
drawPlane(_draw[aR.x2]-_inset_x-_ol-_length,	_draw[aR.y1]+_inset_y-_ol,			_length+_ol2,	_thick+_ol2,	_colour_outline);
drawPlane(_draw[aR.x2]-_inset_x-_ol-_thick,		_draw[aR.y1]+_inset_y-_ol,			_thick+_ol2,	_length+_ol2,	_colour_outline);
drawPlane(_draw[aR.x2]-_inset_x-_length,		_draw[aR.y1]+_inset_y,				_length,		_thick,			_colour);
drawPlane(_draw[aR.x2]-_inset_x-_thick,			_draw[aR.y1]+_inset_y,				_thick,			_length,		_colour);
//Bottom Left
drawPlane(_draw[aR.x1]+_inset_x-_ol,			_draw[aR.y2]-_inset_y-_ol-_thick,	_length+_ol2,	_thick+_ol2,	_colour_outline);
drawPlane(_draw[aR.x1]+_inset_x-_ol,			_draw[aR.y2]-_inset_y-_ol-_length,	_thick+_ol2,	_length+_ol2,	_colour_outline);
drawPlane(_draw[aR.x1]+_inset_x,				_draw[aR.y2]-_inset_y-_thick,		_length,		_thick,			_colour);
drawPlane(_draw[aR.x1]+_inset_x,				_draw[aR.y2]-_inset_y-_length,		_thick,			_length,		_colour);
//Bottom Right
drawPlane(_draw[aR.x2]-_inset_x-_ol-_length,	_draw[aR.y2]-_inset_y-_ol-_thick,	_length+_ol2,	_thick+_ol2,	_colour_outline);
drawPlane(_draw[aR.x2]-_inset_x-_ol-_thick,		_draw[aR.y2]-_inset_y-_ol-_length,	_thick+_ol2,	_length+_ol2,	_colour_outline);
drawPlane(_draw[aR.x2]-_inset_x-_length,		_draw[aR.y2]-_inset_y-_thick,		_length,		_thick,			_colour);
drawPlane(_draw[aR.x2]-_inset_x-_thick,			_draw[aR.y2]-_inset_y-_length,		_thick,			_length,		_colour);

_setFont(ft_Pixis07_Bold);
drawText_Outlined_InRegion(_draw, string(_region[aR.x1])+", "+string(_region[aR.y1]),	[fa_left,	fa_top,		_textinset_x,	_textinset_y],	_colour, _colour_outline);
drawText_Outlined_InRegion(_draw, string(_region[aR.x1])+", "+string(_region[aR.y2]),	[fa_right,	fa_top,		_textinset_x,	_textinset_y],	_colour, _colour_outline);
drawText_Outlined_InRegion(_draw, string(_region[aR.x2])+", "+string(_region[aR.y1]),	[fa_left,	fa_bottom,	_textinset_x,	_textinset_y],	_colour, _colour_outline);
drawText_Outlined_InRegion(_draw, string(_region[aR.x2])+", "+string(_region[aR.y2]),	[fa_right,	fa_bottom,	_textinset_x,	_textinset_y],	_colour, _colour_outline);
drawText_Outlined_InRegion(_draw, string(_region[aR.w]),							[fa_center,	fa_top,		0,				_textinset_y],	_colour, _colour_outline);
drawText_Outlined_InRegion(_draw, string(_region[aR.w]),							[fa_center,	fa_bottom,	0,				_textinset_y],	_colour, _colour_outline);
drawText_Outlined_InRegion(_draw, string(_region[aR.h]),							[fa_left,	fa_middle,	_textinset_x,	0],				_colour, _colour_outline);
drawText_Outlined_InRegion(_draw, string(_region[aR.h]),							[fa_right,	fa_middle,	_textinset_x,	0],				_colour, _colour_outline);