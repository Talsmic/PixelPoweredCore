///draw_textbutton_outlined(x,y,string,colour);
/// @arg x			
/// @arg y
/// @arg string		
/// @arg colour
var X = argument0; 
var Y = argument1; 
var _string = argument2; 
var colour = argument3;
/*
	>Draws a basic text button
*/

if ( colour = c_white ) { var colour2 = c_darkgray } else { var colour2 = c_white };
draw_textbutton_ext(X,Y,_string,"Outline",colour,colour2,c_black,0,0);