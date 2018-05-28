///_beat(beat_array,[loop],[reset],[acceleration]);
/// @arg beat				#beat#
/// @arg [loop]				{boolean}	(default: false)
/// @arg [reset]			{boolean}	(default: false)
/// @arg [acceleration]		{real}		(default: 0)
/*
	<< Returns >> {array} [eBeat.value, eBeat.v_min, eBeat.max, eBeat.increment, eBeat.rate]
	Increases a beat, with many optional behaviors
		[loop]			if [loop] = true, as soon as the beat exceeds the maximum it wraps back around to the minimum and starts going up again
						if [loop] = false, the beat revereses and counts back down to the minimum
		[reset]			if [reset] = true, the beat will reset to the minimum value		
		[acceleration]  if [acceleration] != 0, the beat's increment rate will change after the beat changes
*/
enum eBeat { 
	value, v_min, v_max, increment, rate, steps };
#region Arguments
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var beat =				_validateArray(argument[0],6,6,[0,1,10,1,1,0]);
var loop =				argument_count > 1 ? argument[1] : false;
var reset =				argument_count > 2 ? argument[2] : false;
var acceleration =		argument_count > 3 ? argument[3] : 0;
#endregion

//[Optional] [reset]	
if ( reset ) {
	beat[eBeat.value] = beat[eBeat.v_min]; 
	beat[eBeat.steps] = 0; 
	return beat;
	};
	
//Increase step count
beat[eBeat.steps]++;			

//If steps is high enough, beat
if ( beat[eBeat.steps] <= beat[eBeat.rate] ) {
	beat[eBeat.value] += beat[eBeat.increment]; 
	beat[eBeat.steps] = 0;			
	};

//If exceeding max
if ( beat[eBeat.value] >= beat[eBeat.v_max] ) {
	if ( loop ) { 
		beat[eBeat.value] = beat[eBeat.value] - beat[eBeat.v_max]	+ beat[eBeat.v_min];
		} 	
	else { 
		beat[eBeat.value] = beat[eBeat.v_max];
		beat[eBeat.increment] = -beat[eBeat.increment];
		} ;
	};
	
//[Optional] [acceleration]	
if ( acceleration != 0 ) {
	beat[eBeat.increment] += acceleration;
	};
	
return beat;

/*=[Notes]======================================================================
	[eBeat.value, eBeat.min, eBeat.max, eBeat.increment, eBeat.rate]
		eBeat.value			|	current beat value
		eBeat.min 			|	minimum beat value
		eBeat.max			|	maximum beat value
		eBeat.increment		|	amount to increase value
		eBeat.rate			|	# of steps between increments	(default: 1)
		eBeat.steps			|	# of steps since last increment	(default: 1)