///drawButton_Image(x,y,sprite_id,[image_id],[colour],[alpha],[text_array],[text_align_array],[pop],[padding],[state]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg sprite_id		#sprite_id#
/// @arg [image_id]		#image_id#		(default: 0}
/// @arg [colour]		#c_code#		(default: draw_get_color())
/// @arg [alpha]		{real|0..1}		(default: draw_get_alpha())
/// @arg [text]			{array}			(default: ""} [string, colour, alpha]
/// @arg [text_align]	#align#			(default: [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo]);
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
var _text =			argument_count > 6 ? _validateArray(argument[6], 3, 3, ["",c_white,1]) : ["",c_white,1];
var _text_align =	argument_count > 7 ? _storeAlign(argument[7]) : [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo];
var _pop =			argument_count > 8 ? argument[8] : 1;
var _padding =		argument_count > 9 ? argument[9] : 0;
var _state =		argument_count > 10 ? argument[10] : eButtonState.detect;
var _keys =			argument_count > 11 ? argument[11] : -1;
#endregion

//Create Region
var _button_region = _spriteRegion(_x, _y, _sprite);
if ( _pop ) { _button_region = _alterRegion(_button_region, [0, _pop, 0, 0]) };
if ( _padding ) { _button_region = _alterRegion(_button_region, _padding) };

//State
if ( _state == eButtonState.detect ) { _state = buttonStateInRegion(_button_region, _keys) };
if ( _state == eButtonState.disabled or _state == eButtonState.pressed ) { _pop = 0 };

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
if ( _text[0] != "" ) {
	var text_draw = _positionInRegion(_button_region, _text_align);
	drawText_Align(_button_region[aR.x1] + text_draw[0], _button_region[aR.y1] + text_draw[1], _text[0], _text[1], _text[2], _text_align);
	};	
	
return _button_region;