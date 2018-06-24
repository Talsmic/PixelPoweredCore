///_setClass_Button([button_type],[keybinds]);

//Parent Class: _FocusObject
_setClass_FocusObject();

#region Default Flags

visible	=				true;
persistent =			false;
solid =					false;

#endregion

#region Variable Definitions

focus_level =			1;
isGUIObject =			true;

ButtonType =			argument_count > 0 ? argument[0] : "Sprite";		//{can be Sprite", "Image", "Text" or "Framed" }
ButtonRegion =			[x, y, x+20, y+20, 20, 20];

ButtonTextArray =		["", c_white, 1];
ButtonText_Alignment =	[fa_bottom, fa_right, 0, 0];
ButtonText =			"TextButton";
ButtonText_Colour =		c_white;
ButtonText_ColourOl =	c_black;
ButtonText_ColourMo =	c_orange;
ButtonText_Alpha =		1;

ButtonFrame =			frame_24x;
ButtonFrame_Colour =	c_white;

ButtonPop =				1;
ButtonPadding =			[0, 0, 0, 0];
ButtonKeybinds =		argument_count > 1 ? _asArray(argument[1]) : -1;

#endregion

#region Event: Creation

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

#endregion



