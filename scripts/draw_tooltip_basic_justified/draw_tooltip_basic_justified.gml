///draw_tooltip_basic_justified(body,x,y,max_width,horizontal_justification,vertical_justification);
/// @arg body
/// @arg x
/// @arg y
/// @arg max_width
/// @arg horizontal_justification
/// @arg vertical_justification
/*
	[Edited 24/4/2018] (variant of: draw_tooltip_basic);
	Draws a basic tooltip at the location, positioned oddly
*/

var tt_body = argument0;
var tt_x = argument1;
var tt_y = argument2;
var max_width = argument3;
var horizontal_justification = argument4;
var vertical_justification = argument5;

//Parse and find dimensions
set_font(ft_EvoTooltip_6);
parse_text(tt_body,c_white);
var width = parsed_text_width(max_width-8);
var height = parsed_text_height(max_width-8,9);

//Justify
switch ( horizontal_justification ) {
	default: case "left": 
		break;
	case "center": 
		tt_x -= round(0.5*width);
		break;
	default: case "right": 
		tt_x -= round(width);
		break;
	};
switch ( vertical_justification ) {
	default: case "top": 
		break;
	case "center": 
		tt_y -= round(0.5*height);
		break;
	default: case "bottom": 
		tt_y -= round(height);
		break;
	};

//Draw Box
draw_simplebox(tt_x,tt_y,width,height);

//Draw Text
draw_parsed_text(tt_x+4,tt_y+4,max_width-8,9);