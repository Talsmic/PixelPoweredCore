///draw_plane(x,y,width,height,[colour],[alpha],[outline],[rotation]);
/// @arg x			{real}
/// @arg y			{real}
/// @arg width		{real}
/// @arg height		{real}
/// @arg [colour]	{c_code}			(default: draw_get_color())
/// @arg [alpha]	{real|0..1}			(default: draw_get_alpha())
/// @arg [outline]	{boolean+}			(default: false) [false, true&thickness]
/// @arg [rotation]	{integer|0..360}	(default: 0)
/*
	>>Draws a rectangle at [x],[y] of [width] and [height]
	Optionally, of [colour], [alpha] and [rotation]
	[outline] 0: flat colour fill, 1+: outline of [outline] thickness
*/
#region Arguments
if argument_count < 4 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~>
var draw_x =	argument[0];
var draw_y =	argument[1];
var width =		argument[2];
var height =	argument[3];
var colour =	argument_count > 4 ? argument[4] : draw_get_color();
var alpha =		argument_count > 5 ? argument[5] : draw_get_alpha();
var outline =	argument_count > 6 ? argument[6] : false;
var rotation =	argument_count > 7 ? argument[7] : 0;
#endregion

//Draw the plane
if outline {
	draw_sprite_ext(spr_1x1,0,draw_x,draw_y,width,outline,0,colour,alpha);
	draw_sprite_ext(spr_1x1,0,draw_x,draw_y+height-outline,width,outline,0,colour,alpha);
	draw_sprite_ext(spr_1x1,0,draw_x+width-outline,draw_y,outline,height,0,colour,alpha);
	draw_sprite_ext(spr_1x1,0,draw_x,draw_y,outline,height,0,colour,alpha);
	}
else {
	draw_sprite_ext(spr_1x1,0,draw_x,draw_y,width,height,rotation,colour,alpha);
	};

/*[Notes]=======================================================================
	-	While GameMaker offers the ability to draw rectangles with 
		draw_rectangle(), these rectangles often skip pixels or have sizing 
		issues at odd resolution scalings.
	-	This function cheats, by stretching a 1x1 sprite to fill the required 
		area you achieve the same effect but without the scaling issues of 
		draw_rectangle().
	-	I find it easier to say "I need a 50x5 rectangle at x,y" than "I need a 
		rectangle between x,y and x2,y2". If you prefer	using 2 sets of co-ords 
		than width and height, I've included draw_plane_bypoints() to do that.
		Use what you prefer.
	-	The outline option lets you draw boxes rather than real planes
	