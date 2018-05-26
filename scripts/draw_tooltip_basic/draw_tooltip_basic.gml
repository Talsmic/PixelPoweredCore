///draw_tooltip_basic(x,y,body_text,[header_text],[max_width],[align]);
/// @arg x				{real}	
/// @arg y				{real}	
/// @arg body_text		{string}	
/// @arg [header_text]	{string}			(default: "")
/// @arg [max_width]	{integer}			(default: 200)
/// @arg [align]		{integer OR array}	(default: [global.AlignX,global.AlignY])
#region Arguments
if argument_count < 3 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var draw_x =		argument[0];
var draw_y =		argument[1];
var body_text =		argument[2];
var header_text =	argument_count > 3 ? argument[3] : "";
var max_width =		argument_count > 4 ? argument[4] : 200;
var align =			argument_count > 5 ? _validateArray(argument[5],2,2,[global.AlignX,global.AlignY]) : [global.AlignX,global.AlignY];
var use_body =		body_text != "" ? true : false;
var use_header =	header_text != "" ? true : false;
#endregion

#region Parse and find dimensions
var width = 7;
var height = 7;
if use_body { 
	var parsed_body = parse_text(body_text);
	set_font(ft_EvoTooltip_6);
	var body_width = parsed_text_width(parsed_body[0], parsed_body[2], max_width-8);
	var body_height = parsed_text_height(parsed_body[0], parsed_body[2], max_width-8, 9);
	width += body_width;
	height += body_height;
	};

//Add header size
if use_header { 
	var parsed_header = parse_text(header_text);
	set_font_style(eFontStyle.bold,ft_EvoTooltip_6);
	var header_width = parsed_text_width(parsed_header[0], parsed_header[2], max_width-8);
	var header_height = parsed_text_height(parsed_header[0], parsed_header[2], max_width-8, 9);
	if ( width < header_width + 8 ) { width = header_width + 8 };
	height += header_height;
	if use_body height += 1;
	};

//Correct align
switch align[0] {
	case fa_center:		draw_x -= width div 2;		break;
	case fa_right:		draw_x -= width;			break;		
	};
switch align[1] {
	case fa_middle:		draw_y -= height div 2;		break;
	case fa_bottom:		draw_y -= height;			break;		
	};	
#endregion
	
//Draw Box
draw_tilebox(draw_x,draw_y,width,height,c_white,1,spr_tooltipbox);

//Draw Text
if use_header and use_body { 
	set_font_style(eFontStyle.bold,ft_EvoTooltip_6);
	draw_parsed_text(draw_x+5, draw_y+3, parsed_header[0], parsed_header[1], parsed_header[2], c_white, 1, max_width-8, 9);
	draw_parsed_text(draw_x+5, draw_y+3, parsed_header[0], [c_black], parsed_header[2], c_black, 0.5, max_width-8, 9);
	draw_parsed_text(draw_x+5, draw_y+4, parsed_header[0], parsed_header[1], parsed_header[2], c_white, 1, max_width-8, 9);
	draw_parsed_text(draw_x+5, draw_y+4, parsed_header[0], [c_black], parsed_header[2], c_black, 0.5, max_width-8, 9);
	draw_parsed_text(draw_x+4, draw_y+3, parsed_header[0], parsed_header[1], parsed_header[2], c_white, 1, max_width-8, 9);
	set_font(ft_EvoTooltip_6);
	draw_parsed_text(draw_x+4, draw_y+header_height+4, parsed_body[0], parsed_body[1], parsed_body[2], c_gray13, 1, max_width-8, 9);
	}
else if use_body {
	set_font(ft_EvoTooltip_6);
	draw_parsed_text(draw_x+4, draw_y+3, parsed_body[0], parsed_body[1], parsed_body[2], c_gray13, 1, max_width-8, 9);
	};
else if use_header {
	set_font_style(eFontStyle.bold,ft_EvoTooltip_6);
	draw_parsed_text(draw_x+5, draw_y+3, parsed_header[0], parsed_header[1], parsed_header[2], c_white, 1, max_width-8, 9);
	draw_parsed_text(draw_x+5, draw_y+3, parsed_header[0], [c_black], parsed_header[2], c_black, 0.5, max_width-8, 9);
	draw_parsed_text(draw_x+5, draw_y+4, parsed_header[0], parsed_header[1], parsed_header[2], c_white, 1, max_width-8, 9);
	draw_parsed_text(draw_x+5, draw_y+4, parsed_header[0], [c_black], parsed_header[2], c_black, 0.5, max_width-8, 9);
	draw_parsed_text(draw_x+4, draw_y+3, parsed_header[0], parsed_header[1], parsed_header[2], c_white, 1, max_width-8, 9);
	};
