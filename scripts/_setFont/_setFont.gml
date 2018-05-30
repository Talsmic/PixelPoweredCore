///_setFont(font);
/// @arg font		#font_id#	
/*
	<< Pushes >> to global.Font
	It's impossible to track font without storing the font_id to a variable 
	yourself, so this function is meant to replace draw_set_font();
*/
#region Arguments
var font = argument0;
#endregion

global.Font = font;
global.BaseFont = _baseFont(font);

draw_set_font(font);

return font;