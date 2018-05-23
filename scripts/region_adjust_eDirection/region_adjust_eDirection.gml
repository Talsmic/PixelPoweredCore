///region_adjust_eDirection(region,direction,distance);
/// @arg region_array	{region}
/// @arg direction		{eDirection}
/// @arg distance		{real}
/*
	>>Returns {region}
	Increases a [region] size by [distance] in one [direction]
	This is useful over region_expand in situations where you have an eDirection in a variable
*/
#region Arguments
var region_array = argument0;
var adjust_direction = argument1;
var adjust_distance = argument2;
#endregion

//Grow
switch ( adjust_direction ) {
	default:
	case LEFT:		region_array[eR.x1] -= adjust_distance; 	break;
	case TOP: 		region_array[eR.y1] -= adjust_distance;	break;
	case RIGHT:		region_array[eR.x2] += adjust_distance;	break;
	case BOTTOM:	region_array[eR.y2] += adjust_distance;	break;
	};
	
//Recalculate width and height
region_array[eR.w] = region_array[eR.x2] - region_array[eR.x1];
region_array[eR.h] = region_array[eR.y2] - region_array[eR.y1];
	
return region_array;