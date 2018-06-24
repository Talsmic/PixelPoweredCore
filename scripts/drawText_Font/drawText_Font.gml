///drawText_Font(x,y,text,[colour],[alpha],[font],[font_style]);
/// @arg x			{real}
/// @arg y			{real}
/// @arg text		{string}
/// @arg [colour]	#c_code# OR {array}		(default: draw_get_colour())
/// @arg [alpha]	{real|0..1}				(default: draw_get_alpha())
/// @arg [font]		#font_id#				(default: global.Font)
/// @arg [style]	#font_id#				
/*
	[[ Draws ]]
*/
#region Arguments & Variables
if argument_count < 3 { show_debug_message("ArgError drawText"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
//Arguments
var _x =		_magicX(argument[0]);
var _y =		_magicY(argument[1]);
var _text =		argument[2];
var _colour =	argument_count > 3 ? _validateArray(argument[3], 4) : [draw_get_color(), draw_get_color(), draw_get_color(), draw_get_color()];
var _alpha =	argument_count > 4 ? argument[4] : draw_get_alpha();
var _font =		argument_count > 5 ? argument[5] : global.Font;
var _style =	argument_count > 6 ? argument[6] : -1;
//Other Variables
var stored_font = global.Font;
#endregion

if ( _style ) {	_setFontStyle(_style, _font) };
		 else {	_setFont(_font) };

draw_text_colour(_x, _y ,_text, _colour[0], _colour[1], _colour[2], _colour[3], _alpha);

_setFont(stored_font);