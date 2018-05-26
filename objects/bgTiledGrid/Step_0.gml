/// @desc Update Grid

switch ( Grid_Size ) {
	default:
	case 8:		back_StoredBG_Sprite[1] = bg_grid8;		break;
	case 16:	back_StoredBG_Sprite[1] = bg_grid16;		break;
	case 24:	back_StoredBG_Sprite[1] = bg_grid24;		break;
	case 32:	back_StoredBG_Sprite[1] = bg_grid32;		break;
	};
	
switch ( Grid_Shading ) {
	default:
	case 0:		back_StoredBG_Frame[1] = 0;		break;
	case 1:		back_StoredBG_Frame[1] = 1;		break;
	};
	
back_StoredBG_Tint[1] = Grid_Colour;
back_StoredBG_Alpha[1] = Grid_Alpha;

switch ( Grid_Layer ) {
	default:
	case 0:		DrawNormal = true;  DrawGUI = false;	break;
	case 1:		DrawNormal = false; DrawGUI = true;		break;
	};

