///draw_blackbox_sharp(x,y,width,height,topleft,topright,bottomleft,bottomright);
/// @arg x			
/// @arg y
/// @arg width		
/// @arg height
///	@arg topleft	
/// @arg topright
///	@arg bottomleft 
/// @arg bottomright
/*
	[Edited 24/4/2018] (Variant of draw_tilebox_ext)
	Draws a coloured, semi-termparent UI box with optional corners 
*/

var X = argument0; 
var Y = argument1;
var width = argument2; 
var height = argument3;
var corner;
corner[1] = argument4;
corner[2] = argument5;
corner[3] = argument6;
corner[4] = argument7;

draw_tilebox_cornerless(X,Y,width,height,spr_blackbox,c_white,0.8,corner[1],corner[2],corner[3],corner[4]);