///drawButton_Sprite(x,y,sprite_id,[colour],[alpha],[text],[text_align],[pop],[padding],[state],[keys]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg sprite_id		#sprite_id#
/// @arg [colour]		#c_code#		(default: draw_get_color())
/// @arg [alpha]		{real|0..1}		(default: draw_get_alpha())
/// @arg [text_array]	{array}			(default: ""} [string, colour, alpha, outline, outline_colour]
/// @arg [text_align]	#align#			(default: [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo]);
/// @arg [pop]			{integer}		(default: 1)
/// @arg [padding]		{integer}		(default: 0)
/// @arg [state]		#eButtonState#	(default: eButtonState.detect)
/// @arg [keys]			{array}			(default: -1)
/*
	[[ Draws ]] a basic button from a single frame of a sprite
	
	image_index		[0] = disabled
					[1] = standard
					[2] = mouseover
					[4] = pressed
	
*/
#region Arguments & Variables
if argument_count < 3 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var _x =			argument[0];
var _y =			argument[1];
var _sprite =		argument[2];
var _colour =		argument_count > 3 ? argument[4] : draw_get_color();
var _alpha =		argument_count > 4 ? argument[5] : draw_get_alpha();
var _text_array =	argument_count > 5 ? _validateArray(argument[5], 5, 5, ["", c_white, 1, 0, c_black]) : ["", c_white, 1, 0, c_black];
var _text_align =	argument_count > 6 ? _storeAlign(argument[6]) : [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo];
var _pop =			argument_count > 7 ? argument[7] : 1;
var _padding =		argument_count > 8 ? _validateArray(argument[8],4,4,argument[8]) : 0;
var _state =		argument_count > 9 ? argument[9] : eButtonState.detect;
var _keys =			argument_count > 10 ? argument[10] : -1;
#endregion

//Create Region
var _region = _spriteRegion(_x, _y, _sprite);
if ( _pop )				{ _region = _alterRegion(_region, [0, _pop, 0, 0]) };
if ( _padding != -1 )	{ _region = _alterRegion(_region, _padding) };

//State
if ( _state == eButtonState.detect ) { _state = buttonStateInRegion(_region, _keys) };
if ( _state == eButtonState.disabled or _state == eButtonState.pressed ) { _pop = 0 };

//Draw
if ( _pop ) { 
	drawSprite(_x, _y, _sprite, _state, _colour, _alpha); 
	drawSprite(_x, _y, _sprite, _state, c_black, _alpha*0.4); 
	};
drawSprite(_x, _y-_pop, _sprite, _state, _colour, _alpha); 
	
//Text
if ( _text_array[0] != "" ) {
	drawText_Outlined_InRegion(_region, _text_array[0], _text_align, _text_array[1], _text_array[4], _text_array[2], _text_array[3], 0, 0, 0 );
	};		
	
return _region;