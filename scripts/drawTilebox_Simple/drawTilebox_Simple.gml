///drawTilebox_Simple(x,y,width,height,[spriteset],[colour],[alpha]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg width			{real}
/// @arg height			{real}
/// @arg [spriteset]	#sprite_id#			(default: spr_tilebox_4x4)
///	@arg [colour]		#c_code#			(default: draw_get_color())
/// @arg [alpha]		{real|0..1}			(default: draw_get_alpha())
/*
	<< Returns >> a region of the ui box dimensions
	[[ Draws ]] a ui box of [width],[height] at [x],[y]
	Optionally, of [spriteset], [colour] and [alpha]
*/
#region Arguments & Variables
if argument_count < 4 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var _x =			argument[0];
var _y =			argument[1];
var _width =		argument[2];
var _height =		argument[3];
var _spriteset =	argument_count > 4 ? argument[4] : spr_tilebox_4x4;
var _colour =		argument_count > 5 ? argument[5] : draw_get_color();
var _alpha =		argument_count > 6 ? argument[6] : draw_get_alpha();
var _output;
#endregion

var _sw = sprite_get_width(_spriteset);		//Tile Sprite Height
var _sh = sprite_get_height(_spriteset);	//Tile Sprite Width
if ( _width  < _sw*2 ) { _width =  _sw*2 };
if ( _height < _sh*2 ) { _height = _sh*2 };

var _cols = _width  div _sw;
var _rows = _height div _sh;
var _col_ = _width  mod _sw;
var _row_ = _height mod _sh;


#region Draw 
var _align;
//Top Left
drawSprite(				_x,				_y,				_spriteset, 1, _colour, _alpha);
//Top
drawSprite_Stretched(	_x+_sw,			_y,				_spriteset, 2, _colour, _alpha, _width-_sw*2, _sh );
//Top Right
drawSprite(				_x+_width-_sw,	_y,				_spriteset, 3, _colour, _alpha);
//Middle Left
drawSprite_Stretched(	_x,				_y+_sh,			_spriteset, 4, _colour, _alpha, _sw,		  _height-_sh*2 );
//Middle
drawSprite_Stretched(	_x+_sw,			_y+_sh,			_spriteset, 5, _colour, _alpha, _width-_sw*2, _height-_sh*2 );
//Middle Right
drawSprite_Stretched(	_x+_width-_sw,	_y+_sh,			_spriteset, 6, _colour, _alpha,	_sw,		  _height-_sh*2 );
//Bottom Left
drawSprite(				_x,				_y+_height-_sh, _spriteset, 7, _colour, _alpha);
//Bottom
drawSprite_Stretched(	_x+_sw,			_y+_height-_sh, _spriteset, 8, _colour, _alpha, _width-_sw*2, _sh );
//Bottom Right
drawSprite(				_x+_width-_sw,	_y+_height-_sh, _spriteset, 9, _colour, _alpha);
#endregion

