/// @desc Draw Keyboard

var _x = DrawStart_X;
var _y = DrawStart_Y + TilePop;
var _caps = true;
var _talign = [1,0,0,3];
var _shift = false;

_setFont(ft_Pixis07_Bold);

debug_region( _regionBySize(DrawStart_X, DrawStart_Y, TileWidth*15 + Pad_X*14, TileHeight*6 + Pad_Y*6 + TilePop*6) );

_setFont(ft_Pixis07);
drawText(50, 40, string(keyboard_lastkey), c_black);
drawText(70, 40, string(keyboard_lastchar), c_black);
drawText(90, 40, KeyboardString, c_black);

#region Optional Row: Function Keys
if ( Draw_Row_Functions ) {
	_x = DrawStart_X;
	
	_setFont(ft_Pixis05);
	//Esc
	drawButton_Tilebox(_x, _y, TileWidth + 1, TileHeight, TileSet, TileColour, 1, ["ESC"], _talign, TilePop, 0, eButtonState.detect, [vk_escape] );
	_x += TileWidth + Pad_X;
	
	_x += TileWidth*1 + Pad_X*2 + TileWidth mod 2;
	
	_setFont(ft_Pixis06);
	//F1-4
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["F1"], _talign, TilePop, 0, eButtonState.detect, [vk_f1] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["F2"], _talign, TilePop, 0, eButtonState.detect, [vk_f2] );
	_x += TileWidth + Pad_X;
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["F3"], _talign, TilePop, 0, eButtonState.detect, [vk_f3] );
	_x += TileWidth + Pad_X;
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["F4"], _talign, TilePop, 0, eButtonState.detect, [vk_f4] );
	_x += TileWidth + Pad_X;
		
	_x += TileWidth div 2;
	
	//F5-8
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["F5"], _talign, TilePop, 0, eButtonState.detect, [vk_f5] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["F6"], _talign, TilePop, 0, eButtonState.detect, [vk_f6] );
	_x += TileWidth + Pad_X;
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["F7"], _talign, TilePop, 0, eButtonState.detect, [vk_f7] );
	_x += TileWidth + Pad_X;
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["F8"], _talign, TilePop, 0, eButtonState.detect, [vk_f8] );
	_x += TileWidth + Pad_X;
	
	_x += TileWidth div 2;
	
	//F9-12
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["F9"], _talign, TilePop, 0, eButtonState.detect, [vk_f9] );
	_x += TileWidth + Pad_X;	
	_setFont(ft_Pixis06);
	var _check = drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, [""], _talign, TilePop, 0, eButtonState.detect, [vk_f10] );
	if ( buttonStateInRegion(_check, [vk_f10]) == eButtonState.pressed ) { 
		drawText_Align(_x + (TileWidth div 2) - 4,		_y+3,		"F", c_white, 1, _talign); 
		drawText_Align(_x + (TileWidth div 2) - 0,		_y+3,		"1", c_white, 1, _talign); 
		drawText_Align(_x + (TileWidth div 2) + 5,		_y+3,		"0", c_white, 1, _talign); 
		} else { 
		drawText_Align(_x + (TileWidth div 2) - 4,		_y+1,		"F", c_white, 1, _talign); 
		drawText_Align(_x + (TileWidth div 2) - 0,		_y+1,		"1", c_white, 1, _talign); 
		drawText_Align(_x + (TileWidth div 2) + 5,		_y+1,		"0", c_white, 1, _talign); 
		};
	_x += TileWidth + Pad_X;
	var _check = drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, [""], _talign, TilePop, 0, eButtonState.detect, [vk_f11] );
	if ( buttonStateInRegion(_check, [vk_f11]) == eButtonState.pressed ) { 
		drawText_Align(_x + (TileWidth div 2) - 4,		_y+3,		"F", c_white, 1, _talign); 
		drawText_Align(_x + (TileWidth div 2) - 0,		_y+3,		"1", c_white, 1, _talign); 
		drawText_Align(_x + (TileWidth div 2) + 5,		_y+3,		"1", c_white, 1, _talign); 
		} else { 
		drawText_Align(_x + (TileWidth div 2) - 4,		_y+1,		"F", c_white, 1, _talign); 
		drawText_Align(_x + (TileWidth div 2) - 0,		_y+1,		"1", c_white, 1, _talign); 
		drawText_Align(_x + (TileWidth div 2) + 5,		_y+1,		"1", c_white, 1, _talign); 
		};
	_x += TileWidth + Pad_X;
	var _check = drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, [""], _talign, TilePop, 0, eButtonState.detect, [vk_f12] );
	if ( buttonStateInRegion(_check, [vk_f12]) == eButtonState.pressed ) { 
		drawText_Align(_x + (TileWidth div 2) - 4,		_y+3,		"F", c_white, 1, _talign); 
		drawText_Align(_x + (TileWidth div 2) - 0,		_y+3,		"1", c_white, 1, _talign); 
		drawText_Align(_x + (TileWidth div 2) + 5,		_y+3,		"2", c_white, 1, _talign); 
		} else { 
		drawText_Align(_x + (TileWidth div 2) - 4,		_y+1,		"F", c_white, 1, _talign); 
		drawText_Align(_x + (TileWidth div 2) - 0,		_y+1,		"1", c_white, 1, _talign); 
		drawText_Align(_x + (TileWidth div 2) + 5,		_y+1,		"2", c_white, 1, _talign); 
		};
	_x += TileWidth + Pad_X;
	
	_y += TileHeight + Pad_Y*2 + TilePop;
	};
