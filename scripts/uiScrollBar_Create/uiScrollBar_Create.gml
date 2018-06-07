///uiScrollBar_Create(scroll_region,max_value,[direction],[arrows],[spriteset],[colour],[keys_increase],[keys_decrease]);
/// @arg scroll_region		#region#
/// @arg max_value			{integer}
/// @arg [direction]		#direction#		(default: RIGHT)
/// @arg [arrows]			{boolean}		(default: false)
/// @arg [spriteset]		#sprite_id#		(default: spr_scrollbar)
/// @arg [colour]			#c_code#		(default: draw_get_colour())
/// @arg [keys_increase]	{array}			(default: [vk_down, ord("S")])
/// @arg [keys_decrease]	{array}			(default: [vk_up, ord("W")])
/*
	<< Returns >>	
*/ 

#region Special Enumerator: #aScrollbar# (for Array IDs)
enum aScrollbar {
	value, max_value, region, dir, arrows, spriteset, colour, keys_increase, keys_decrease 
	};
#endregion

#region Arguments & Variables
if argument_count < 2 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
//Arguments
var _region =			_validateRegion(argument[0]);
var _max_value =		argument[1];
var _direction =		argument_count > 2 ? argument[2] : RIGHT;
var _arrows =			argument_count > 3 ? argument[3] : true;
var _spriteset =		argument_count > 4 ? argument[4] : spr_scrollbar;
var _colour =			argument_count > 5 ? argument[5] : draw_get_colour();
var _keys_increase =	argument_count > 6 ? _validateArray(argument[6]) : ( _direction == TOP or _direction == BOTTOM ? [vk_right, ord("D")] : [vk_down, ord("S")] );
var _keys_decrease =	argument_count > 7 ? _validateArray(argument[7]) : ( _direction == TOP or _direction == BOTTOM ? [vk_left, ord("A")]  : [vk_up, ord("W")] );
#endregion

var _scrollbar = [0, _max_value, _region, _direction, _arrows, _spriteset, _colour, _keys_increase, _keys_decrease];

return _scrollbar;