///drawSprite_Part([x],[y],[sprite_id],[image_id],[colour],[alpha],[clip_region]);
/// @arg [x]			{real}			 (default: x)
/// @arg [y]			{real}			 (default: y)
/// @arg [sprite_id]	#sprite_id#		 (default: sprite_index)
/// @arg [image_id]		#image_id#		 (default: image_index)
///	@arg [colour]		#c_code#		(default: draw_get_color())
/// @arg [alpha]		{real|0..1}		(default: draw_get_alpha())
/// @arg [clip_region]	#region#		(default: [0,0,5,5,5,5])
#region Arguments & Variables
var _x =		argument_count > 0 ? argument[0] : x;
var _y =		argument_count > 1 ? argument[1] : y;
var _sprite =	argument_count > 2 ? argument[2] : sprite_index;
var _image =	argument_count > 3 ? argument[3] : image_index;
var _colour =	argument_count > 4 ? _arrayOfLength(argument[4], 4) : [draw_get_color(),draw_get_color(),draw_get_color(),draw_get_color()];
var _alpha =	argument_count > 5 ? argument[5] : draw_get_alpha();
var _clip =		argument_count > 6 ? _validateRegion(argument[6]) : [0,0,5,5,5,5];
#endregion

draw_sprite_general( _sprite, _image, _clip[aR.x1], _clip[aR.y1], _clip[aR.w], _clip[aR.h], _x, _y, 1, 1, 0, _colour[0], _colour[1], _colour[2], _colour[3], _alpha );