///region_move_eDirection(region,direction,distance);
/// @arg region_array	{region}
/// @arg direction		{eDirection}
/// @arg distance		{real}
/*
	>>Returns {region}
	Moves a [region] size by [distance] in one [direction]
	This is useful over region_move in situations where you have an eDirection in a variable
*/
#region Arguments
var region_array = argument0;
var move_direction = argument1;
var move_distance = argument2;
#endregion

//Grow
switch ( move_direction ) {
	default:
	case LEFT:		region_array[eR.x1] -= move_distance;	region_array[eR.x2] -= move_distance;	break;
	case TOP: 		region_array[eR.y1] -= move_distance;	region_array[eR.y2] -= move_distance;	break;
	case RIGHT:		region_array[eR.x1] += move_distance;	region_array[eR.y2] += move_distance;	break;
	case BOTTOM:	region_array[eR.y1] += move_distance;	region_array[eR.x2] += move_distance;	break;
	};
	
return region_array;