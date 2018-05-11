///define_region_centered(x,y,width,length);
/// @arg x
/// @arg y
/// @arg width
/// @arg height
/*
	[Edited 26/4/2018]
*/
var X = argument0;
var Y = argument1;
var width = argument2;
var height = argument3;

var region;
region[1] = X-width*0.5;
region[2] = Y-width*0.5;
region[3] = X+width*0.5;
region[4] = Y+height*0.5;

return region;