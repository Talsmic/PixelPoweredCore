///_beat(beat_array,[loop],[reset],[acceleration]);
/// @arg beat				#beat#
/// @arg [loop]				{boolean}	(default: false)
/// @arg [reset]			{boolean}	(default: false)
/// @arg [acceleration]		{real}		(default: 0)
/*
	<< Returns >> {array} [aBeat.value, aBeat.v_min, aBeat.max, aBeat.increment, aBeat.rate]
	Increases a beat, with many optional behaviors
		[loop]			if [loop] = true, as soon as the beat exceeds the maximum it wraps back around to the minimum and starts going up again
						if [loop] = false, the beat revereses and counts back down to the minimum
		[reset]			if [reset] = true, the beat will reset to the minimum value		
		[acceleration]  if [acceleration] != 0, the beat's increment rate will change after the beat changes
*/
#region Special Enumerator: #aBeat# (for Array IDs)
enum aBeat { 
	value, v_min, v_max, increment, rate, steps };
#endregion
#region Arguments & Variables
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var beat =				_asArrayOf(argument[0], [0,1,10,1,1,0]);
var loop =				argument_count > 1 ? argument[1] : false;
var reset =				argument_count > 2 ? argument[2] : false;
var acceleration =		argument_count > 3 ? argument[3] : 0;
#endregion

//[Optional] [reset]	
if ( reset ) {
	beat[aBeat.value] = beat[aBeat.v_min]; 
	beat[aBeat.steps] = 0; 
	return beat;
	};
	
//Increase step count
beat[aBeat.steps]++;			

//If steps is high enough, beat
if ( beat[aBeat.steps] <= beat[aBeat.rate] ) {
	beat[aBeat.value] += beat[aBeat.increment]; 
	beat[aBeat.steps] = 0;			
	};

//If exceeding max
if ( beat[aBeat.value] >= beat[aBeat.v_max] ) {
	if ( loop ) { 
		beat[aBeat.value] = beat[aBeat.value] - beat[aBeat.v_max]	+ beat[aBeat.v_min];
		} 	
	else { 
		beat[aBeat.value] = beat[aBeat.v_max];
		beat[aBeat.increment] = -beat[aBeat.increment];
		} ;
	};
	
//[Optional] [acceleration]	
if ( acceleration != 0 ) {
	beat[aBeat.increment] += acceleration;
	};
	
return beat;

/*=[Notes]======================================================================
	[aBeat.value, aBeat.min, aBeat.max, aBeat.increment, aBeat.rate]
		aBeat.value			|	current beat value
		aBeat.min 			|	minimum beat value
		aBeat.max			|	maximum beat value
		aBeat.increment		|	amount to increase value
		aBeat.rate			|	# of steps between increments	(default: 1)
		aBeat.steps			|	# of steps since last increment	(default: 1)