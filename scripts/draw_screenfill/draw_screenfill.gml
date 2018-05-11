///draw_screenfill(colour,alpha);
/*
	[PPC][Common Function][Drawing]
	Draws a rectangle at [x1],[y1] to [x2],[y2]
	Uses the stored colour and alpha
*/
/// @arg {c_code}	[colour]
/// @arg {real}		[alpha]
if ( argument_count > 0 ) { var colour = argument[0] };
					 else { var colour = draw_get_color() };
if ( argument_count > 1 ) { var alpha = argument[1] };
					 else { var alpha = draw_get_alpha() };

draw_sprite_tiled_ext(spr_1x1,0,0,0,1,1,colour,alpha);

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