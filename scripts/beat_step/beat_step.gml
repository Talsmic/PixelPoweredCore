///beat_step(beat,[loop],[fixed_direction],[instant_reset],{[keyresets]},{[mouseresets]},[reset_size]);
/// @arg beat				{array}
/// @arg [loop]				{boolean}	(default: false)
/// @arg [fixed_direction]	{boolean}	(default: false)
/// @arg [instant_reset]	{boolean}	(default: false)
/// @arg [keyresets]		{array}		(default: false)
/// @arg [mouseresets]		{array}		(default: false)
/// @arg [reset_size]		{array}		(default: 0)
#region Arguments
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~>
var beat =				argument[0];
var loop =				argument_count > 1 ? argument[1] : false;
var fixed_direction =	argument_count > 2 ? argument[2] : false;
var instant_reset =		argument_count > 3 ? argument[3] : false;
var keyresets =			argument_count > 4 ? argument[4] : false;
var mouseresets =		argument_count > 5 ? argument[5] : false;
var reset_size =		argument_count > 6 ? argument[6] : 0;
#endregion

//[Optional] Instant Reset
//Resets the beat instantly if it's at maximum, for use with beats you only 
//want to be at maxiumum for 1 frame.
if ( instant_reset and beat[eBeat.value] >= beat[eBeat.size] ) {
	beat[eBeat.value] = reset_size; //beat_value
	beat[eBeat.count] = 0;			//beat_count
	if fixed_direction == POSITIVE { beat[eBeat.direction] = POSITIVE	};	//beat_direction 
	if fixed_direction == NEGATIVE { beat[eBeat.direction] = NEGATIVE	};	//beat_direction 
	};

//[Optional] Key Resets
//Pressing (not releasing) these keys resets the beat
if is_array(keyresets) {
	for ( var i=0; i<array_length_1d(keyresets); i++ ) {
		if ( keyboard_check_pressed(keyresets[i]) ) { 
			beat[eBeat.value] = reset_size;   //beat_value
			beat[eBeat.count] = 0;			//beat_count
			if fixed_direction == POSITIVE { beat[eBeat.direction] = POSITIVE	};	//beat_direction 
			if fixed_direction == NEGATIVE { beat[eBeat.direction] = NEGATIVE	};	//beat_direction 
			return beat;
			};
		};
	};
if is_array(mouseresets) {
	for ( var i=0; i<array_length_1d(mouseresets); i++ ) {
		if ( mouse_check_button_pressed(mouseresets[i]) ) { 
			beat[eBeat.value] = reset_size; //beat_value
			beat[eBeat.count] = 0;			//beat_count
			if fixed_direction == POSITIVE { beat[eBeat.direction] = POSITIVE	};	//beat_direction 
			if fixed_direction == NEGATIVE { beat[eBeat.direction] = NEGATIVE	};	//beat_direction 
			return beat;
			};
		};
	};
	
//Normal Beat Operation

//beat_count moves down
beat[eBeat.count]--;			
//if beat_count hits zero, cause a beat
if ( beat[eBeat.count] <= 0 ) {
	//beat_count reset
	beat[eBeat.count] = 0;			
	//Change beat_value by beat_amount based on beat_direction
	switch fixed_direction { 
		//If no fixed direction operation, use beat_direction
		default:
		case false:		beat[eBeat.value] += beat[eBeat.amount] * beat[5];	break;		
		case POSITIVE:  beat[eBeat.value] += beat[eBeat.amount];			break;		
		case NEGATIVE: 	beat[eBeat.value] -= beat[eBeat.amount];			break;		
		};
	
	};

beat[eBeat.amount]++
if ( beat[eBeat.amount] >= beat[eBeat.count] ) {
	beat[eBeat.amount] = 0;
	beat[eBeat.value] += beat[eBeat.speed]*beat[eBeat.size];
	if ( beat[eBeat.value] >= 1 ) { beat[eBeat.value] = 1; beat[eBeat.size] = -1 };
	if ( beat[eBeat.value] <= 0 ) { beat[eBeat.value] = 0; beat[eBeat.size] = 1 };
	};
	
return beat;