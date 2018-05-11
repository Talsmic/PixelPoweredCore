///draw_blackbox(x,y,width,height);
/// @arg x			
/// @arg y
/// @arg width		
/// @arg height
/*
	[Edited 24/4/2018] (Variant of draw_tilebox_ext)
	Draws a coloured, semi-termparent UI box with rounded corners 
*/

var X = argument0; 
var Y = argument1;
var width = argument2; 
var height = argument3;

draw_tilebox_ext(X,Y,width,height,spr_blackbox,c_white,0.8);