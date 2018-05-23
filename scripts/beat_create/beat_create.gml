///beat_create([beat_speed],[beat_amount],[beat_size]);
/// @arg [beat_speed]	{integer}	(default: 1)
/// @arg [beat_amount]	{real}		(default: 0.05)
/// @arg [beat_size]	{real}		(default: 1)
/*
	>>Returns {array} [beat_value,beat_count,beat_speed,beat_amount,beat_size,beat_direction]
*/
#region Arguments
var beat_speed =	argument_count > 0 ? argument[0] : 1;
var beat_amount =	argument_count > 1 ? argument[1] : 0.05;
var beat_size =		argument_count > 2 ? argument[2] : 1;
#endregion

var beat;
beat[eBeat.value] =		0;				//beat_value
beat[eBeat.count] =		0;				//beat_count
beat[eBeat.speed] =		beat_speed;		//beat_speed
beat[eBeat.amount] =	beat_amount;	//beat_amount
beat[eBeat.size] =		beat_size;		//beat_size
beat[eBeat.direction] = POSITIVE;		//beat_direction

return beat;

/*=[Notes]======================================================================
	[beat_value,beat_count,beat_speed,beat_amount,beat_size,beat_direction]
		beat_value =		the currently stored beat value
		beat_count =		the number of steps until the beat changes
		beat_speed =		how many steps between beat changes
		beat_amount =		how much the beat changes each change
		beat_size =			how high the beat can get before changing direction
		beat_direction =	is the beat coung UP or DOWN