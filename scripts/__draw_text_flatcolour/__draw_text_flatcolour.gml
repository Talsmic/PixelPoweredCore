///drawText(x,y,text,[colour],[alpha]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg text			{string}
/// @arg [colour]		#c_code#		(default: draw_get_colour())
/// @arg [alpha]		{real|0..1}		(default: draw_get_alpha())
/*
	[[ Draws ]] text with an outline
*/
#region Arguments & Variables
if argument_count < 3 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var draw_x =	argument[0];
var draw_y =	argument[1];
var text =		argument[2];
var colour =	argument_count > 3 ? argument[3] : draw_get_color();
var alpha =		argument_count > 4 ? argument[4] : draw_get_alpha();
#endregion

draw_text_colour(draw_x,draw_y,text,colour,colour,colour,colour,alpha);