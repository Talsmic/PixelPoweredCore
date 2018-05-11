///draw_plane(x,y,width,height);
/*
	[PPC][Common Function][Drawing]
	Draws a rectangle at [x],[y] of [width] and [height]
	Uses the stored colour and alpha
*/
/// @arg {real}		x
/// @arg {real}		y
/// @arg {real}		width
/// @arg {real}		height
var xx = argument0;
var yy = argument1;
var width = argument2;
var height = argument3;

//Draw the plane
draw_sprite_ext(spr_1x1,0,xx,yy,width,height,0,draw_get_color(),draw_get_alpha());

/*[PPC Dependancies]============================================================
	[Sprite]	spr_1x1();
==[PPC Notes]===================================================================
	-	While GameMaker offers the ability to draw rectangles with 
		draw_rectangle(), these rectangles often skip pixels or have sizing 
		issues at odd resolution scalings.
	-	This function cheats, by stretching a 1x1 sprite to fill the required 
		area you achieve the same effect but without the scaling issues of 
		draw_rectangle().
	-	I find it easier to say "I need a 50x5 rectangle at x,y" than "I need a 
		rectangle between x,y and x2,y2". If you prefer	using 2 sets of co-ords 
		than width and height, I've included draw_splane() and 
		draw_splane_coloured() to do the same thing. Use what you prefer.

	