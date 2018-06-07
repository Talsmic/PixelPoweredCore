///drawTooltip(x,y,body_text,[header_text],[max_width],[align]);
/// @arg x				{real}	
/// @arg y				{real}	
/// @arg body_text		{string}	
/// @arg [header_text]	{string}				(default: "")
/// @arg [max_width]	{integer}				(default: 200)
/// @arg [align]		{integer} OR {array}	(default: [global.AlignX, global.AlignY])
#region Arguments & Variables
if argument_count < 3 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var _x =			argument[0];
var _y =			argument[1];
var _text_body =	argument[2];
var _text_header =	argument_count > 3 ? argument[3] : "";
var _width_max =	argument_count > 4 ? argument[4] : 200;
var _align =		argument_count > 5 ? _validateArray(argument[5],2,2,[global.AlignX, global.AlignY]) : [global.AlignX, global.AlignY];
var use_body =		_text_body != "" ? true : false;
var use_header =	_text_header != "" ? true : false;
var _width_text =	_width_max-8;
#endregion

#region Parse and find dimensions
var _width = 8;
var _height = 8;
if use_body { 
	var parsed_body = parseText(_text_body);
	_setFont(ft_Pixis07);
	var body_width = parsedWidth(parsed_body[0], parsed_body[2], _width_text);
	var body_height = parsedHeight(parsed_body[0], parsed_body[2], _width_text, 9);
	_width += body_width;
	_height += body_height;
	};

//Add header size
if use_header { 
	var parsed_header = parseText(_text_header);
	_setFontStyle(eFontStyle.bold,ft_Pixis07);
	var header_width = parsedWidth(parsed_header[0], parsed_header[2], _width_text);
	var header_height = parsedHeight(parsed_header[0], parsed_header[2], _width_text, 9);
	if ( _width < header_width + 8 ) { _width = header_width + 8 };
	_height += header_height;
	if use_body _height += 1;
	};

//Correct align
switch _align[0] {
	case fa_center:		_x -= _width div 2;		break;
	case fa_right:		_x -= _width;			break;		
	};
switch _align[1] {
	case fa_middle:		_y -= _height div 2;	break;
	case fa_bottom:		_y -= _height;			break;		
	};	
#endregion
	
//Draw Box
var _region = [_x, _y, _x+_width, _y+_height, _width, _height];
drawTilebox(_region, spr_tooltipbox, c_white, 1);

//Draw Text
if use_header and use_body { 
	_setFontStyle(eFontStyle.bold,ft_Pixis07);
	drawParsedText(_x+5, _y+3, parsed_header[0], parsed_header[1], parsed_header[2], c_white, 1, _width_text, 9);
	drawParsedText(_x+5, _y+3, parsed_header[0], [c_black], parsed_header[2], c_black, 0.5, _width_text, 9);
	drawParsedText(_x+5, _y+4, parsed_header[0], parsed_header[1], parsed_header[2], c_white, 1, _width_text, 9);
	drawParsedText(_x+5, _y+4, parsed_header[0], [c_black], parsed_header[2], c_black, 0.5, _width_text, 9);
	drawParsedText(_x+4, _y+3, parsed_header[0], parsed_header[1], parsed_header[2], c_white, 1, _width_text, 9);
	_setFont(ft_Pixis07);
	drawParsedText(_x+4, _y+header_height+4, parsed_body[0], parsed_body[1], parsed_body[2], c_gray13, 1, _width_text, 9);
	}
else if use_body {
	_setFont(ft_Pixis07);
	drawParsedText(_x+4, _y+3, parsed_body[0], parsed_body[1], parsed_body[2], c_gray13, 1, _width_text, 9);
	};
else if use_header {
	_setFontStyle(eFontStyle.bold,ft_Pixis07);
	drawParsedText(_x+5, _y+3, parsed_header[0], parsed_header[1], parsed_header[2], c_white, 1, _width_text, 9);
	drawParsedText(_x+5, _y+3, parsed_header[0], [c_black], parsed_header[2], c_black, 0.5, _width_text, 9);
	drawParsedText(_x+5, _y+4, parsed_header[0], parsed_header[1], parsed_header[2], c_white, 1, _width_text, 9);
	drawParsedText(_x+5, _y+4, parsed_header[0], [c_black], parsed_header[2], c_black, 0.5, _width_text, 9);
	drawParsedText(_x+4, _y+3, parsed_header[0], parsed_header[1], parsed_header[2], c_white, 1, _width_text, 9);
	};
