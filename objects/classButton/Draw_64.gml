if ( !isGUIObject ) exit;

_setFont( ButtonText_Font );
switch ( ButtonType ) {
	
	default:
	case "Image":
		drawButton_Image(	x, y, sprite_index, image_index,	image_blend,	image_alpha,	ButtonTextArray, ButtonText_Alignment,	ButtonPop,	ButtonPadding,	eButtonState.detect,	ButtonKeybinds);
		break;
		
	case "Sprite":
		drawButton_Sprite(	x, y, sprite_index,					image_blend,	image_alpha,	ButtonTextArray, ButtonText_Alignment,	ButtonPop,	ButtonPadding,	eButtonState.detect,	ButtonKeybinds);
		break;		
		
	case "Text":
		drawButton_Text(	x, y, ButtonText,	ButtonText_Colour, ButtonText_ColourOl, ButtonText_ColourMo, ButtonText_Alpha,			ButtonPop,	ButtonPadding,	eButtonState.detect,	ButtonKeybinds);
		break;
		
	case "Framed":
		drawButton_Framed(	x, y, ButtonFrame,	sprite_index, image_index, image_blend, ButtonFrame_Colour, image_alpha,	ButtonTextArray, ButtonText_Alignment,	eButtonState.detect,	ButtonKeybinds);
		break;
		
	case "Tilebox":
		drawButton_Tilebox(	x, y, ButtonTileboxWidth, ButtonTileboxHeight, sprite_index,	image_blend,	image_alpha,	ButtonTextArray, ButtonText_Alignment,	ButtonPop,	ButtonPadding,	eButtonState.detect,	ButtonKeybinds);
		break;
		
	};
