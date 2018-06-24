///drawButton_Tilebox(x,y,width,height,[sprite_id],[colour],[alpha],[text_array],[text_align_array],[pop],[padding],[state],[keys]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg width			{real}
/// @arg height			{real}
/// @arg [sprite_id]	#sprite_id#		(default: spr_plainbox_4x4)
/// @arg [colour]		#c_code#		(default: draw_get_color())
/// @arg [alpha]		{real|0..1}		(default: draw_get_alpha())
/// @arg [text_array]	{array}			(default: ""} [string, colour, alpha, outline, outline_colour]
/// @arg [text_align]	#align#			(default: global.AlignArray);
/// @arg [pop]			{integer}		(default: 1)
/// @arg [padding]		{integer}		(default: 0)
/// @arg [state]		#eButtonState#	(default: eButtonState.detect)
/// @arg [keys]			{array}			(default: -1)
/*
	[[ Draws ]] a basic button from a single frame of a sprite
*/
#region Arguments & Variables
if argument_count < 4 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var _x =			argument[0];
var _y =			argument[1];
var _width =		argument[2];
var _height =		argument[3];
var _sprite =		argument_count > 4 ? argument[4] : spr_plainbox_4x4;
var _colour =		argument_count > 5 ? argument[5] : draw_get_color();
var _alpha =		argument_count > 6 ? argument[6] : draw_get_alpha();
var _text_array =	argument_count > 7 ? _asArrayOf(argument[7], ["", c_white, 1, 0, c_black]) : ["", c_white, 1, 0, c_black];
var _text_align =	argument_count > 8 ? _alignArrayWithOffset(argument[8]) : global.AlignArray;
var _pop =			argument_count > 9 ? argument[9] : 1;
var _padding =		argument_count > 10 ? _arrayOfLength(argument[10], 4) : -1;
var _state =		argument_count > 11 ? argument[11] : eButtonState.detect;
var _keys =			argument_count > 12 ? argument[12] : -1;
#endregion


//Create Region
var _region =	 _regionBySize(_x, _y, _width, _height);
if ( _pop )				{ _region = _alterRegion(_region, [0, _pop]); _text_align[3] += _text_align[0] == 2 ? _pop : 0; };
if ( _padding != -1 )	{ _region = _alterRegion(_region, _padding) };

//State
if ( _state == eButtonState.detect ) { _state = buttonStateInRegion(_region, _keys) };
if ( _state == eButtonState.disabled or _state == eButtonState.pressed ) { _text_align[3] += _text_align[0] < 2 ? _pop : - _pop; _pop = 0 };

//Draw
if ( _pop ) { 
	drawTilebox_Simple(_x, _y, _width, _height, _sprite, _colour, _alpha );
	drawTilebox_Simple(_x, _y, _width, _height, _sprite, c_black, _alpha*0.4 );
	};
drawTilebox_Simple(_x, _y-_pop, _width, _height, _sprite, _colour, _alpha );
switch ( _state ) {	
	case eButtonState.disabled:		
		drawTilebox_Simple(_x, _y-_pop, _width, _height, _sprite, c_gray7, _alpha*0.5 );
		break;
	case eButtonState.pressed:
		gpu_set_fog(true, c_white, 0, 0);
		drawTilebox_Simple(_x, _y-_pop, _width, _height, _sprite, c_white, _alpha*0.2 );
		gpu_set_fog(false, c_white, 1, 1);
		break;
	case eButtonState.mouseover:
		gpu_set_fog(true, c_white, 0, 0);
		drawTilebox_Simple(_x, _y-_pop, _width, _height, _sprite, c_white, _alpha*0.3 );
		gpu_set_fog(false, c_white, 1, 1);
		break;
	};
	
//Text
if ( _text_array[0] != "" ) {
	if ( _text_array[3] ) { drawText_Outlined_InRegion(_region, _text_array[0], _text_align, _text_array[1], _text_array[4], _text_array[2], _text_array[3], 0, 0, 0 ) };
					else  { drawText_InRegion(_region, _text_array[0], _text_array[1], _text_array[2], _text_align) };
	};	
	
return _region;