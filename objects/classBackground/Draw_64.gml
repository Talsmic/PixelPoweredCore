if ( !isGUIObject ) { exit };

//Find Dimensions
var _draw_region = global.DisplayRegion_GUI;

//Draw Flat Colour
if FlatBackground { 
	drawPlane(_draw_region[aR.x1], _draw_region[aR.y1], _draw_region[aR.w], _draw_region[aR.h], FlatBackground_Colour, FlatBackground_Alpha);
	};

if Background {
	
	//Find Dimensions
	var _sprite_width =  sprite_get_width( Background_Sprite) * Background_ScaleX;
	var _sprite_height = sprite_get_height(Background_Sprite) * Background_ScaleY;
	if Background_PosText { _setFont(Background_PosText_Font) };
		
	//Draw Center [0,0]
	var _draw_x = x;
	var _draw_y = y;
	var _id_x = 0;
	var _id_y = 0;
	draw_sprite_ext( Background_Sprite, Background_Image, _draw_x, _draw_y, Background_ScaleX, Background_ScaleY, 0, Background_Colour, Background_Alpha);
	if Background_PosText { drawText(_draw_x, _draw_y, string(_id_x)+","+string(_id_y), Background_PosText_Colour, Background_PosText_Alpha) };
	
	#region Tile Up
	if Background_TileUp {
		for ( _id_y=-1 ; _draw_y+_sprite_height>0 ; --_id_y ) {
			
			_draw_y -= _sprite_height;
			//Draw Sprite
			draw_sprite_ext( Background_Sprite, Background_Image, _draw_x, _draw_y, Background_ScaleX, Background_ScaleY, 0, Background_Colour, Background_Alpha);
			//Draw Text
			if Background_PosText { drawText(_draw_x, _draw_y, string(_id_x)+","+string(_id_y), Background_PosText_Colour, Background_PosText_Alpha) };
			
			if Background_TileLeft {
				
				for ( _id_x=-1 ; _draw_x+_sprite_width>0 ; --_id_x ) {
					_draw_x -= _sprite_width;
					//Draw Sprite
					draw_sprite_ext( Background_Sprite, Background_Image, _draw_x, _draw_y, Background_ScaleX, Background_ScaleY, 0, Background_Colour, Background_Alpha);
					//Draw Text
					if Background_PosText { drawText(_draw_x, _draw_y, string(_id_x)+","+string(_id_y), Background_PosText_Colour, Background_PosText_Alpha) };
					};
					
				_draw_x = x;
				_id_x = 0;
				};
				
			if Background_TileRight {
				
				for ( _id_x=1 ; _draw_x<_draw_region[aR.x2] ; ++_id_x ) {
					_draw_x += _sprite_width;
					//Draw Sprite
					draw_sprite_ext( Background_Sprite, Background_Image, _draw_x, _draw_y, Background_ScaleX, Background_ScaleY, 0, Background_Colour, Background_Alpha);
					//Draw Text
					if Background_PosText { drawText(_draw_x, _draw_y, string(_id_x)+","+string(_id_y), Background_PosText_Colour, Background_PosText_Alpha) };
					};
					
				_draw_x = x;
				_id_x = 0;
				};
				
			};
		}; #endregion
		
	#region Tile Down		
	_draw_y = y;
	if Background_TileDown {
		for ( _id_y=1 ; _draw_y<_draw_region[aR.y2] ; ++_id_y ) {
			
			_draw_y += _sprite_height;
			//Draw Sprite
			draw_sprite_ext( Background_Sprite, Background_Image, _draw_x, _draw_y, Background_ScaleX, Background_ScaleY, 0, Background_Colour, Background_Alpha);
			//Draw Text			
			if Background_PosText { drawText(_draw_x, _draw_y, string(_id_x)+","+string(_id_y), Background_PosText_Colour, Background_PosText_Alpha) };
			
			if Background_TileLeft {
				
				for ( _id_x=-1 ; _draw_x+_sprite_width>0 ; --_id_x ) {
					_draw_x -= _sprite_width;
					//Draw Sprite
					draw_sprite_ext( Background_Sprite, Background_Image, _draw_x, _draw_y, Background_ScaleX, Background_ScaleY, 0, Background_Colour, Background_Alpha);
					//Draw Text
					if Background_PosText { drawText(_draw_x, _draw_y, string(_id_x)+","+string(_id_y), Background_PosText_Colour, Background_PosText_Alpha) };
					};
					
				_draw_x = x;
				_id_x = 0;
				};
				
			if Background_TileRight {
				
				for ( _id_x=1 ; _draw_x<_draw_region[aR.x2] ; ++_id_x ) {
					_draw_x += _sprite_width;
					//Draw Sprite
					draw_sprite_ext( Background_Sprite, Background_Image, _draw_x, _draw_y, Background_ScaleX, Background_ScaleY, 0, Background_Colour, Background_Alpha);
					//Draw Text
					if Background_PosText { drawText(_draw_x, _draw_y, string(_id_x)+","+string(_id_y), Background_PosText_Colour, Background_PosText_Alpha) };
					};
					
				_draw_x = x;
				_id_x = 0;
				};
				
			};
		};	#endregion
		
	#region Tile Left		
	_draw_y = y;
	_id_y = 0;
	if Background_TileLeft {
				
		for ( _id_x=-1 ; _draw_x+_sprite_width>0 ; --_id_x ) {
			_draw_x -= _sprite_width;
			//Draw Sprite
			draw_sprite_ext( Background_Sprite, Background_Image, _draw_x, _draw_y, Background_ScaleX, Background_ScaleY, 0, Background_Colour, Background_Alpha);
			//Draw Text
			if Background_PosText { drawText(_draw_x, _draw_y, string(_id_x)+","+string(_id_y), Background_PosText_Colour, Background_PosText_Alpha) };
			};
		
		}; #endregion
				
	#region Tile Right		
	_draw_x = x;
	if Background_TileRight {
				
		for ( _id_x=1 ; _draw_x<_draw_region[aR.x2] ; ++_id_x ) {
			_draw_x += _sprite_width;
			//Draw Sprite
			draw_sprite_ext( Background_Sprite, Background_Image, _draw_x, _draw_y, Background_ScaleX, Background_ScaleY, 0, Background_Colour, Background_Alpha);
			//Draw Text
			if Background_PosText { drawText(_draw_x, _draw_y, string(_id_x)+","+string(_id_y), Background_PosText_Colour, Background_PosText_Alpha) };
			};
					
		_draw_x = x;
		_id_x = 0;
		}; #endregion
	};
