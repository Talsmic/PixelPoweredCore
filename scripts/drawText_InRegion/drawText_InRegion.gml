///drawText_InRegion(region,text,[colour],[alpha],[align_array]);
/// @arg region			#region#
/// @arg text			{string}
/// @arg [colour]		#c_code# OR {array}		(default: draw_get_colour())
/// @arg [alpha]		{real|0..1}				(default: draw_get_alpha())
/// @arg [align_array]	#align#					(default: global.AlignArray);
/*
	[[ Draws ]]
*/






#region Arguments & Variables & Variables
//Arguments
if argument_count < 2 { show_debug_message("ArgError drawText"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var _region =	_validateRegion(argument[0]);
var _text =		argument[1];
var _colour =	argument_count > 2 ? _arrayOfLength(argument[2], 4) : [draw_get_color(), draw_get_color(), draw_get_color(), draw_get_color()];
var _alpha =	argument_count > 3 ? argument[3] : draw_get_alpha();
var _align =	argument_count > 4 ? _alignArrayWithOffset(argument[4]): global.AlignArray;





//Other Variables
var saved_align = [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo];
#endregion

switch ( _align[0] ) {	
	default:
	case fa_left:		var _x = _region[aR.x1]	+ _align[2];	break;		
	case fa_center:		var _x = _region[aR.x1]	+ _align[2] + _region[aR.w] div 2 + _region[aR.w] mod 2 - 1;	break;	
	case fa_right:		var _x = _region[aR.x2] - _align[2];	break;			
	};
	
switch ( _align[1] ) {		
	default:
	case fa_top:		var _y = _region[aR.y1]	+ _align[3];	break;		
	case fa_middle:		var _y = _region[aR.y1] + _align[3] + _region[aR.h] div 2 + _region[aR.h] mod 2 - 1;	break;	
	case fa_bottom:		var _y = _region[aR.y2]	- _align[3];	break;			
	};

_setAlign(_align);
draw_text_colour(_magicX(_x), _magicY(_y), _text, _colour[0], _colour[1], _colour[2], _colour[3], _alpha);
_setAlign(saved_align);
	
//draw_anchor(_x, _y);
//_setAlign(_align);
//debug_region( _region, c_red );
//debug_region( _textRegion( _magicX(_x), _magicY(_y), _text, _align) );
//_setAlign(saved_align);