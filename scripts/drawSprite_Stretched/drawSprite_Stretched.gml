///drawSprite_Stretched([x],[y],[sprite_id],[image_id],[colour],[alpha],[x_size],[y_size]);
/// @arg [x]			{real}			 (default: x)
/// @arg [y]			{real}			 (default: y)
/// @arg [sprite_id]	#sprite_id#		 (default: sprite_index)
/// @arg [image_id]		#image_id#		 (default: image_index)
///	@arg [colour]			#c_code#		(default: draw_get_color())
/// @arg [alpha]			{real|0..1}		(default: draw_get_alpha())
/// @arg [x_size]			{real}			(default: sprite_get_width(_sprite))
/// @arg [y_size]			{real}			(default: sprite_get_height(_sprite))
#region Arguments
var _x =		argument_count > 0 ? argument[0] : x;
var _y =		argument_count > 1 ? argument[1] : y;
var _sprite =	argument_count > 2 ? argument[2] : sprite_index;
var _image =	argument_count > 3 ? argument[3] : image_index;
var _colour =	argument_count > 4 ? argument[4] : draw_get_color();
var _alpha =	argument_count > 5 ? argument[5] : draw_get_alpha();
var _sizex =	argument_count > 6 ? argument[6] : sprite_get_width(_sprite);
var _sizey =	argument_count > 7 ? argument[7] : sprite_get_height(_sprite);
#endregion

draw_sprite_stretched_ext( _sprite, _image, _x, _y, _sizex, _sizey, _colour, _alpha );