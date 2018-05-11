///define_region_textbutton(x,y,string,height_padding,width_padding);
/// @arg x			
/// @arg y		
/// @arg string
/// @arg height_padding
/// @arg width_padding
/*
	[Edited 26/4/2018]
	Textbutton regions are effected by the loaded font
*/
var X = argument0; 
var Y = argument1; 
var _string = argument2; 
var height_padding = argument3; 
var width_padding = argument4; 

var height = string_height( _string ) - 2;
var width = string_width( _string ) - 2;

var region;
region[1] = X-width_padding;			//[1] X1 [Integer]
region[2] = Y-height_padding;			//[2] Y1 [Integer]
region[3] = X+width+width_padding*2;	//[3] X2 [Integer]
region[4] = Y+height+height_padding*2;	//[4] Y2 [Integer]
	
return region;