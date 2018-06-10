///drawText_Outlined_InRegion(region,text,[align_array],[colour],[ol_colour],[alpha],[thickness],[shadowed_thickness],[shadow_alpha],[shadow_tint]);
/// @arg region			#region#
/// @arg text			{string}
/// @arg [align_array]	#align#					(default: [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo]);
/// @arg [colour]		#c_code# OR {array}		(default: draw_get_colour())
/// @arg [colour_ol]	#c_code# OR {array}		(default: colour_ol)
/// @arg [alpha]		{real|0..1}				(default: draw_get_alpha())
/// @arg [thickness]	{integer} OR {array}	(default: 1) (add 0.5 for thickened corners)
/// @arg [thickness2]	{integer} OR {array}	(default: 0) (add 0.5 for thickened corners)
/// @arg [shadow_alpha]	{real|0..1}				(default: 0.2)
/// @arg [shadow_tint]	#c_code#				(default: c_black)
/*
	[[ Draws ]]
*/
#region Arguments & Variables & Variables
//Arguments
if argument_count < 2 { show_debug_message("ArgError drawText"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var _region =		_validateRegion(argument[0]);
var _text =			argument[1];
var _align =		argument_count > 2 ? _storeAlign(argument[2]): [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo];
var _colourA =		argument_count > 3 ? argument[3] : draw_get_color();
var _colourB =		argument_count > 4 ? argument[4] : c_black;
var _alpha =		argument_count > 5 ? argument[5] : draw_get_alpha();
var _thicknessA =	argument_count > 6 ? _validateArray(argument[6], 4, 4, 0, 0) : [1, 1, 1, 1];
var _thicknessB =	argument_count > 7 ? _validateArray(argument[7], 4, 4, 0, 0) : [0, 0, 0, 0];
var _alphaB =		argument_count > 8 ? argument[8] : 0.2;
var _colourC =		argument_count > 9 ? argument[9] : c_black;
//Other Variables
var saved_align = _storeAlign();
var _x, _y;
#endregion

switch ( _align[0] ) {
	
	default:
	case fa_left:	_x = _region[aR.x1]							+ _align[2] + _thicknessA[0];	break;		
	case fa_center:	_x = _region[aR.x1] + (_region[aR.w] div 2) + _align[2];	break;	
	case fa_right:	_x = _region[aR.x2]							- _align[2] - _thicknessA[2];	break;	
		
	};
	
switch ( _align[1] ) {	
	
	default:
	case fa_top:	_y = _region[aR.y1]							+ _align[3] + _thicknessA[1];	break;		
	case fa_middle:	_y = _region[aR.y1] + (_region[aR.h] div 2) + _align[3];	break;	
	case fa_bottom:	_y = _region[aR.y2]							- _align[3] - _thicknessA[3];	break;	
		
	};

_setAlign(_align);
drawText_Outlined(_x, _y, _text, _colourA, _colourB, _alpha, _thicknessA, _thicknessB, _alphaB, _colourC);
_setAlign(saved_align);
	