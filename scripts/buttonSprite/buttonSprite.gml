///buttonSprite(x,y,sprite_id,[colour],[alpha],[text],[text_align],[padding],[state]);
/// @arg x			{real}
/// @arg y			{real}
/// @arg sprite_id	#sprite_id#
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
var colour =	argument_count > 3 ? argument[4] : draw_get_color();
var alpha =		argument_count > 4 ? argument[5] : draw_get_alpha();
var text =		argument_count > 5 ? _validateArray(argument[5],3,3,["",c_white,1]) : ["",c_white,1];
var text_align =argument_count > 6 ? _storeAlign(argument[6]) : [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo];
var padding =	argument_count > 7 ? argument[7] : 0;
var state =		argument_count > 8 ? argument[8] : eButtonState.detect;
#endregion

//Create Region
var button_region = _spriteRegion(draw_x, draw_y, sprite_id);
if ( padding ) { button_region = _alterRegion(button_region, padding) };

//State
if ( state == eButtonState.detect ) { state = buttonStateInRegion(button_region) };

//Draw
drawSprite(draw_x, draw_y, sprite_id, eButtonState.disabled, colour, alpha); 
	
//Text
if ( text[0] != "" ) {
	var saved_align = _storeAlign();
	_setAlign(text_align);
	var text_draw = _positionInRegion(button_region, text_align);
	drawText(button_region[eR.x1] + text_draw[0], button_region[eR.y1] + text_draw[1], text[0], text[1], text[2]);
	_setAlign(saved_align);
	};	
	
return button_region;