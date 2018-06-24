///drawButton_Image(x,y,sprite_id,[image_id],[colour],[alpha],[text_array],[text_align_array],[pop],[padding],[state],[keys]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg sprite_id		#sprite_id#
/// @arg [image_id]		#image_id#		(default: 0}
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
if argument_count < 3 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var _x =			argument[0];
var _y =			argument[1];
var _sprite =		argument[2];
var _image =		argument_count > 3 ? argument[3] : 0;
var _colour =		argument_count > 4 ? argument[4] : draw_get_color();
var _alpha =		argument_count > 5 ? argument[5] : draw_get_alpha();
var _text_array =	argument_count > 6 ? _asArrayOf(argument[6], ["", c_white, 1, 0, c_black]) : ["", c_white, 1, 0, c_black];
var _text_align =	argument_count > 7 ? _alignArray(argument[7]) : global.AlignArray;
var _pop =			argument_count > 8 ? argument[8] : 1;
var _padding =		argument_count > 9 ? _arrayOfLength(argument[9], 4) : [0];
var _state =		argument_count > 10 ? argument[10] : eButtonState.detect;
var _keys =			argument_count > 11 ? argument[11] : -1;
#endregion

//Create Region
var _region = _spriteRegion(_x, _y, _sprite);
if ( _pop )				{ _region = _alterRegion(_region, [0, _pop]); _text_align[3] += _text_align[0] == 2 ? _pop : 0; };
if ( _padding != -1 )	{ _region = _alterRegion(_region, _padding) };

//State
if ( _state == eButtonState.detect ) { _state = buttonStateInRegion(_region, _keys) };
if ( _state == eButtonState.disabled or _state == eButtonState.pressed ) { _text_align[3] += _text_align[0] < 2 ? _pop : - _pop; _pop = 0 };

//Draw
if ( _pop ) { 
	drawSprite(_x, _y, _sprite, _image, _colour, _alpha); 
	drawSprite(_x, _y, _sprite, _image, c_black, _alpha*0.4); 
	};
drawSprite(_x, _y-_pop, _sprite, _image, _colour, _alpha); 
switch ( _state ) {	
	case eButtonState.disabled:		
		drawSprite(_x, _y-_pop, _sprite, _image, c_gray7, _alpha*0.5); 
		break;
	case eButtonState.pressed:
		gpu_set_fog(true, c_white, 0, 0);
		drawSprite(_x, _y-_pop, _sprite, _image, c_white, _alpha*0.2);			
		gpu_set_fog(false, c_white, 1, 1);
		break;
	case eButtonState.mouseover:
		gpu_set_fog(true, c_white, 0, 0);
		drawSprite(_x, _y-_pop, _sprite, _image, c_white, _alpha*0.3);			
		gpu_set_fog(false, c_white, 1, 1);
		break;
	};
	
//Text
if ( _text_array[0] != "" ) {
	if ( _text_array[3] ) { drawText_Outlined_InRegion(_region, _text_array[0], _text_align, _text_array[1], _text_array[4], _text_array[2], _text_array[3], 0, 0, 0 ) };
					else  { drawText_InRegion(_region, _text_array[0], _text_array[1], _text_array[2], _text_align) };
	};	
	
return _region;