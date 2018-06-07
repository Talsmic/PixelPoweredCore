///drawTilebox(box_region,[spriteset],[colour],[alpha],[tile_id_array],[tile_stretch_array]);
/// @arg box_region				#region#
/// @arg [spriteset]			#sprite_id#			(default: spr_tilebox_4x4)
///	@arg [colour]				#c_code#			(default: draw_get_color())
/// @arg [alpha]				{real|0..1}			(default: draw_get_alpha())
/// @arg [tile_id_array]		{array|#image_id#}	(default: [1,2,3,
//															   4,5,6,
//															   7,8,9]}
/// @arg [tile_stretch_array]	{array|booleans}	(default: [0,1,0,
//															   1,1,1,
//															   0,1,0]}
/*
	<< Returns >> a region of the ui box dimensions
	[[ Draws ]] a ui box of [width],[height] at [x],[y]
	Optionally, of [spriteset], [colour] and [alpha]
*/
#region Arguments & Variables
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var _box =			_validateRegion(argument[0]);
var _spriteset =	argument_count > 1 ? argument[1] : spr_tilebox_4x4;
var _colour =		argument_count > 2 ? argument[2] : draw_get_color();
var _alpha =		argument_count > 3 ? argument[3] : draw_get_alpha();
var _tile_id =		argument_count > 4 ? _validateArray(argument[4],9,9,[1,2,3,4,5,6,7,8,9]) : [1,2,3,4,5,6,7,8,9];
var _tile_stretch =	argument_count > 5 ? _validateArray(argument[5],9,9,[0,1,0,1,1,1,0,1,0]) : [0,1,0,1,1,1,0,1,0];
var _output;
#endregion

var _bw = floor(_box[aR.w]);				//Box Width
var _bh = floor(_box[aR.h]);				//Box Height
if ( _bh == 0 or _bw == 0 ) { exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>
var _sw = sprite_get_width(_spriteset);		//Tile Sprite Height
var _sh = sprite_get_height(_spriteset);	//Tile Sprite Width
var _cols = _bw div _sw;
var _rows = _bh div _sh;
var _col_ = _bw mod _sw;
var _row_ = _bh mod _sh;

#region Tile Widths
switch ( _cols ) {
	default:	//Normal Sized Box, 3+ Columns
		var _tile_w = [	_sw,			(_cols-2)*_sw,	_sw, 
						_sw,			(_cols-2)*_sw,	_sw,
						_sw,			(_cols-2)*_sw,	_sw	];		
		if ( _tile_stretch[1] and _tile_stretch[4] and _tile_stretch[7] ) { _tile_w[1] += _col_; _tile_w[4] += _col_; _tile_w[7] += _col_ };
		break;
	case 2:		
		var _tile_w = [	_sw,			0,				_sw, 
						_sw,			0,				_sw,
						_sw,			0,				_sw	];		
		if ( _tile_stretch[1] and _tile_stretch[4] and _tile_stretch[7] ) { _tile_w[1] += _col_; _tile_w[4] += _col_; _tile_w[7] += _col_ };
		break;
	case 1:	case 0:	//Very Small Box, trim corners
		var _tile_w = [	_bw div 2,		0,				_bw div 2, 
						_bw div 2,		0,				_bw div 2,
						_bw div 2,		0,				_bw div 2	];		
		break;
	};	
#endregion

#region Heights
switch ( _rows ) {
	default:	//Normal Sized Box, 3+ Columns
		var _tile_h = [	_sh,			_sh,			_sh, 
						(_rows-2)*_sh,	(_rows-2)*_sh,	(_rows-2)*_sh,
						_sh,			_sh,			_sh	];		
		if ( _tile_stretch[3] and _tile_stretch[4] and _tile_stretch[5] ) { _tile_h[3] += _row_; _tile_h[4] += _row_; _tile_h[5] += _row_ };
		break;
	case 2:		
		var _tile_h = [	_sh,			_sh,				_sh, 
						0,				0,					0,
						_sh,			_sh,				_sh	];		
		if ( _tile_stretch[3] and _tile_stretch[4] and _tile_stretch[5] ) { _tile_h[3] += _row_; _tile_h[4] += _row_; _tile_h[5] += _row_ };
		break;
	case 1:	case 0:	//Very Small Box, trim corners
		var _tile_h = [	_bh div 2,		_bh div 2,		_bh div 2, 
						0,				0,				0,
						_bh div 2,		_bh div 2,		_bh div 2	];		
		break;
	};
#endregion

#region Draw 
var _x = _box[aR.x1]; 
var _y = _box[aR.y1];
var _align;
for ( var i=0; i<9 ; i+=3 ) { 
	
	for ( var j=i; j<i+3 ; ++j ) { 
		
		if ( _tile_w[j] <= 0 or _tile_h[j] <= 0 ) { _tile_id[j] = 0 }	
		if  ( _tile_id[j] ) {	
			
			var _draw_region = [ _x, _y, _x+_tile_w[j], _y+_tile_h[j], _tile_w[j], _tile_h[j] ];
			_align[0] = ( j-i == 2 ) ? fa_right : (( j-i == 1 ) ? fa_center : fa_left );
			_align[1] = ( i == 6 ) ? fa_bottom : (( j-i == 3 ) ? fa_center : fa_top );
			drawSprite_Region(_draw_region, _spriteset, _tile_id[j], _colour, _alpha, _tile_stretch[j], _align);
			_x += _tile_w[j];
			
			};		
			
		};
	_x = _box[aR.x1]; 
	_y += _tile_h[j-1];
	};
#endregion

