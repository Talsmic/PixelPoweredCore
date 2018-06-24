if ( isGUIObject ) { exit };

//Find Dimensions
var _region = _cameraRegion(view_camera[view_current]);

#region Alignment
var _x = x;
var _y = y;

switch ( RoomAlignX ) {
	case fa_left: 		_x = 0 + AlignXOffset;
						if MatchTilingWithAlignment { TileRight = true; TileLeft = false };		break;	
	case fa_center:		_x = (room_width div 2) - (sprite_width*Grid_Width div 2);
						if MatchTilingWithAlignment { TileRight = true; TileLeft = true };		break;	
	case fa_right: 		_x = room_width - sprite_width*Grid_Width - AlignXOffset;
						if MatchTilingWithAlignment { TileRight = false; TileLeft = true };		break;	
	};	
	
switch ( RoomAlignY ) {
	case fa_top: 		_y = 0 + AlignYOffset;
						if MatchTilingWithAlignment { TileDown = true; TileUp = false };		break;	
	case fa_center:		_y = (room_height div 2) - (sprite_height*Grid_Height div 2);
						if MatchTilingWithAlignment { TileDown = true; TileUp = true };			break;	
	case fa_bottom: 	_y = room_height - sprite_height*Grid_Height - AlignYOffset;
						if MatchTilingWithAlignment { TileDown = false; TileUp = true };		break;	
	};	
	
switch ( ViewAlignX ) {
	case fa_left: 		_x = _region[aR.x1] + AlignXOffset;
						if MatchTilingWithAlignment { TileRight = true; TileLeft = false };		break;	
	case fa_center:		_x = _region[aR.x1] + (_region[aR.w] div 2) - (sprite_width*Grid_Width div 2);
						if MatchTilingWithAlignment { TileRight = true; TileLeft = true };		break;	
	case fa_right: 		_x = _region[aR.x2] - sprite_width*Grid_Width - AlignXOffset;
						if MatchTilingWithAlignment { TileRight = false; TileLeft = true };		break;	
	};	
	
switch ( ViewAlignY ) {
	case fa_top: 		_y = _region[aR.y1] + AlignYOffset;
						if MatchTilingWithAlignment { TileDown = true; TileUp = false };		break;	
	case fa_center:		_y = _region[aR.y1] + (_region[aR.h] div 2) - (sprite_height*Grid_Height div 2);
						if MatchTilingWithAlignment { TileDown = true; TileUp = true };			break;		
	case fa_bottom: 	_y = _region[aR.y2] - sprite_height*Grid_Height - AlignYOffset;
						if MatchTilingWithAlignment { TileDown = false; TileUp = true };		break;	
	};	
	
#endregion

#region Draw Flat Colour
if FlatBackground { 
	drawPlane(_region[aR.x1], _region[aR.y1], _region[aR.w], _region[aR.h], FlatBackground_Colour, FlatBackground_Alpha);
	};
#endregion

//Draw Tiles
var _draw_x = _x;
var _draw_y = _y;

for ( var row=0 ; row<Grid_Width ; ++row ) {
	for ( var col=0 ; col<Grid_Height ; ++col ) {
		draw_sprite_ext( sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, 0, image_blend, AlphaGrid[row, col]);
		_draw_y += sprite_height + TileGapY;
		};
	_draw_y = _y;
	_draw_x += sprite_width + TileGapX;
	};

/*
for ( var col=0 ; col<Columns ; ++col ) {
	
	switch ( ViewAlignY ) {
		
		case fa_top: 		
			var _alpha = image_alpha;
			for ( var row=0 ; row<Column[col] ; ++row ) {
				if ( AlphaChange_TowardPeak > 0 and _alpha > AlphaChange_TowardPeak * (Column[col] - row) ) { _alpha = AlphaChange_TowardPeak * (Column[col] - row) };
				if ( _alpha < Alpha_Background ) { _alpha = Alpha_Background-Alpha_BackgroundChange*row };
				draw_sprite_ext( sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, 0, image_blend, _alpha);
				_draw_y += sprite_height + TileGapY;
				_alpha -= AlphaChange_PerTile;
				};
			if ( Alpha_Background > 0 ) { for ( row=row ; row<Background_Height ; ++row ) {
				_alpha = Alpha_Background-Alpha_BackgroundChange*row
				draw_sprite_ext( sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, 0, image_blend, _alpha);
				_draw_y += sprite_height + TileGapY;
				} };
			break;	
			
		case fa_center:		
			var _draw_y = y + sprite_yoffset;
			var _alpha = image_alpha;
			draw_sprite_ext( sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, 0, image_blend, _alpha);
			var _draw_offset = sprite_height + TileGapY;
			_alpha -= AlphaChange_PerTile;
			for ( var row=1 ; row<Column[col] ; ++row ) {
				if ( AlphaChange_TowardPeak > 0 and _alpha > AlphaChange_TowardPeak * (Column[col] - row) ) { _alpha = AlphaChange_TowardPeak * (Column[col] - row) };
				if ( _alpha < Alpha_Background ) { _alpha = Alpha_Background-Alpha_BackgroundChange*row };
				draw_sprite_ext( sprite_index, image_index, _draw_x, _draw_y+_draw_offset, image_xscale, image_yscale, 0, image_blend, _alpha);
				draw_sprite_ext( sprite_index, image_index, _draw_x, _draw_y-_draw_offset, image_xscale, image_yscale, 0, image_blend, _alpha);
				_draw_offset += sprite_height + TileGapY;
				_alpha -= AlphaChange_PerTile;
				};
			if ( Alpha_Background > 0 ) { for ( row=row ; row<Background_Height ; ++row ) {
				_alpha = Alpha_Background-Alpha_BackgroundChange*row
				draw_sprite_ext( sprite_index, image_index, _draw_x, _draw_y+_draw_offset, image_xscale, image_yscale, 0, image_blend, _alpha);
				draw_sprite_ext( sprite_index, image_index, _draw_x, _draw_y-_draw_offset, image_xscale, image_yscale, 0, image_blend, _alpha);
				_draw_y += sprite_height + TileGapY;
				} };
			break;	
			
		default:
		case fa_bottom: 	
			var _draw_y = y + sprite_yoffset;				
			var _alpha = image_alpha;
			for ( var row=0 ; row<Column[col] ; ++row ) {
				if ( AlphaChange_TowardPeak > 0 and _alpha > AlphaChange_TowardPeak * (Column[col] - row) ) { _alpha = AlphaChange_TowardPeak * (Column[col] - row) };
				if ( _alpha < Alpha_Background ) { _alpha = Alpha_Background-Alpha_BackgroundChange*row };
				draw_sprite_ext( sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, 0, image_blend, _alpha);
				_draw_y -= sprite_height + TileGapY;
				_alpha -= AlphaChange_PerTile;
				};
			if ( Alpha_Background > 0 ) { for ( row=row ; row<Background_Height ; ++row ) {
				_alpha = Alpha_Background-Alpha_BackgroundChange*row
				draw_sprite_ext( sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, 0, image_blend, _alpha);
				_draw_y -= sprite_height + TileGapY;
				} };
			break;	
			
		};	
		
	_draw_x += sprite_width + TileGapX;
		
	};
