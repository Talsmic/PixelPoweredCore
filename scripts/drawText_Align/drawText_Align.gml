///drawText_Align(x,y,text,[colour],[alpha],[align_array]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg text			{string}
/// @arg [colour]		#c_code# OR {array}		(default: draw_get_colour())
/// @arg [alpha]		{real|0..1}				(default: draw_get_alpha())
/// @arg [align_array]	#align#					(default: [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo]);
/*
	[[ Draws ]]
*/
#region Arguments & Variables & Variables
//Arguments
if argument_count < 3 { show_debug_message("ArgError drawText"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var _x =		argument[0];
var _y =		argument[1];
var _text =		argument[2];
var _colour =	argument_count > 3 ? _validateArray(argument[3],4,4,argument[3]) : [draw_get_color(), draw_get_color(), draw_get_color(), draw_get_color()];
var _alpha =	argument_count > 4 ? argument[4] : draw_get_alpha();
var _align =	argument_count > 5 ? _storeAlign(argument[5]): [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo];
//Other Variables
var saved_align = _storeAlign();
#endregion

switch ( _align[0] ) {
	
	default:
	case fa_left:	_x += _align[2];			break;		
	case fa_center:	_x += _align[2];			break;	
	case fa_right:	_x -= _align[2];			break;	
		
	};
	
switch ( _align[1] ) {	
	
	default:
	case fa_top:	_y += _align[3];		break;		
	case fa_middle:	_y += _align[3];		break;	
	case fa_bottom:	_y -= _align[3];		break;	
		
	};

_setAlign(_align);
draw_text_colour(_x, _y, _text, _colour[0], _colour[1], _colour[2], _colour[3], _alpha);
_setAlign(saved_align);
	