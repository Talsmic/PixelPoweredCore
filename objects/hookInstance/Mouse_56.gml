
ui_TabSet_leftclick(1);

var colcheck = mouse_in_region_array2d_column(ClickCells,3);
if ( colcheck ) {
	Master.InputArgument = colcheck;
	Master.alarm[2] = 1;
	};