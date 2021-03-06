///ui_DataBox_SettingsResolution(x,y);
/// @arg x {real}
/// @arg y {real}
var box_x = argument[0];
var box_y = argument[1];

//Box Dimensions
var box_columns = 2;
var box_rows = 6;

var col1 = ["_Fullscreen", 
			"_ResolutionSnap", 
			"_Magnification", 
			"_LockedMagnification", 
			"_Vsync",
			"_ResolutionSnap"
			];
var col2 = [ResolutionController.opt_res_Fullscreen,
			ResolutionController.Options_ResolutionSnap,
			ResolutionController.opt_res_Magnification,
			ResolutionController.opt_res_Magnification_Locked,
			ResolutionController.opt_res_Vsync,
			ResolutionController.Options_ResolutionSnap
			];

//Draw Box
ui_ListBackground_create(0,box_x,box_y,180,-1,box_columns,box_rows);
	ListBackground_ColumnSize[0, 1] = 110;
	ListBackground_ColumnSize[0, 2] = -1;
	ListBackground_Pad_Top[0] = 12; 
ui_ListBackground_draw();

//Draw Header
_setFont(ft_Pixis07_Bold);
drawText(box_x+4,box_y+2,"[oResCon] Options_",c_orange,1);

//Draw Table Contents
_arrayDrawVertical(box_x+4,box_y+13,col1,c_nature_light,1,12);
_setAlign(fa_right);
_arrayDrawVertical(box_x+ui_ListBackground_get_width()-4,box_y+13,col2,c_gray9,1,12);
_setAlign(fa_left);