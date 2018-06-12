/// @description Insert description here
// You can write your code in this editor
//fillScreen(c_white,1);


//uiBox_DrawDSMap(10,10,uibox);

//drawBlackbox(x,y,mouse_x-x,mouse_y-y)


var _string = "XYZ."
var _string2 = "xyz."
var _string3 = "[!|]."
drawText_Outlined_InRegion(_regionBySize(50,  50,  30, 30), _string, _align, c_white, c_black, 1, 0);
drawText_Outlined_InRegion(_regionBySize(90,  50,  30, 30), _string, _align, c_white, c_black, 1, 1);
drawText_Outlined_InRegion(_regionBySize(130, 50,  30, 30), _string, _align, c_white, c_black, 1, 2);
drawText_Outlined_InRegion(_regionBySize(170, 50,  30, 30), _string, _align, c_white, c_black, 1, 3);
drawText_Outlined_InRegion(_regionBySize(210, 50,  30, 30), _string, _align, c_white, c_black, 1, 4);
drawText_Outlined_InRegion(_regionBySize(250, 50,  30, 30), _string, _align, c_white, c_black, 1, 5);


_setFont(ft_Pixis06)
for ( var i=0 ; i<9 ; ++i ) {
	
	switch ( i ) {
		case 0:		_setFont(ft_Pixis05);			break;
		case 1:		_setFont(ft_Pixis06);			break;
		case 2:		_setFont(ft_Pixis07);			break;
		case 3:		_setFont(ft_Pixis07_Bold);		break;
		case 4:		_setFont(ft_Pixis07_Condensed);	break;
		case 5:		_setFont(ft_Pixis07_Squished);	break;
		case 6:		_setFont(ft_Pixis07_Italics);	break;
		case 7:		_setFont(ft_enCapsulate);		break;
		case 8:		_setFont(ft_Grandular);			break;
		};
	
	var _draw = _alignedTextDrawPoint(50, 100+15*i, _string, _align);
	//debug_region( _textRegion( _draw[0], _draw[1], _string), c_blue);
	drawText(_draw[0], _draw[1], _string, c_black);
	
	var _draw = _alignedTextDrawPoint(100, 100+15*i, _string2, _align);
	//debug_region( _textRegion( _draw[0], _draw[1], _string2), c_blue);
	drawText(_draw[0], _draw[1], _string2, c_black);
	
	var _draw = _alignedTextDrawPoint(150, 100+15*i, _string3, _align);
	//debug_region( _textRegion( _draw[0], _draw[1], _string3), c_blue);
	drawText(_draw[0], _draw[1], _string3, c_black);
	
	};