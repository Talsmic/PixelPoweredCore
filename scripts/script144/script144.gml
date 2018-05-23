///ui_CheckBox_draw([CheckBoxID],[x],[y]);
/// @arg [CheckBoxID] {integer}	(default: 0)
/// @arg [x] {real}				
/// @arg [y] {real}		
if argument_count > 0 { var ref = argument[0] } else { var ref = 0 };
if argument_count > 1 { TabSet_X[ref] = argument[1] };
if argument_count > 2 { TabSet_Y[ref] = argument[2] };