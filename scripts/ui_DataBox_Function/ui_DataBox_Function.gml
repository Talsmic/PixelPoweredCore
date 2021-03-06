///ui_DataBox_Function(x,y,function,[provided_values]);
/// @arg x {real}
/// @arg y {real}
/// @arg function {string|Function Name}
/// @arg [provided_values] {array}		(default: nothing)
var box_x = argument[0];
var box_y = argument[1];
var function_name = string(argument[2]);
var function_argument_names = function_findarguments(function_name);
var provided_values = array_create(array_height_2d(function_argument_names),"nil");				
if argument_count > 3 { provided_values = argument[3] };

//Box Dimensions
var box_columns = 3;
var box_rows = array_height_2d(function_argument_names)-1;

//Find Header and Text
var function_nameA = function_name + "(";
var col0 = [""];
var col1 = [""];
var col2 = [""];
var col3 = [""];
for ( var i=1; i<array_height_2d(function_argument_names); ++i ) {
	col0[i] = string(i-1);
	col1[i] = string(function_argument_names[i,1]);
	col2[i] = string(function_argument_names[i,2]);
	col3[i] = "";
	if ( array_length_1d(provided_values) >= i ) { col3[i] = string(provided_values[i-1]) };
	function_nameA += string(function_argument_names[i,2]);
	if ( i<array_height_2d(function_argument_names)-1 ) {
		function_nameA += ",";
		};
	};
function_nameA += ");"



//Draw Box
ui_ListBackground_create(0,box_x,box_y,-1,-1,box_columns,box_rows);
	ListBackground_ColumnSize[0, 0] = 20;
	ListBackground_ColumnSize[0, 1] = 50;
	ListBackground_ColumnSize[0, 2] = 36;
	ListBackground_ColumnSize[0, 3] = 100;
	ListBackground_Pad_Top[0] = 12; 
	ListBackground_HeaderColumn[0] = true; 
	ListBackground_ColumnMouseovers[0, 3] = 2;
ui_ListBackground_draw();

//Draw Header
_setFont(ft_Pixis07_Bold);
function_nameA = _stringClip(function_nameA,ui_ListBackground_get_width()-8,"...");
var function_nameB = _stringClip(function_name,ui_ListBackground_get_width()-8,"...");
drawText(box_x+4,box_y+2,function_nameA,c_gray9,1);
drawText(box_x+4,box_y+2,function_nameB,c_orange,1);

//Draw Table Contents
_setAlign(fa_center);
_arrayDrawVertical(box_x+12,box_y+1,col0,c_white,1,12);
_setFont(ft_Pixis07_Condensed);
_arrayDrawVertical(box_x+48,box_y+1,col2,c_gray9,1,12);
_arrayDrawVertical(box_x+92,box_y+1,col1,c_gray9,1,12);
_setAlign(fa_right);
_arrayDrawVertical(box_x+ui_ListBackground_get_width()-4,box_y+1,col3,c_white,1,12,92);
_setAlign(fa_left);
