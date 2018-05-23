///draw_plane_bypoints(x1,y1,x2,y2,[colour],[alpha],[outline],[rotation]);
/// @arg x1			{real}		
/// @arg y1			{real}		
/// @arg x2			{real}		
/// @arg y2			{real}		
/// @arg [colour]	{c_code}			(default: draw_get_color())
/// @arg [alpha]	{real|0..1}			(default: draw_get_alpha())
/// @arg [outline]	{boolean+}			(default: false) [false, true&thickness]
/// @arg [rotation]	{integer|0..360}	(default: 0)
/*
	>>Draws a rectangle at [x1],[y1] to [x2],[y2]
	Optionally, of [colour], [alpha] and [rotation]
*/
#region Arguments
if argument_count < 4 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~>
if ( argument[0] < argument[2] ) { var draw_x = argument[0]; var x2 = argument[2] };
							else { var draw_x = argument[2]; var x2 = argument[0] };
if ( argument[1] < argument[3] ) { var draw_y = argument[1]; var y2 = argument[3] };
							else { var draw_y = argument[3]; var y2 = argument[1] };
var colour =	argument_count > 4 ? argument[4] : draw_get_color();
var alpha =		argument_count > 5 ? argument[5] : draw_get_alpha();
var outline =	argument_count > 6 ? argument[6] : false;
var rotation =	argument_count > 7 ? argument[7] : 0;
var width = x2 - draw_x;
var height = y2 - draw_y;
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
	-	The provided function draw_plane() provides	a similar functionality 
		but asks for width and height instead of ending	points. 
		Use what you prefer.