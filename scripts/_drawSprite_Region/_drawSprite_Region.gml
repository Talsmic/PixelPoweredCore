///_drawSprite_Region([region_array],[sprite_id],[image_id],[colour],[alpha],[stretch],[align_array]);
/// @arg [region_array]		#region#		(default: [x,y,x+sprite_get_width(_sprite),y+sprite_get_height(_sprite),sprite_get_width(_sprite),sprite_get_height(_sprite)]
/// @arg [sprite_id]		#sprite_id#		(default: sprite_index)
/// @arg [image_id]			#image_id#		(default: image_index)
///	@arg [colour]			#c_code#		(default: draw_get_color())
/// @arg [alpha]			{real|0..1}		(default: draw_get_alpha())
/// @arg [stretch]			{boolean}		(default: true) (will tile to fit the region if not stretched)
/// @arg [align_array]		{array}			(default: [fa_left,fa_right])
#region Arguments
var _sprite =	argument_count > 1 ? argument[1] : sprite_index;
var _image =	argument_count > 2 ? argument[2] : image_index;
var _draw =		argument_count > 0 ? _validateRegion(argument[0]) : [x,y,x+sprite_get_width(_sprite),y+sprite_get_height(_sprite),sprite_get_width(_sprite),sprite_get_height(_sprite)];
var _colour =	argument_count > 3 ? _validateArray(argument[3],4,4,argument[3]) : [draw_get_color(),draw_get_color(),draw_get_color(),draw_get_color()];
var _alpha =	argument_count > 4 ? argument[4] : draw_get_alpha();
var _stretch =	argument_count > 5 ? argument[5] : true;
var _align =	argument_count > 6 ? _validateArray(argument[6],2,2,argument[6]) : [fa_left,fa_top];
//Other Variables
var _sprite_height = sprite_get_height(_sprite);
var _sprite_width =  sprite_get_width(_sprite);
//var _sprite_offset = [sprite_get_xoffset(_sprite), sprite_get_yoffset(_sprite)];
var _tiles_x = _draw[eR.w] div _sprite_width;
var _tiles_y = _draw[eR.h] div _sprite_height;
var _extra_x = floor(_draw[eR.w] mod _sprite_width);
var _extra_y = floor(_draw[eR.h] mod _sprite_height);
var _x = _draw[eR.x1];
var _y = _draw[eR.y1];
#endregion

if ( _stretch ) {	_drawSprite_Stretch(_x, _y, _sprite, _image, _colour[0], _alpha, _draw[eR.w], _draw[eR.h])	}
else {	//Tile
	
	for ( var i=1; i<=_tiles_y; i++ ) {
		for ( var j=1; j<=_tiles_x; j++ ) {
			draw_sprite_general( _sprite, _image, 0, 0, _sprite_height, _sprite_width, _x, _y, 1, 1, 0, _colour[0], _colour[1], _colour[2], _colour[3], _alpha );
			_x += _sprite_width;
			};
		
		_x = _draw[eR.x1];
		_y += _sprite_height;
		};	
	
	//Leftovers
	if ( _extra_x ) { 
		_x = _draw[eR.x2]-_extra_x;
		_y = _draw[eR.y1];		
		for ( var i=1; i<=_tiles_y; i++ ) { 
			var _offset_x = _align[0] = fa_left ? 0 : ( _align[0] = fa_center ? (_sprite_width-_extra_x) div 2 : _sprite_width-_extra_x);
			draw_sprite_general( _sprite, _image, _offset_x, 0, _extra_x, _sprite_height, _x, _y, 1, 1, 0, _colour[0], _colour[1], _colour[2], _colour[3], _alpha );
			_y += _sprite_height; 
			}; 
		};
	if ( _extra_y ) { 
		_x = _draw[eR.x1];
		_y = _draw[eR.y2]-_extra_y;				
		for ( var j=1; j<=_tiles_x; j++ ) { 
			var _offset_y = _align[1] = fa_top ? 0 : ( _align[1] = fa_middle ? (_sprite_height-_extra_y) div 2 : _sprite_height-_extra_y);
			draw_sprite_general( _sprite, _image, 0, _offset_y, _sprite_width, _extra_y,  _x, _y, 1, 1, 0, _colour[0], _colour[1], _colour[2], _colour[3], _alpha ); 
			_x += _sprite_width; 
			}; 
		};
	if ( _extra_x and _extra_y ) { 
		_x = _draw[eR.x2]-_extra_x;
		_y = _draw[eR.y2]-_extra_y;		
		_offset_x = _align[0] = fa_left ? 0 : ( _align[0] = fa_center ? (_sprite_width-_extra_x) div 2 : _sprite_width-_extra_x);
		_offset_y = _align[1] = fa_top ? 0 : ( _align[1] = fa_middle ? (_sprite_height-_extra_y) div 2 : _sprite_height-_extra_y);			
		draw_sprite_general( _sprite, _image, _offset_x, _offset_y, _extra_x, _extra_y,  _x, _y, 1, 1, 0, _colour[0], _colour[1], _colour[2], _colour[3], _alpha ); 
		};
	
	};