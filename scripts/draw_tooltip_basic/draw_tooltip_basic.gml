///draw_tooltip_basic(body,x,y,max_width);
/// @arg body
/// @arg x
/// @arg y
/// @arg max_width
/*
	[Edited 24/4/2018]
	Draws a basic tooltip at the location
*/

var tt_body = argument0;
var tt_x = argument1;
var tt_y = argument2;
var max_width = argument3;

//Parse and find dimensions
draw_set_font(ft_EvoTooltip_6);
parse_text(tt_body,c_white);
var width = parsed_text_width(max_width-8);
var height = parsed_text_height(max_width-8,9);

//Draw Box
draw_blackbox(tt_x,tt_y,width,height);

//Draw Text
draw_parsed_text(tt_x+4,tt_y+4,max_width-8,9);
