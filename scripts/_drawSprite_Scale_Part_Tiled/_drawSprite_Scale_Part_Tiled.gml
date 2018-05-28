///_drawSprite_Scale_Part_Tiled([x],[y],[sprite_id],[image_id],[colour],[alpha],[x_scale],[y_scale],[rotation],[clip_region],[tile_x],[tiles_y]);
/// @arg [x]			{real}			 (default: x)
/// @arg [y]			{real}			 (default: y)
/// @arg [sprite_id]	#sprite_id#		 (default: sprite_index)
/// @arg [image_id]		#image_id#		 (default: image_index)
///	@arg [colour]		#c_code#		 (default: draw_get_color())
/// @arg [alpha]		{real|0..1}		 (default: draw_get_alpha())
/// @arg [x_scale]		{real}			 (default: 1)
/// @arg [y_scale]		{real}			 (default: 1)
/// @arg [rotation]		{integer|0..360} (default: 0)
/// @arg [clip_region]	#region#		 (default: [0,0,5,5,5,5])
/// @arg [tiles_x]		{integer}		 (default: 1)
/// @arg [tiles_y]		{integer}		 (default: 1)
#region Arguments
var _x =		argument_count > 0 ? argument[0] : x;
var _y =		argument_count > 1 ? argument[1] : y;
var _sprite =	argument_count > 2 ? argument[2] : sprite_index;
var _image =	argument_count > 3 ? argument[3] : image_index;
var _colour =	argument_count > 4 ? _validateArray(argument[4],4,4,argument[4]) : [draw_get_color(),draw_get_color(),draw_get_color(),draw_get_color()];
var _alpha =	argument_count > 5 ? argument[5] : draw_get_alpha();
var _scalex =	argument_count > 6 ? argument[6] : 1;
var _scaley =	argument_count > 7 ? argument[7] : 1;
var _rotation =	argument_count > 8 ? argument[8] : 0;
var _clip =		argument_count > 9 ? _validateRegion(argument[9]) : [0,0,5,5,5,5];
var _tiles_x =	argument_count > 10 ? argument[10] : 1;
var _tiles_y =	argument_count > 11 ? argument[11] : 1;
#endregion

for ( var i=1; i<=_tiles_y; i++ ) {
	for ( var j=1; j<=_tiles_x; j++ ) {
		draw_sprite_general( _sprite, _image, _clip[eR.x1], _clip[eR.y1], _clip[eR.w], _clip[eR.h], _x, _y, _scalex, _scaley, _rotation, _colour[0], _colour[1], _colour[2], _colour[3], _alpha );
		_x += _clip[eR.w];
		};
	_x = argument_count > 2 ? argument[2] : x;
	_y += _clip[eR.h];
	};
		