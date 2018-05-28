///_beatArray(min,max,increment_size,[increment_rate]);
/// @arg [min]				{real}
/// @arg [max]				{real}		
/// @arg [increment_size]	{real}		
/// @arg [increment_rate]	{integer|steps}	(default: 1)
/*
	<< Returns >> {array} [eBeat.value, eBeat.min, eBeat.max, eBeat.increment, eBeat.rate]
	This function creates an array for a beat to be used with _beat
	Note that you don't need to actually use this function, it's just an easy way to do it
*/

var beat;
beat[eBeat.value] =		argument_count > 0 ? argument[0] : 0;
beat[eBeat.v_min] =		argument_count > 0 ? argument[0] : 0;
beat[eBeat.v_max] =		argument_count > 1 ? argument[1] : 10;
beat[eBeat.increment] =	argument_count > 2 ? argument[2] : 1;
beat[eBeat.rate] =		argument_count > 3 ? argument[3] : 1;
beat[eBeat.steps] =		0;

return beat;

/*=[Notes]======================================================================
	[eBeat.value, eBeat.min, eBeat.max, eBeat.increment, eBeat.rate]
		eBeat.value			|	current beat value
		eBeat.min 			|	minimum beat value
		eBeat.max			|	maximum beat value
		eBeat.increment		|	amount to increase value
		eBeat.rate			|	# of steps between increments	(default: 1)
		eBeat.steps			|	# of steps since last increment	(default: 1)