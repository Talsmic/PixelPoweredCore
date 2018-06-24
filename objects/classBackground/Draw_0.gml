	if ( isGUIObject ) { exit };

//Find Dimensions
var _region = _cameraRegion(view_camera[view_current]);

#region Alignment
var _x = x;
var _y = y;

switch ( RoomAlignX ) {
	case fa_left: 		_x = sprite_xoffset + AlignXOffset;
						if MatchTilingWithAlignment { TileRight = true; TileLeft = false };		break;	
	case fa_center:		_x = (room_width div 2) - (sprite_width div 2) + (sprite_xoffset div 2);
						if MatchTilingWithAlignment { TileRight = true; TileLeft = true };		break;	
	case fa_right: 		_x = room_width - sprite_width + sprite_xoffset - AlignXOffset;
						if MatchTilingWithAlignment { TileRight = false; TileLeft = true };		break;	
	};	
	
switch ( RoomAlignY ) {
	case fa_top: 		_y = sprite_yoffset + AlignYOffset;
						if MatchTilingWithAlignment { TileDown = true; TileUp = false };		break;	
	case fa_center:		_y = (room_height div 2) - (sprite_height div 2) + (sprite_yoffset div 2);
						if MatchTilingWithAlignment { TileDown = true; TileUp = true };			break;	
	case fa_bottom: 	_y = room_height - sprite_height + sprite_yoffset - AlignYOffset;
						if MatchTilingWithAlignment { TileDown = false; TileUp = true };		break;	
	};	
	
switch ( ViewAlignX ) {
	case fa_left: 		_x = _region[aR.x1] + sprite_xoffset + AlignXOffset;
						if MatchTilingWithAlignment { TileRight = true; TileLeft = false };		break;	
	case fa_center:		_x = _region[aR.x1] + (_region[aR.w] div 2) - (sprite_width div 2) + (sprite_yoffset div 2);
						if MatchTilingWithAlignment { TileRight = true; TileLeft = true };		break;	
	case fa_right: 		_x = _region[aR.x2] - sprite_width + sprite_xoffset - AlignXOffset;
						if MatchTilingWithAlignment { TileRight = false; TileLeft = true };		break;	
	};	
	
switch ( ViewAlignY ) {
	case fa_top: 		_y = _region[aR.y1] + sprite_yoffset + AlignYOffset;
						if MatchTilingWithAlignment { TileDown = true; TileUp = false };		break;	
	case fa_center:		_y = _region[aR.y1] + (_region[aR.h] div 2) - (sprite_height div 2) + (sprite_yoffset div 2);
						if MatchTilingWithAlignment { TileDown = true; TileUp = true };			break;		
	case fa_bottom: 	_y = _region[aR.y2] - sprite_height + sprite_yoffset - AlignYOffset;
						if MatchTilingWithAlignment { TileDown = false; TileUp = true };		break;	
	};	
#endregion

#region Draw Flat Colour
if FlatBackground { 
	drawPlane(_region[aR.x1], _region[aR.y1], _region[aR.w], _region[aR.h], FlatBackground_Colour, FlatBackground_Alpha);
	};
#endregion

