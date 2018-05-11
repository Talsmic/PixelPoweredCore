///define_region_icon(x,y,icon_size);
/// @arg x
/// @arg y
/// @arg size
var X = argument0;
var Y = argument1;
var icon_size = argument2;
/*
	Icons use a slightly wonky regions definition because of frame dimensions
*/
var icon_width = floor(icon_size);
var icon_height = frac(icon_size)*100;
if ( icon_height == 0 ) { icon_height = icon_width };

var region;
region[1] = X-icon_width*0.5-3;		//[1] X1 [Integer]
region[2] = Y-icon_height*0.5-3;	//[2] Y1 [Integer]
region[3] = X+icon_width*0.5+1;		//[3] X2 [Integer]
region[4] = Y+icon_height*0.5+1;	//[4] Y2 [Integer]

return region;