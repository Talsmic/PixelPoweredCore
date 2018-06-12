//Preset defaults for specific button types
switch ( ButtonType ) {
		
	case "Image":
		ButtonRegion =		_spriteRegion(x, y, sprite_index);
		image_speed =		0;
		break;
		
	case "Sprite":
		ButtonRegion =		_spriteRegion(x, y, sprite_index);	
		break;		
		
	case "Text":
		ButtonRegion =		_textRegion(x, y, ButtonText);	
		break;
		
	case "Framed":	
		ButtonRegion =		_spriteRegion(x, y, ButtonFrame);	
		break;
		
	};

//Support for preloading keybinds
if ( is_array(ButtonKeybinds) ) {
	ButtonTextArray[0] =	_keyboardCommandAsString(ButtonKeybinds[0]);
	};