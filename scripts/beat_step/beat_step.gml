///beat_step(beat);
/// @arg beat
var beat = argument0;

beat[3]++
if ( beat[3] >= beat[1] ) {
	beat[3] = 0;
	beat[0] += beat[2]*beat[4];
	if ( beat[0] >= 1 ) { beat[0] = 1; beat[4] = -1 };
	if ( beat[0] <= 0 ) { beat[0] = 0; beat[4] = 1 };
	};
	
return beat;