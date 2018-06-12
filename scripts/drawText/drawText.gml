///drawText(x,y,text,[colour],[alpha]);
/// @arg x			{real}
/// @arg y			{real}
/// @arg text		{string}
/// @arg [colour]	#c_code# OR {array}		(default: draw_get_colour())
/// @arg [alpha]	{real|0..1}				(default: draw_get_alpha())
/*
	[[ Draws ]]
*/
#region Arguments & Variables
if argument_count < 3 { show_debug_message("ArgError drawText"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var _x =		argument[0];
var _y =		argument[1];
var _text =		argument[2];
var _colour =	argument_count > 3 ? _validateArray(argument[3],4,4,argument[3]) : [draw_get_color(), draw_get_color(), draw_get_color(), draw_get_color()];
var _alpha =	argument_count > 4 ? argument[4] : draw_get_alpha();
#endregion

draw_text_colour(_x, _y, _text, _colour[0], _colour[1], _colour[2], _colour[3], _alpha);