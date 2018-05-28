/// @description Manage Global Beats
	
//Manage Beats
if ( set_GlobalBeats ) {

	global.GameBeat = _beat(global.GameBeat);
	
	for ( var i=0 ; i<array_length_1d(set_ScrollKeys) ; i++ ) {
		if ( keyboard_check_released(set_ScrollKeys[i]) ) { global.ScrollBeat = _beat(global.ScrollBeat, false, true) };
		};
		
	if ( global.ScrollBeat[0] == 1 ) {	global.ScrollBeat = _beat(global.ScrollBeat, false, true)  }
								else {	global.ScrollBeat = _beat(global.ScrollBeat) };
								
	};