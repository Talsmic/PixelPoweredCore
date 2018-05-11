///draw_splane(x2,y2,x2,y2);
/*
	[PPC][Common Function][Drawing]
	Draws a rectangle at [x1],[y1] to [x2],[y2]
	Uses the stored colour and alpha
*/
/// @arg {real}		x1
/// @arg {real}		y1
/// @arg {real}		x2
/// @arg {real}		y2
var colour = argument4;
var alpha = argument5;

//Set the smallest X as the start point and width as ( biggest_x - smallest_x )
if ( argument0 < argument2 ) {
	var xx = argument0;
	var width = argument2-argument0;
	};
else {
	var xx = argument2;
	var width = argument0-argument2;
	};
	
//Set the smallest Y as the start point and height as ( biggest_y - smallest_y )
if ( argument1 < argument3 ) {
	var yy = argument1;
	var height = argument3-argument1;
	};
else {
	var yy = argument3;
	var height = argument1-argument3;
	};

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
	-	The provided functions draw_plane() and draw_plane_coloured() provide
		a similar functionality but ask for width and height instead of ending
		points. Use what you prefer.

	