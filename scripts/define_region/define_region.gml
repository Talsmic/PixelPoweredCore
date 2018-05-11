///define_region(x,y,width,length);
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
region[1] = X;
region[2] = Y;
region[3] = X+width;
region[4] = Y+height;

return region;