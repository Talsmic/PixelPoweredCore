///fillScreen([colour],[alpha]);
/// @arg [colour]	#c_code#		(default: draw_get_color())
/// @arg [alpha]	{real|0..1}		(default: draw_get_alpha())
/*
	[[ Draws ]] a fill of the screen with [colour],[alpha]
*/
#region Arguments & Variables
var colour = argument_count > 0 ? argument[0] : draw_get_color();
var alpha =	 argument_count > 1 ? argument[1] : draw_get_alpha();
var output = false;
#endregion

draw_sprite_tiled_ext(spr_1x1,0,0,0,1,1,colour,alpha);