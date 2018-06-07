///_beatArray(min,max,increment_size,[increment_rate]);
/// @arg [min]				{real}
/// @arg [max]				{real}		
/// @arg [increment_size]	{real}		
/// @arg [increment_rate]	{integer|steps}	(default: 1)
/*
	<< Returns >> {array} [aBeat.value, aBeat.min, aBeat.max, aBeat.increment, aBeat.rate]
	This function creates an array for a beat to be used with _beat
	Note that you don't need to actually use this function, it's just an easy way to do it
*/

var beat;
beat[aBeat.value] =		argument_count > 0 ? argument[0] : 0;
beat[aBeat.v_min] =		argument_count > 0 ? argument[0] : 0;
beat[aBeat.v_max] =		argument_count > 1 ? argument[1] : 10;
beat[aBeat.increment] =	argument_count > 2 ? argument[2] : 1;
beat[aBeat.rate] =		argument_count > 3 ? argument[3] : 1;
beat[aBeat.steps] =		0;

return beat;

/*=[Notes]======================================================================
	[aBeat.value, aBeat.min, aBeat.max, aBeat.increment, aBeat.rate]
		aBeat.value			|	current beat value
		aBeat.min 			|	minimum beat value
		aBeat.max			|	maximum beat value
		aBeat.increment		|	amount to increase value
		aBeat.rate			|	# of steps between increments	(default: 1)
		aBeat.steps			|	# of steps since last increment	(default: 1)