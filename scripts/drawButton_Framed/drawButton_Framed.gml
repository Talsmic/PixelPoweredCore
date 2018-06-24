///drawButton_Framed(x,y,button_frame,button_sprite,[button_image],[button_colour],[frame_colour],[alpha],[text],[text_align],[state],[keys]);
/// @arg x					{real}	
/// @arg y					{real}	
/// @arg button_frame		#sprite_id#	
/// @arg button_sprite		#sprite_id#	
/// @arg [button_image]		{integer}		(default: 0)
/// @arg [button_colour]	#c_code#		(default: draw_get_colour())
/// @arg [frame_colour]		#c_code#		(default: c_white)
/// @arg [alpha]			{real|0..1}		(default: draw_get_alpha())
/// @arg [text_array]		{array}			(default: ""} [string, colour, alpha, outline, outline_colour]
/// @arg [text_align]		#align#			(default: global.AlignArray);
/// @arg [state]			#eButtonState#	(default: eButtonState.detect)
/// @arg [keys]				{array}			(default: -1)
/*

	frame image_index	[0] = disabled
						[1] = standard
						[2] = mouseover
						[4] = pressed
						[5] = mask (optional)
						[6] = blender (optional)

*/
#region Arguments & Variables
if argument_count < 4 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var _x =			argument[0];
var _y =			argument[1];
var _frame =		argument[2];
var _sprite =		argument[3];
var _image =		argument_count > 4 ? argument[4] : 0;
var _colour =		argument_count > 5 ? argument[5] : draw_get_colour();
var _colourF =		argument_count > 6 ? argument[6] : c_white;
var _alpha =		argument_count > 7 ? argument[7] : draw_get_alpha();
var _text_array =	argument_count > 8 ? _asArrayOf(argument[8], ["", c_white, 1, 0, c_black]) : ["", c_white, 1, 0, c_black];
var _text_align =	argument_count > 9 ? _alignArray(argument[9]) : global.AlignArray;
var _state =		argument_count > 10 ? argument[10] : eButtonState.detect;
var _keys =			argument_count > 11 ? argument[11] : -1;
#endregion

//Find Region
var _region = _spriteRegion( _x, _y, _frame );
var _anchor = [ sprite_get_xoffset(_frame), sprite_get_xoffset(_frame) ];
var _offset = [	(_region[aR.w]-sprite_get_width(_sprite))  div 2, 
				(_region[aR.h]-sprite_get_height(_sprite)) div 2, 
				];

//State Detection
if ( _state == eButtonState.detect ) { _state = buttonStateInRegion(_region, _keys) };

//Create Surface
var surface = surface_create( _region[aR.w], _region[aR.h] );

//Draw to Surface
surface_set_target( surface ) {

	draw_clear_alpha(c_white, 0);	
	
	//Draw Flat Colour	
	drawPlane(_offset[0], _offset[1], sprite_get_width(_sprite), sprite_get_height(_sprite), _colour);
	//Draw Sprite
	drawSprite(_anchor[0], _anchor[1], _sprite, _image, _colour);
	//Draw Blender
	if ( sprite_get_number(_frame) > 5 ) { drawSprite(_anchor[0], _anchor[1], _frame, 5, _colour) };
	//Clipping Mask
	if ( sprite_get_number(_frame) > 4 ) {
		gpu_set_blendmode(bm_subtract);
		drawSprite(_anchor[0], _anchor[1], _frame, 4, c_white);
		gpu_set_blendmode(bm_normal);	
		};
	//Draw Frame
	switch _state {		
		case eButtonState.disabled: 	drawSprite(_anchor[0], _anchor[1], _frame, 0, _colourF);	_y++;	break;			
		default: 
		case eButtonState.enabled: 		drawSprite(_anchor[0], _anchor[1], _frame, 1, _colourF);			break;			
		case eButtonState.mouseover:	drawSprite(_anchor[0], _anchor[1], _frame, 2, _colourF);			break;			
		case eButtonState.pressed:		drawSprite(_anchor[0], _anchor[1], _frame, 3, _colourF);	_y++;	break;
		};
	
} surface_reset_target();

//Draw Surface
if ( _state != eButtonState.disabled ) { draw_surface_ext( surface, _x-_anchor[0], _y-_anchor[1], 1, 1, 0, c_white, _alpha ) }
								  else { draw_surface_ext( surface, _x-_anchor[0], _y-_anchor[1], 1, 1, 0, c_gray10, _alpha ) }
surface_free( surface );

//Text
if ( _text_array[0] != "" ) {
	if ( _text_array[3] ) { drawText_Outlined_InRegion(_region, _text_array[0], _text_align, _text_array[1], _text_array[4], _text_array[2], _text_array[3], 0, 0, 0 ) };
					else  { drawText_InRegion(_region, _text_array[0], _text_array[1], _text_array[2], _text_align) };
	};	
	
return _region;