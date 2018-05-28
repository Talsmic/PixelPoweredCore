///draw_button_image(x,y,sprite_id,[image_id],[colour],[alpha],[text],[text_align],[pop],[padding],[state]);
/// @arg x			{real}
/// @arg y			{real}
/// @arg sprite_id	#sprite_id#
/// @arg [image_id]	#image_id#		(default: 0}
/// @arg [colour]	#c_code#		(default: draw_get_color())
/// @arg [alpha]	{real|0..1}		(default: draw_get_alpha())
/// @arg [text]			{array}			(default: ""} [string, colour, alpha]
/// @arg [text_align]	#align#			(default: [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo]);
/// @arg [pop]		{integer}		(default: 1)
/// @arg [padding]	{integer}		(default: 0)
/// @arg [state]	#eButtonState#	(default: eButtonState.detect)
/*
	[[ Draws ]] a basic button from a single frame of a sprite
*/
#region Arguments
if argument_count < 3 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var draw_x =	argument[0];
var draw_y =	argument[1];
var sprite_id =	argument[2];
var image_id =	argument_count > 3 ? argument[3] : 0;
var colour =	argument_count > 4 ? argument[4] : draw_get_color();
var alpha =		argument_count > 5 ? argument[5] : draw_get_alpha();
var text =		argument_count > 6 ? _validateArray(argument[6],3,3,["",c_white,1]) : ["",c_white,1];
var text_align =argument_count > 7 ? _storeAlign(argument[7]) : [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo];
var pop =		argument_count > 8 ? argument[8] : 1;
var padding =	argument_count > 9 ? argument[9] : 0;
var state =		argument_count > 10 ? argument[10] : eButtonState.detect;
#endregion

//Create Region
var button_region = _spriteRegion(draw_x, draw_y, sprite_id);
if ( pop ) { button_region = _alterRegion(button_region, [0,pop,0,0]) };
if ( padding ) { button_region = _alterRegion(button_region, padding) };

//State
if ( state == eButtonState.detect ) { state = checkstate_withregion(button_region) };

//Draw
if ( pop ) { 
	_drawSprite(draw_x, draw_y, sprite_id, image_id, colour, alpha); 
	_drawSprite(draw_x, draw_y, sprite_id, image_id, c_black, alpha*0.5); 
	};
_drawSprite(draw_x, draw_y-pop, sprite_id, image_id, colour, alpha); 
switch ( state ) {	
	case eButtonState.disabled:		
		_drawSprite(draw_x, draw_y-pop, sprite_id, image_id, c_gray7, alpha*0.3); break;
	case eButtonState.pressed:
	case eButtonState.mouseover:
		_drawSprite(draw_x, draw_y-pop, sprite_id, image_id, c_white, alpha*0.3); break;			
	};
	
//Text
if ( text[0] != "" ) {
	var saved_align = _storeAlign();
	_setAlign(text_align);
	var text_draw = _positionInRegion(button_region, text_align);
	_drawText(button_region[eR.x1] + text_draw[0], button_region[eR.y1] + text_draw[1], text[0], text[1], text[2]);
	_setAlign(saved_align);
	};
	
	
return button_region;