#endregion

#region Optional Row: Numbers
if ( Draw_Row_Numbers ) {
	_x = DrawStart_X;
	
	_setFont(ft_Pixis07);
	//`
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["'"], _talign, TilePop, 0, eButtonState.detect, [192] );
	_x += TileWidth + Pad_X;
	//1-0
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["1"], _talign, TilePop, 0, eButtonState.detect, [ord("1")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["2"], _talign, TilePop, 0, eButtonState.detect, [ord("2")] );
	_x += TileWidth + Pad_X;
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["3"], _talign, TilePop, 0, eButtonState.detect, [ord("3")] );
	_x += TileWidth + Pad_X;
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["4"], _talign, TilePop, 0, eButtonState.detect, [ord("4")] );
	_x += TileWidth + Pad_X;
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["5"], _talign, TilePop, 0, eButtonState.detect, [ord("5")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["6"], _talign, TilePop, 0, eButtonState.detect, [ord("6")] );
	_x += TileWidth + Pad_X;
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["7"], _talign, TilePop, 0, eButtonState.detect, [ord("7")] );
	_x += TileWidth + Pad_X;
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["8"], _talign, TilePop, 0, eButtonState.detect, [ord("8")] );
	_x += TileWidth + Pad_X;
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["9"], _talign, TilePop, 0, eButtonState.detect, [ord("9")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["0"], _talign, TilePop, 0, eButtonState.detect, [ord("0")] );
	_x += TileWidth + Pad_X;
	//-
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["-"], _talign, TilePop, 0, eButtonState.detect, [189] );
	_x += TileWidth + Pad_X;
	//=
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["="], _talign, TilePop, 0, eButtonState.detect, [187] );
	_x += TileWidth + Pad_X;
	_setFont(ft_Pixis05);
	//Backspace
	drawButton_Tilebox(_x, _y, TileWidth*2 + Pad_X, TileHeight, TileSet, TileColour, 1, ["BACK"], _talign, TilePop, 0, eButtonState.detect, [vk_backspace] );
	
	_y += TileHeight + Pad_Y + TilePop;
	};
#endregion

