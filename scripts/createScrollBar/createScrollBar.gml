///createScrollBar(x,y,length,max_value,[eDirection],[arrows],[spriteset],[colour]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg length			{integer}
/// @arg max_value		{integer}
/// @arg [eDirection]	#eDirection#	(default: eDirection.down)
/// @arg [arrows]		{boolean}		(default: false)
/// @arg [spriteset]	#sprite_id#		(default: spr_scrollbar)
/// @arg [colour]		#c_code#		(default: draw_get_colour();)
/*
	<< Returns >>	
*/ 
enum eScrollbar {
	value, max_value, region, dir, arrows, spriteset, colour };
#region Arguments & Variables
if argument_count < 4 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
//Arguments
var _x =			argument[0];
var _y =			argument[1];
var _length =		argument[2];
var _max_value =	argument[3];
var _direction =	argument_count > 4 ? argument[4] : eDirection.down;
var _arrows =		argument_count > 5 ? argument[5] : true;
var _spriteset =	argument_count > 6 ? argument[6] : spr_scrollbar;
var _colour =		argument_count > 7 ? argument[7] : draw_get_colour();
#endregion

// Vertical Bar
if ( _direction == eDirection.up or _direction == eDirection.down ) {	var _region = _regionBySize(_x, _y, sprite_get_height(spr_scrollbar), _length)	} 
else																{	var _region = _regionBySize(_x, _y, _length, sprite_get_width(spr_scrollbar))	};

var _scrollbar = [0, _max_value, _region, _direction, _arrows, _spriteset, _colour];

return _scrollbar;