///drawSimplebox(x,y,width,height,[colour],[alpha],[{corner_array}]);
/// @arg x				{real}
///	@arg y				{real}
/// @arg width			{real}
/// @arg height			{real}
///	@arg [colour]		#c_code#			(default: draw_get_colour())
/// @arg [alpha]		{real|0..1}			(default: draw_get_alpha())
/// @arg [corner_array]	{array|booleans}	(default: [0,0,0,0]}
/*
	<< Returns >> a region of the ui box dimensions
	[[ Draws ]] a ui box of [width],[height] at [x],[y], with optional sharp corners
*/
#region Arguments & Variables
if argument_count < 4 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var _x =		argument[0]; 
var _y =		argument[1];
var _width =	argument[2]; 
var _height =	argument[3];
var _colour =	argument_count > 4 ? argument[4] : draw_get_colour();
var _alpha =	argument_count > 5 ? argument[5] : draw_get_alpha();
var _corners =	argument_count > 6 ? argument[6] : [0,0,0,0];
#endregion

var _box = [_x, _y, _x+_width, _y+_height, _width, _height];
var _tiles = [1,2,3,4,5,6,7,8,9];
if ( _corners[0] ) { _tiles[0] = 10 };
if ( _corners[1] ) { _tiles[1] = 11 };
if ( _corners[2] ) { _tiles[2] = 12 };
if ( _corners[3] ) { _tiles[3] = 13 };

drawTilebox_Region(_box,spr_plainbox_4x4,_colour,_alpha,_tiles);

return _box;
