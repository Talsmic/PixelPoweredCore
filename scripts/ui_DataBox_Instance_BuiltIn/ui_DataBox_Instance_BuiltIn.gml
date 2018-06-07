///ui_DataBox_Instance_BuiltIn(x,y,instance_id);
/// @arg x				{real}
/// @arg y				{real}
/// @arg [instance_id]	{InstanceID}		(default: nothing)
var box_x = argument0;
var box_y = argument1;
var instance_ref = argument2;
if ( !instance_ref or !instance_exists(instance_ref) ) { exit };

//Find Values
var rA = 0;
var rB = 0;
var boxA_col1 = [""], boxA_col2 = [""], boxA_col3 = [""];
var boxB_col1 = [""], boxB_col2 = [""], boxB_col3 = [""];

#region Green Values (built in)
//Persistent
rA++; boxA_col1[rA] = "persistent"; boxA_col2[rA] = "boolean"; boxA_col3[rA] = _booleanString(instance_ref.persistent);
//Visible
rA++; boxA_col1[rA] = "visible"; boxA_col2[rA] = "boolean"; boxA_col3[rA] = _booleanString(instance_ref.visible);
rA++; boxA_col1[rA] = "x, y"; boxA_col2[rA] = "real"; boxA_col3[rA] = string(instance_ref.x)+", "+string(instance_ref.y);
if ( instance_ref.visible ) {
	rA++; boxA_col1[rA] = "depth, layer"; boxA_col2[rA] = "integer"; boxA_col3[rA] = string(instance_ref.depth)+", "+string(instance_ref.layer);
	};
	
#endregion

#region //Blue Values (local)
if ( variable_instance_exists(instance_ref,"Hidden") ) { 
	if ( instance_ref.IsSlave ) { 
		rB++; boxB_col1[rB] = "IsSlave"; boxB_col2[rB] = "boolean"; boxB_col3[rB] = _booleanString(instance_ref.IsSlave)
		if ( variable_instance_exists(instance_ref,"Master") ) { 
			rB++; boxB_col1[rB] = "Master"; boxB_col2[rB] = "InstanceID"; boxB_col3[rB] = "["+string(instance_ref.Master)+"]"
			rB++; boxB_col1[rB] = ""; boxB_col2[rB] = ""; boxB_col3[rB] = object_get_name(instance_ref.object_index) };
		};
	};
if ( variable_instance_exists(instance_ref,"Hidden") ) { 
	rB++; boxB_col1[rB] = "Hidden"; boxB_col2[rB] = "boolean"; boxB_col3[rB] = instance_ref.Hidden;
	if ( !instance_ref.Hidden ) { 
		if ( variable_instance_exists(instance_ref,"GUI_X") ) { 
			rB++; boxB_col1[rB] = "GUI_X"; boxB_col2[rB] = "real"; boxB_col3[rB] = instance_ref.GUI_X };
		if ( variable_instance_exists(instance_ref,"GUI_Y") ) { 
			rB++; boxB_col1[rB] = "GUI_Y"; boxB_col2[rB] = "real"; boxB_col3[rB] = instance_ref.GUI_Y };
		if ( variable_instance_exists(instance_ref,"WindowAnchor_X") ) { 
			rB++; boxB_col1[rB] = "WindowAnchor_X"; boxB_col2[rB] = "real"; boxB_col3[rB] = instance_ref.WindowAnchor_X };
		if ( variable_instance_exists(instance_ref,"WindowAnchor_Y") ) { 
			rB++; boxB_col1[rB] = "WindowAnchor_Y"; boxB_col2[rB] = "real"; boxB_col3[rB] = instance_ref.WindowAnchor_Y };
		};
	};
if ( variable_instance_exists(instance_ref,"foc_FocusLevel") ) { 
	rB++; boxB_col1[rB] = "foc_FocusLevel"; boxB_col2[rB] = "real"; boxB_col3[rB] = instance_ref.foc_FocusLevel };
if ( variable_instance_exists(instance_ref,"FocusFixer") ) { 
	rB++; boxB_col1[rB] = "FocusFixer"; boxB_col2[rB] = "boolean"; boxB_col3[rB] = _booleanString(instance_ref.FocusFixer) };
if ( variable_instance_exists(instance_ref,"FocusSetter") ) { 
	rB++; boxB_col1[rB] = "FocusSetter"; boxB_col2[rB] = "boolean"; boxB_col3[rB] = _booleanString(instance_ref.FocusSetter) };
#endregion

//Box Dimensions
var box_columns = 3;
var box_rows = rA+rB;

//Draw Box
ui_ListBackground_create(0,box_x,box_y,-1,-1,box_columns,box_rows);
	ListBackground_ColumnSize[0, 1] = 80;
	ListBackground_ColumnSize[0, 2] = 50;
	ListBackground_ColumnSize[0, 3] = 50;
	ListBackground_ColumnAlpha[0, 1] = 0;
	ListBackground_ColumnAlpha[0, 2] = 0.5;
	ListBackground_ColumnAlpha[0, 3] = 0.3;
	ListBackground_ColumnColour[0, 1] = c_gray7
	ListBackground_ColumnColour[0, 2] = c_gray7
	ListBackground_ColumnColour[0, 3] = c_white
	ListBackground_ColumnMouseovers[0, 3] = 2;
ui_ListBackground_draw();

//Draw Header

_setFont(ft_Pixis07_Condensed);
//Draw Table Contents
_setAlign(fa_right);
_arrayDrawVertical(box_x+82,box_y+ListBackground_Pad_Top[0],boxA_col1,c_black,1,12,78);
_arrayDrawVertical(box_x+82,box_y+ListBackground_Pad_Top[0]+12*rA,boxB_col1,c_black,1,12,78);
_arrayDrawVertical(box_x+82,box_y+ListBackground_Pad_Top[0]-1,boxA_col1,c_nature,1,12,78);
_arrayDrawVertical(box_x+82,box_y+ListBackground_Pad_Top[0]+12*rA,boxB_col1,c_water,1,12,78);
_setAlign(fa_center);
_arrayDrawVertical(box_x+108,box_y+ListBackground_Pad_Top[0],boxA_col2,c_gray9,1,12);
_arrayDrawVertical(box_x+108,box_y+ListBackground_Pad_Top[0]+12*rA,boxB_col2,c_gray9,1,12);
_setAlign(fa_left);
_setFont(ft_Pixis07_Condensed);
_arrayDrawVertical(box_x+136,box_y+ListBackground_Pad_Top[0],boxA_col3,c_white,1,12,48);
_arrayDrawVertical(box_x+136,box_y+ListBackground_Pad_Top[0]+12*rA,boxB_col3,c_white,1,12,48);
//Draw MouseOvers
if ( _mouseInRegions_Array2DColumn(LastListRegions,3) )
	drawRegion(_mouseInRegions_Array2DColumn(LastListRegions,3),c_white,1)