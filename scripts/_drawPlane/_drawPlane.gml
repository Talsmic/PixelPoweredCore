///_drawPlane(x,y,width,height,[colour],[alpha],[outline],[rotation]);
/// @arg x			{real}
/// @arg y			{real}
/// @arg width		{real}
/// @arg height		{real}
/// @arg [colour]	#c_code#			(default: draw_get_color())
/// @arg [alpha]	{real|0..1}			(default: draw_get_alpha())
/// @arg [outline]	{boolean+}			(default: false) [false, true&thickness]
/// @arg [rotation]	{integer|0..360}	(default: 0)
/*
	[[ Draws ]] a rectangle at [x],[y] of [width] and [height]
	Optionally, of [colour], [alpha] and [rotation]
	[outline] 0: flat colour fill, 1+: outline of [outline] thickness
*/
#region Arguments
if argument_count < 4 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var _x =		argument[0];
var _y =		argument[1];
var _width =	argument[2];
var _height =	argument[3];
var _colour =	argument_count > 4 ? argument[4] : draw_get_color();
var _alpha =	argument_count > 5 ? argument[5] : draw_get_alpha();
var _outline =	argument_count > 6 ? argument[6] : false;
var _rotation =	argument_count > 7 ? argument[7] : 0;
#endregion

//Draw the plane
if _outline {
	draw_sprite_ext(spr_1x1,0, _x,					_y,						_width,		_outline,	0, _colour, _alpha);
	draw_sprite_ext(spr_1x1,0, _x,					_y+_height-_outline,	_width,		_outline,	0, _colour, _alpha);
	draw_sprite_ext(spr_1x1,0, _x+_width-_outline,	_y,						_outline,	_height,	0, _colour, _alpha);
	draw_sprite_ext(spr_1x1,0, _x,					_y,						_outline,	_height,	0, _colour, _alpha);
	}		
else {
	draw_sprite_ext(spr_1x1,0, _x, _y, _width, _height, _rotation, _colour, _alpha);
	};

/*[Notes]=======================================================================
	-	While GameMaker offers the ability to draw rectangles with 
		draw_rectangle(), these rectangles often skip pixels or have sizing 
		issues at odd resolution scalings.
	-	This function cheats, by stretching a 1x1 sprite to fill the required 
		area you achieve the same effect but without the scaling issues of 
		draw_rectangle().
	-	The outline option lets you draw boxes rather than real planes
	