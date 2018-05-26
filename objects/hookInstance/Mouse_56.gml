
uiTabset_leftclick(1);

var colcheck = _mouseInRegion_array2d_column(ClickCells,3);
if ( colcheck ) {
	Master.InputArgument = colcheck;
	Master.alarm[2] = 1;
	};