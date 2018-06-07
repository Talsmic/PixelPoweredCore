/// @desc Draw DataBox
if Hidden exit;//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>
if !Pointer_InstanceID exit;//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>

//Pointer_InstanceID = id;
var draw_x = GUI_X;
var draw_y = GUI_Y;

_setFont(ft_Pixis07_Bold);
var s1 = "["+string(Pointer_InstanceID)+"]:";
var s2 = object_get_name(Pointer_InstanceID.object_index);
s2 = _stringClip(s2,LastDrawWidth-string_width(s1),"..");
drawText_Outlined(draw_x,draw_y,s1,c_shadow_light,c_shadow_dark,0.8,1.5);
drawText_Outlined(draw_x+2+string_width(s1),draw_y,s2,c_white,c_black,0.8,1.5);
draw_y += 10;

switch ( Pointer_Tabset[1] ) {
	
	default:
	case 1: // Built In
	ui_DataBox_Instance_BuiltIn(draw_x,draw_y,Pointer_InstanceID);
	draw_x += ui_ListBackground_get_width();
	draw_y += ui_ListBackground_get_height();
	LastDrawWidth = ui_ListBackground_get_width();
	LastDrawHeight = ui_ListBackground_get_height();
	break;
	
	};

Tabset_X[1] = draw_x-20; Tabset_Y[1] = draw_y;
uiTabset_Draw(1);



ClickCells = LastListRegions;