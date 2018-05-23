///draw_image_button(x,y,sprite_id,[image_id],[text],[colour],[alpha],[gui?],[pop],[padding],[state]);
/// @arg x			{real}
/// @arg y			{real}
/// @arg sprite_id	{SpriteID}
/// @arg [image_id]	{integer}		(default: 0}
/// @arg [colour]	{c_code}		(default: draw_get_color())
/// @arg [alpha]	{real|0..1}		(default: draw_get_alpha())
/// @arg [text]		{string}		(default: ""}
/// @arg [t_colour]	{c_code}		(default: c_white)
/// @arg [t_alpha]	{real|0..1}		(default: draw_get_alpha())
/// @arg [pop]		{integer}		(default: 1)
/// @arg [padding]	{integer}		(default: 0)
/// @arg [state]	{eButtonState}	(default: eButtonState.detect)
/*
	>>Draws a basic button from a single frame of a sprite
*/
#region Arguments
if argument_count < 3 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~>
var draw_x =	argument[0];
var draw_y =	argument[1];
var sprite_id =	argument[2];
var image_id =	argument_count > 3 ? argument[3] : 0;
var colour =	argument_count > 4 ? argument[4] : draw_get_color();
var alpha =		argument_count > 5 ? argument[5] : draw_get_alpha();
var text =		argument_count > 6 ? argument[6] : "";
var t_colour =	argument_count > 7 ? argument[7] : c_white;
var t_alpha =	argument_count > 8 ? argument[8] : draw_get_alpha();
var pop =		argument_count > 9 ? argument[9] : 1;
var padding =	argument_count > 10 ? argument[10] : 0;
var state =		argument_count > 11 ? argument[11] : eButtonState.detect;
#endregion

//Create Region
var button_region = region_bysprite(draw_x,draw_y,sprite_id);
if ( pop ) { button_region = region_adjust_eDirection(button_region,UP,pop) };
if ( padding ) { button_region = region_adjust(button_region,padding) };

//State
if state == eButtonState.detect { state = checkstate_withregion(button_region) };

//Draw
if ( pop ) { 
	draw_sprite_flatcolour(sprite_id,image_id,draw_x,draw_y,colour,alpha); 
	draw_sprite_flatcolour(sprite_id,image_id,draw_x,draw_y,c_black,alpha*0.5); 
	};
draw_sprite_flatcolour(sprite_id,image_id,draw_x,draw_y-pop,colour,alpha); 
switch ( state ) {	
	case eButtonState.disabled:		
		draw_sprite_flatcolour(sprite_id,image_id,draw_x,draw_y-pop,c_midgray,alpha*0.3); break;
	case eButtonState.pressed:
	case eButtonState.mouseover:
		draw_sprite_flatcolour(sprite_id,image_id,draw_x,draw_y-pop,c_white,alpha*0.3); break;			
	};
	
return button_region;