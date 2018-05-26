/// @description Manage Global Beats
	
//Manage Beats
if ( set_GlobalBeats ) {
	global.GameBeat = beat_step(global.GameBeat);
	global.ScrollBeat = beat_step(global.ScrollBeat);
	};