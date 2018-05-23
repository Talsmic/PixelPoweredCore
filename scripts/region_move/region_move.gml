///region_move(region,move_x,move_y);
/// @arg region {region}
/// @arg move_x {real}
/// @arg move_y {real}
/*
	>>Returns {region}
	Shifts [region] by [move_x],[move_y]
*/
#region Arguments
var region_array = argument0;
var move_x = argument1;
var move_y = argument2;
#endregion	
	
var x1 = region_array[eR.x1] + move_x;
var y1 = region_array[eR.y1] + move_y;
var x2 = region_array[eR.x2] + move_x;
var y2 = region_array[eR.y2] + move_y;
	
var output = [x1,y1,x2,y2,region_array[eR.w],region_array[eR.h]];
return output;