///_stringWidth(string,[font],[separation],[max_width]);
/// @arg string			{string}
/// @arg [font]			#font_id#
/// @arg [separation]	{integer}
/// @arg [max_width]	{integer}
/*
	<< Returns >> {string}: Clipped [input]
*/
#region Arguments & Variables
if argument_count < 1 { show_debug_message("ArgError _stringWidth"); exit };//[!Break!]
var _string =		string(argument[0]);
var _font =			argument_count > 1 ? argument[1] : -1;
var _separation =	argument_count > 2 ? argument[2] : -1;
var _max_width =	argument_count > 3 ? argument[3] : -1;
var _output;
#endregion

if ( _font ) { draw_set_font(_font) };

_output = string_width_ext(_string, _separation, _max_width);

if ( _font ) { draw_set_font(global.Font) };
	
return _output;