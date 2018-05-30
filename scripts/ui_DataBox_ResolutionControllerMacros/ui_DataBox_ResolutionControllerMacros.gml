///ui_DataBox_ResolutionControllerMacros(x,y);
/// @arg x {real}
/// @arg y {real}
var box_x = argument[0];
var box_y = argument[1];

//Box Dimensions
var box_columns = 2;
var box_rows = 4;

//Values
var col1 = ["RES_Ideal",
			"RES_Min",
			"RES_Max",
			"RES_MinWindow",
			];
var col2 = [string(RES_IdealWidth)+", "+string(RES_IdealHeight), 
			string(RES_MinWidth)+", "+string(RES_MinHeight), 
			string(RES_MaxWidth)+", "+string(RES_MaxHeight), 
			string(RES_MinWindowWidth)+", "+string(RES_MinWindowHeight), 
			];
			
//Draw Box
ui_ListBackground_create(0,box_x,box_y,180,-1,box_columns,box_rows);
	ListBackground_ColumnSize[0, 1] = 110;
	ListBackground_ColumnSize[0, 2] = -1;
	ListBackground_Pad_Top[0] = 12; 
ui_ListBackground_draw();

//Draw Header
_setFont(ft_EvoTooltip_6_Bold);
drawText(box_x+4,box_y+2,"[oResCon] Macros",c_orange,1);

//Draw Table Contents
_arrayDrawVertical(box_x+4,box_y+13,col1,c_fire_light,1,12);
_setAlign(fa_right);
_arrayDrawVertical(box_x+ui_ListBackground_get_width()-4,box_y+13,col2,c_gray9,1,12);
_setAlign(fa_left);