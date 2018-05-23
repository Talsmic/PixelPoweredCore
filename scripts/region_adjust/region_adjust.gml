///region_adjust(region,adjustment);
/// @arg region {region}
/// @arg adjust {integer or array}
/*
	>>Returns {region}
	if [adjust] is a number, it'll change [region] by adding that much to the width and height
	if [adjust] is an array, it'll change [region]'s dimensions [LEFT,UP,RIGHT,DOWN]
*/
#region Arguments
var region_array = argument0;
var adjust = is_array(argument1) ? argument1 : [0,0,argument1,argument1];
adjust = fix_array_1d(adjust,4,4,0);
#endregion

var x1 = region_array[eR.x1] - adjust[0];
var y1 = region_array[eR.y1] - adjust[1];
var x2 = region_array[eR.x2] + adjust[2];
var y2 = region_array[eR.y2] + adjust[3];

//Recalculate width and height
var w = x2 - x1;
var h = y2 - y1;
	
var output = [x1,y1,x2,y2,w,h];
return output;