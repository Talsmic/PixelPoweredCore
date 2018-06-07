///ui_DataBox_ResolutionControllerBreakPoints(x,y);
/// @arg x {real}
/// @arg y {real}
var box_x = argument[0];
var box_y = argument[1];

//Box Dimensions
var box_columns = 2;
var box_rows = array_length_1d(ResolutionController._breakpointsY);

var col1 = ResolutionController._breakpointsX;
var col2 = ResolutionController._breakpointsY;

//Draw Box
ui_ListBackground_create(0,box_x,box_y,84,-1,box_columns,box_rows);
	ListBackground_ColumnSize[0, 1] = -1;
	ListBackground_ColumnSize[0, 2] = -1;
	ListBackground_Pad_Top[0] = 12; 
ui_ListBackground_draw();

//Draw Header
_setFont(ft_Pixis07_Bold);
drawText(box_x+4,box_y+2,"Breakpoints:",c_orange,1);

//Draw Table Contents
var highlight = _resolutionGetScale();
_setAlign(fa_right);
_arrayDrawVertical(box_x+ui_ListBackground_get_width()*0.5-4,box_y+13,col1,c_gray9,1,12);
drawText(box_x+ui_ListBackground_get_width()*0.5-4,box_y+13+12*highlight,col1[highlight],c_shadow_light,1);
_setAlign(fa_left);
_arrayDrawVertical(box_x+ui_ListBackground_get_width()*0.5+4,box_y+13,col2,c_gray9,1,12);
drawText(box_x+ui_ListBackground_get_width()*0.5+4,box_y+13+12*highlight,col2[highlight],c_shadow_light,1);

