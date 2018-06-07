/// @description Manage Global Beats
	
//Manage Beats
if ( GlobalTracking_Beats ) {
	
	//Progress the standard GameBeat
	global.GameBeat = _beat(global.GameBeat);
	
	//Reset the ScrollBeat if a ScrollKey is pressed
	for ( var i=0 ; i<array_length_1d(ScrollKeys) ; ++i ) {
		if ( keyboard_check_released(ScrollKeys[i]) ) { global.ScrollBeat = _beat(global.ScrollBeat, false, true) };
		};
		
	//Progress the ScrollBeat
	if ( global.ScrollBeat[0] == 1 ) {	global.ScrollBeat = _beat(global.ScrollBeat, false, true)  }
								else {	global.ScrollBeat = _beat(global.ScrollBeat) };
								
	};