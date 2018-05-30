///buttonFramed(x,y,button_frame,button_sprite,[button_image],[button_colour],[frame_colour],[alpha],[text],[text_align],[button_mask],[state]);
/// @arg x				{real}	
/// @arg y				{real}	
/// @arg button_frame		#sprite_id#	
/// @arg button_sprite	#sprite_id#	
/// @arg [button_image]	{integer}		(default: 0)
/// @arg [button_colour]	#c_code#	(default: draw_get_colour())
/// @arg [frame_colour]	#c_code#		(default: c_white)
/// @arg [alpha]		{real|0..1}		(default: draw_get_alpha())
/// @arg [text]			{array}			(default: ""} [string, colour, alpha]
/// @arg [text_align]	#align#			(default: [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo]);
/// @arg [button_mask]	#sprite_id#		(default: -1)
/// @arg [state]		#eButtonState#	(default: eButtonState.detect)
#region Arguments
if argument_count < 4 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var draw_x =		argument[0];
var draw_y =		argument[1];
var button_frame =	argument[2];
var button_sprite =	argument[3];
var button_image =	argument_count > 4 ? argument[4] : 0;
var button_colour =	argument_count > 5 ? argument[5] : draw_get_colour();
var frame_colour =	argument_count > 6 ? argument[6] : c_white;
var alpha =			argument_count > 7 ? argument[7] : draw_get_alpha();
var text =			argument_count > 8 ? _validateArray(argument[8],3,3,["",c_white,1]) : ["",c_white,1];
var text_align =	argument_count > 9 ? _storeAlign(argument[9]) : [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo];
var button_mask =	argument_count > 10 ? argument[10] : -1;
var state =			argument_count > 11 ? argument[11] : eButtonState.detect;
#endregion

//Find Region
var button_region = _spriteRegion( draw_x, draw_y, button_frame );
var anchor = [ sprite_get_xoffset(button_frame), sprite_get_xoffset(button_frame) ];
var offset = [	(button_region[eR.w]-sprite_get_width(button_sprite)) div 2, 
				(button_region[eR.h]-sprite_get_height(button_sprite)) div 2, 
				];

//State Detection
if ( state == eButtonState.detect ) { state = buttonStateInRegion(button_region) };

//Create Surface
var surface = surface_create( button_region[eR.w], button_region[eR.h] );

//Draw to Surface
surface_set_target( surface ) {

	draw_clear_alpha(c_white, 0);	
	
	//Draw Flat Colour	
	_drawPlane(offset[0],offset[1],sprite_get_width(button_sprite),sprite_get_height(button_sprite),button_colour);
	//Draw Icon
	drawSprite(anchor[0],anchor[1],button_sprite,button_image,button_colour);
	//Draw Blender
	drawSprite(anchor[0],anchor[1],button_frame,4,button_colour);
	//Clipping Mask
	if button_mask > 0 {
		gpu_set_blendmode(bm_subtract);
		drawSprite(anchor[0],anchor[1],button_mask,0,c_white);
		gpu_set_blendmode(bm_normal);	
		};
	//Draw Frame
	switch state {
		 case eButtonState.disabled: case eButtonState.pressed:
			drawSprite(anchor[0],anchor[1],button_frame,0,frame_colour);	draw_y++;	break;
		default: case eButtonState.enabled: case eButtonState.mouseover:
			drawSprite(anchor[0],anchor[1],button_frame,1,frame_colour);				break;
		};
	//Mouseover
	if ( state == eButtonState.mouseover ) { drawSprite(anchor[0],anchor[1],button_frame, 2, c_white) };
	if ( state == eButtonState.pressed   ) { drawSprite(anchor[0],anchor[1],button_frame, 3, c_white) };
	
} surface_reset_target();

//Draw Surface
if ( state != eButtonState.disabled ) { draw_surface_ext( surface, draw_x-anchor[0], draw_y-anchor[1], 1, 1, 0, c_white, alpha ) }
						       else { draw_surface_ext( surface, draw_x-anchor[0], draw_y-anchor[1], 1, 1, 0, c_gray10, alpha ) }
surface_free( surface );

//Text
if ( text[0] != "" ) {
	var saved_align = _storeAlign();
	_setAlign(text_align);
	var text_draw = _positionInRegion(button_region, text_align);
	drawText(button_region[eR.x1] + text_draw[0], button_region[eR.y1] + text_draw[1], text[0], text[1], text[2]);
	_setAlign(saved_align);
	};