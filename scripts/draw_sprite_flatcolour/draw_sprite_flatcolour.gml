///draw_sprite_flatcolour([sprite_id],[image_id],[x],[y],[colour],[alpha]);
/// @arg [sprite_id]	#sprite_id#		 (default: sprite_index)
/// @arg [image_id]		#image_id#		 (default: image_index)
/// @arg [x]			{real}			 (default: x)
/// @arg [y]			{real}			 (default: y)
///	@arg [colour]		#c_code#		 (default: draw_get_color())
/// @arg [alpha]		{real|0..1}		 (default: draw_get_alpha())
/// @arg [x_scale]		{real}			 (default: 1)
/// @arg [y_scale]		{real}			 (default: 1)
/// @arg [rotation]		{integer|0..360} (default: 0)
#region Arguments
var sprite_id =	argument_count > 0 ? argument[0] : sprite_index;
var image_id =	argument_count > 1 ? argument[1] : image_index;
var draw_x =	argument_count > 2 ? argument[2] : x;
var draw_y =	argument_count > 3 ? argument[3] : y;
var colour =	argument_count > 4 ? argument[4] : draw_get_color();
var alpha =		argument_count > 5 ? argument[5] : draw_get_alpha();
var x_scale =	argument_count > 6 ? argument[6] : 1;
var y_scale =	argument_count > 7 ? argument[7] : 1;
var rotation =	argument_count > 8 ? argument[8] : 0;
#endregion

draw_sprite_ext( sprite_id, image_id, draw_x, draw_y, x_scale, y_scale, rotation, colour, alpha );