#region Row1: Q-P	
	_x = DrawStart_X;
	
	_setFont(ft_Pixis05);
	//Tab
	drawButton_Tilebox(_x, _y, TileWidth + TileWidth div 2 + Pad_X + TileWidth mod 2, TileHeight, TileSet, TileColour, 1, ["TAB"], _talign, TilePop, 0, eButtonState.detect, [vk_tab] );
	_x += TileWidth + TileWidth div 2 + TileWidth mod 2 + Pad_X*2;
	_setFont(ft_Pixis07);
	//Q-P
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["Q"], _talign, TilePop, 0, eButtonState.detect, [ord("Q")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["W"], _talign, TilePop, 0, eButtonState.detect, [ord("W")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["E"], _talign, TilePop, 0, eButtonState.detect, [ord("E")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["R"], _talign, TilePop, 0, eButtonState.detect, [ord("R")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["T"], _talign, TilePop, 0, eButtonState.detect, [ord("T")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["Y"], _talign, TilePop, 0, eButtonState.detect, [ord("Y")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["U"], _talign, TilePop, 0, eButtonState.detect, [ord("U")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["I"], _talign, TilePop, 0, eButtonState.detect, [ord("I")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["O"], _talign, TilePop, 0, eButtonState.detect, [ord("O")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["P"], _talign, TilePop, 0, eButtonState.detect, [ord("P")] );
	_x += TileWidth + Pad_X;	
	//[ ]
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["["], _talign, TilePop, 0, eButtonState.detect, [219] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["]"], _talign, TilePop, 0, eButtonState.detect, [221] );
	_x += TileWidth + Pad_X;	
	// /
	drawButton_Tilebox(_x, _y, TileWidth + TileWidth div 2, TileHeight, TileSet, TileColour, 1, ["\\"], _talign, TilePop, 0, eButtonState.detect, [220] );
	
	_y += TileHeight + Pad_Y + TilePop;
#endregion

#region Row2: A-L	
	_x = DrawStart_X;
	
	_setFont(ft_Pixis05);
	//Caps Lock
	drawButton_Tilebox(_x, _y, TileWidth*2 + Pad_X, TileHeight, TileSet, TileColour, 1, ["CAPS"], _talign, TilePop, 0, eButtonState.detect, [20] );
	_x += TileWidth*2 + Pad_X*2;
	_setFont(ft_Pixis07);
	//A-L
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["A"], _talign, TilePop, 0, eButtonState.detect, [ord("A")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["S"], _talign, TilePop, 0, eButtonState.detect, [ord("S")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["D"], _talign, TilePop, 0, eButtonState.detect, [ord("D")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["F"], _talign, TilePop, 0, eButtonState.detect, [ord("F")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["G"], _talign, TilePop, 0, eButtonState.detect, [ord("G")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["H"], _talign, TilePop, 0, eButtonState.detect, [ord("H")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["J"], _talign, TilePop, 0, eButtonState.detect, [ord("J")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["K"], _talign, TilePop, 0, eButtonState.detect, [ord("K")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["L"], _talign, TilePop, 0, eButtonState.detect, [ord("L")] );
	_x += TileWidth + Pad_X;
	// ; '
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, [";"], _talign, TilePop, 0, eButtonState.detect, [186] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["'"], _talign, TilePop, 0, eButtonState.detect, [222] );
	_x += TileWidth + Pad_X;
	//Enter
	_setFont(ft_Pixis05);
	drawButton_Tilebox(_x, _y, TileWidth*2 + Pad_X, TileHeight, TileSet, TileColour, 1, ["ENTER"], _talign, TilePop, 0, eButtonState.detect, [vk_enter] );
	
	_y += TileHeight + Pad_Y + TilePop;
#endregion

#region Row3: Z-M
	_x = DrawStart_X;
	
	_setFont(ft_Pixis05);
	//Shift
	drawButton_Tilebox(_x, _y, TileWidth*2 + TileWidth div 2 + Pad_X*2, TileHeight, TileSet, TileColour, 1, ["SHIFT"], _talign, TilePop, 0, eButtonState.detect, [vk_lshift] );
	_x += TileWidth*2 + TileWidth div 2 + Pad_X*3;
	_setFont(ft_Pixis07);
	//Z-M
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["Z"], _talign, TilePop, 0, eButtonState.detect, [ord("Z")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["X"], _talign, TilePop, 0, eButtonState.detect, [ord("X")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["C"], _talign, TilePop, 0, eButtonState.detect, [ord("C")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["V"], _talign, TilePop, 0, eButtonState.detect, [ord("V")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["B"], _talign, TilePop, 0, eButtonState.detect, [ord("B")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["N"], _talign, TilePop, 0, eButtonState.detect, [ord("N")] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["M"], _talign, TilePop, 0, eButtonState.detect, [ord("M")] );
	_x += TileWidth + Pad_X;	
	// , . /
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, [","], _talign, TilePop, 0, eButtonState.detect, [188] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["."], _talign, TilePop, 0, eButtonState.detect, [190] );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, ["/"], _talign, TilePop, 0, eButtonState.detect, [191] );
	_x += TileWidth + Pad_X;	
	_setFont(ft_Pixis05);
	//Shift
	drawButton_Tilebox(_x, _y, TileWidth*2 + TileWidth div 2 + TileWidth mod 2 + Pad_X, TileHeight, TileSet, TileColour, 1, ["SHIFT"], _talign, TilePop, 0, eButtonState.detect, [vk_rshift] );
	
	_y += TileHeight + Pad_Y + TilePop;
#endregion

#region Row4: Space
	_x = DrawStart_X;
	
	_setFont(ft_Pixis05);
	//Ctrl
	drawButton_Tilebox(_x, _y, TileWidth + TileWidth div 2 + TileWidth mod 2 + Pad_X, TileHeight, TileSet, TileColour, 1, ["CTRL"], _talign, TilePop, 0, eButtonState.detect, [vk_lcontrol] );
	_x += TileWidth + TileWidth div 2 + TileWidth mod 2 + Pad_X*2;
	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, [""], _talign, TilePop, 0, eButtonState.disabled );
	_x += TileWidth + Pad_X;	
	
	//Alt
	drawButton_Tilebox(_x, _y, TileWidth + TileWidth div 2 + Pad_X, TileHeight, TileSet, TileColour, 1, ["ALT"], _talign, TilePop, 0, eButtonState.detect, [vk_lalt] );
	_x += TileWidth + TileWidth div 2 + Pad_X*2;
	//Space
	drawButton_Tilebox(_x, _y, TileWidth*6 + Pad_X*3, TileHeight, TileSet, TileColour, 1, ["SPACE"], _talign, TilePop, 0, eButtonState.detect, [vk_space] );
	_x += TileWidth*6 + Pad_X*4;
	//Alt
	drawButton_Tilebox(_x, _y, TileWidth + TileWidth div 2 + Pad_X, TileHeight, TileSet, TileColour, 1, ["ALT"], _talign, TilePop, 0, eButtonState.detect, [vk_ralt] );
	_x += TileWidth + TileWidth div 2 + Pad_X*2;
	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, [""], _talign, TilePop, 0, eButtonState.disabled );
	_x += TileWidth + Pad_X;	
	drawButton_Tilebox(_x, _y, TileWidth, TileHeight, TileSet, TileColour, 1, [""], _talign, TilePop, 0, eButtonState.disabled );
	_x += TileWidth + Pad_X;	
	
	//Ctrl
	drawButton_Tilebox(_x, _y, TileWidth + TileWidth div 2 + TileWidth mod 2 + Pad_X, TileHeight, TileSet, TileColour, 1, ["CTRL"], _talign, TilePop, 0, eButtonState.detect, [vk_rcontrol] );
	
	_y += TileHeight + Pad_Y + TilePop;
#endregion