if Background {
	
	if PosText { _setFont(PosText_Font) };
		
	#region Draw Center [0,0]
	var _draw_x = _x + sprite_xoffset;
	var _draw_y = _y + sprite_yoffset;
	var _id_x = 0;
	var _id_y = 0;
	draw_sprite_ext( sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, 0, image_blend, image_alpha);
	draw_sprite_ext( sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, 0, image_blend, image_alpha);
	if PosText { drawText(_draw_x, _draw_y, string(_id_x)+","+string(_id_y), PosText_Colour, PosText_Alpha) };
	#endregion
	
	#region Tile Up
	if TileUp {
		for ( _id_y=-1 ; _draw_y+sprite_height>0 ; --_id_y ) {
			
			_draw_y -= sprite_height + TileGapY;
			//Draw Sprite
			draw_sprite_ext( sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, 0, image_blend, image_alpha);
			//Draw Text
			if PosText { drawText(_draw_x, _draw_y, string(_id_x)+","+string(_id_y), PosText_Colour, PosText_Alpha) };
			
			if TileLeft and TileFill {
				
				for ( _id_x=-1 ; _draw_x+sprite_width>0 ; --_id_x ) {
					_draw_x -= sprite_width + TileGapX;
					//Draw Sprite
					draw_sprite_ext( sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, 0, image_blend, image_alpha);
					//Draw Text
					if PosText { drawText(_draw_x, _draw_y, string(_id_x)+","+string(_id_y), PosText_Colour, PosText_Alpha) };
					};
					
				_draw_x = _x;
				_id_x = 0;
				};
				
			if TileRight and TileFill {
				
				for ( _id_x=1 ; _draw_x<_region[aR.x2] ; ++_id_x ) {
					_draw_x += sprite_width + TileGapX;
					//Draw Sprite
					draw_sprite_ext( sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, 0, image_blend, image_alpha);
					//Draw Text
					if PosText { drawText(_draw_x, _draw_y, string(_id_x)+","+string(_id_y), PosText_Colour, PosText_Alpha) };
					};
					
				_draw_x = _x;
				_id_x = 0;
				};
				
			};
		}; #endregion
		
	#region Tile Down		
	_draw_y = _y;
	if TileDown {
		for ( _id_y=1 ; _draw_y<_region[aR.y2] ; ++_id_y ) {
			
			_draw_y += sprite_height + TileGapY;
			//Draw Sprite
			draw_sprite_ext( sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, 0, image_blend, image_alpha);
			//Draw Text			
			if PosText { drawText(_draw_x, _draw_y, string(_id_x)+","+string(_id_y), PosText_Colour, PosText_Alpha) };
			
			if TileLeft and TileFill {
				
				for ( _id_x=-1 ; _draw_x+sprite_width>0 ; --_id_x ) {
					_draw_x -= sprite_width + TileGapX;
					//Draw Sprite
					draw_sprite_ext( sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, 0, image_blend, image_alpha);
					//Draw Text
					if PosText { drawText(_draw_x, _draw_y, string(_id_x)+","+string(_id_y), PosText_Colour, PosText_Alpha) };
					};
					
				_draw_x = _x;
				_id_x = 0;
				};
				
			if TileRight and TileFill {
				
				for ( _id_x=1 ; _draw_x<_region[aR.x2] ; ++_id_x ) {
					_draw_x += sprite_width + TileGapX;
					//Draw Sprite
					draw_sprite_ext( sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, 0, image_blend, image_alpha);
					//Draw Text
					if PosText { drawText(_draw_x, _draw_y, string(_id_x)+","+string(_id_y), PosText_Colour, PosText_Alpha) };
					};
					
				_draw_x = _x;
				_id_x = 0;
				};
				
			};
		};	#endregion
		
	#region Tile Left		
	_draw_y = _y;
	_id_y = 0;
	if TileLeft {
				
		for ( _id_x=-1 ; _draw_x+sprite_width>0 ; --_id_x ) {
			_draw_x -= sprite_width + TileGapX;
			//Draw Sprite
			draw_sprite_ext( sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, 0, image_blend, image_alpha);
			//Draw Text
			if PosText { drawText(_draw_x, _draw_y, string(_id_x)+","+string(_id_y), PosText_Colour, PosText_Alpha) };
			};
		
		}; #endregion
				
	#region Tile Right		
	_draw_x = _x;
	if TileRight {
				
		for ( _id_x=1 ; _draw_x<_region[aR.x2] ; ++_id_x ) {
			_draw_x += sprite_width + TileGapX;
			//Draw Sprite
			draw_sprite_ext( sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, 0, image_blend, image_alpha);
			//Draw Text
			if PosText { drawText(_draw_x, _draw_y, string(_id_x)+","+string(_id_y), PosText_Colour, PosText_Alpha) };
			};
					
		_draw_x = _x;
		_id_x = 0;
		}; #endregion
	};
