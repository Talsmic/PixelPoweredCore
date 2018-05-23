//Make sure updates are happening
if ( Settings_UpdateWindow ) {
	if ( alarm[0] <= 0 ) {	alarm[0] = Settings_UpdateWindow	};
	};
	
//Manage Beats
if ( Settings_GlobalBeats ) {
	global.GameBeat = beat_step(global.GameBeat);
	global.ScrollBeat = beat_step(global.ScrollBeat);
	};