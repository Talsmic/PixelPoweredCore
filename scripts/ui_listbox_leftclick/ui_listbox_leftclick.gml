///ui_listbox_leftclick();
if !_inFocus() exit;
		
//Find Correct List Length
ui_listbox_command("ListLength");

//Define visual range
var range_start = Listbox_Row_Starting * Listbox_Row_Length - Listbox_Row_Length + 1;
var range_end = range_start + Listbox_Row_Length * Listbox_Column_Length - 1;
if ( range_end > Listbox_List_Length ) { range_end = Listbox_List_Length };

//Buttons
switch ( Listbox_Mode ) {
	case "Icons":
		var _x = Listbox_X+18; var _y = Listbox_Y+20; 
		for ( var i=range_start; i<=range_end; ++i ) {
			if ( _mouseInRegion( _spriteRegion( _x, _y, 24 ) ) ) {
				Listbox_Position = i;
				};
			_x += 30;
			if ( _x > Listbox_X+Listbox_Row_Length*30 ) { _x = Listbox_X+18; _y += 31 };
			};
		break;
	case "Words":
		var _x = Listbox_X+4; var _y = Listbox_Y+6; 
		//Draw List
		for ( var i=range_start; i<=range_end; ++i ) {
			if ( _mouseInRegion( _regionBySize( _x,_y,Listbox_WordWidth,10 ) ) ) {
				Listbox_Position = i;
				};
			_x += Listbox_WordWidth;
			if ( _x > Listbox_X+Listbox_Row_Length*Listbox_WordWidth ) { _x = Listbox_X+4; _y += 10 };
			};
		break;
	};
	
//Scroll Bars
switch ( Listbox_Mode ) {
	case "Icons":
		//Up Scroll
		if ( _mouseInRegion( _regionBySize( Listbox_X-1,Listbox_Y-2,Listbox_Row_Length*30+6,6 ) ) ) {
			ui_listbox_command("ScrollUp")	};
		//Down Scroll
		if ( _mouseInRegion( _regionBySize( Listbox_X-1,Listbox_Y+Listbox_Column_Length*31+4,Listbox_Row_Length*30+6,6 ) ) ) {
			ui_listbox_command("ScrollDown")	};
		break;
	case "Words":
		//Up Scroll
		if ( _mouseInRegion( _regionBySize( Listbox_X-1,Listbox_Y-2,Listbox_Row_Length*Listbox_WordWidth+6,6 ) ) ) {
			ui_listbox_command("ScrollUp")	};
		//Down Scroll
		if ( _mouseInRegion( _regionBySize( Listbox_X-1,Listbox_Y+Listbox_Column_Length*10+4,Listbox_Row_Length*Listbox_WordWidth+6,6 ) ) ) {
			ui_listbox_command("ScrollDown")	};
		break;
	};