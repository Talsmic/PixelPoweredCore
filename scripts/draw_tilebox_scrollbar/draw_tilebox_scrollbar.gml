///draw_tilebox_scrollbar(x,y,length,bar_side,[state],[colour],[alpha],[spriteset],[thickness]);
/// @arg x				{real}
///	@arg y				{real}
/// @arg length			{real}
/// @arg bar_side		#eDirection#
/// @arg [state]		#eButtonState#	(default: eButtonState.detect)
///	@arg [colour]		#c_code#		(default: draw_get_color())
/// @arg [alpha]		{real|0..1}		(default: draw_get_alpha())
/// @arg [spriteset]	#sprite_id#		(default: spr_tilebox_4x4)
/// @arg [thickness]	{real}			(default: spriteset height)
/*	
	[[ Draws ]] a scrollbar that matches a tilebox
*/
#region Arguments
if argument_count < 4 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var draw_x =	argument[0]; 
var draw_y =	argument[1];
var length =	argument[2]; 
var bar_side =	argument[3];
var state =		argument_count > 4 ? argument[4] : draw_get_color();
var colour =	argument_count > 4 ? argument[4] : draw_get_color();
var alpha =		argument_count > 5 ? argument[5] : draw_get_alpha();
var spriteset =	argument_count > 6 ? argument[6] : spr_tilebox_4x4;
var thickness =	argument_count > 7 ? argument[7] : 0;
var draw_region;
#endregion

#region Find Bar Size
var tw = sprite_get_width(spriteset);
var th = sprite_get_height(spriteset);
switch ( bar_side ) {
	
	default:
	case TOP: 
		if ( thickness < th ) thickness = th;
		var extra = thickness - th;
		var draw_region = _regionBySize(draw_x,draw_y,thickness,length);
		var corners = [0,0,1,1];
		break;
		
	case BOTTOM:
		if ( thickness < th ) thickness = th;
		var extra = thickness - th;
		var draw_region = _regionBySize(draw_x,draw_y-thickness,thickness,length);
		var corners = [1,1,0,0];
		break;
		
	case LEFT:
		if ( thickness < tw ) thickness = tw;
		var extra = thickness - tw;
		var draw_region = _regionBySize(draw_x,draw_y,length,thickness);
		var corners = [0,1,0,1];
		break;
		
	case RIGHT:
		if ( thickness < tw ) thickness = tw;
		var extra = thickness - tw;
		var draw_region = _regionBySize(draw_x-thickness,draw_y,length,thickness);
		var corners = [1,0,1,0];
		break;
		
	};
#endregion
		
#region State Adjustments
if ( state == eButtonState.detect ) { state = checkstate_withregion(draw_region) };
var offset_icon = 0;
var offset_sprite = 0;
var overlay_colour = c_white;
var overlay_alpha = 0;
switch ( state ) {
	
	case eButtonState.disabled:
		overlay_colour = c_gray;
		overlay_alpha = 0.25;
		offset_sprite = 1;
		break;
		
	case eButtonState.pressed:
		overlay_alpha = 0.3;
		break;
		
	case eButtonState.mouseover:
		overlay_alpha = 0.2;
		offset_icon = global.GameBeat*2 -1;
		break;
		
	};
#endregion

#region Draw
draw_tilebox( draw_region[eR.x1], draw_region[eR.x1], draw_region[eR.x1], draw_region[eR.x1], colour, alpha, spriteset, corners );
draw_tilebox( draw_region[eR.x1], draw_region[eR.x1], draw_region[eR.x1], draw_region[eR.x1], overlay_colour, overlay_alpha, spriteset, corners );
switch ( bar_side ) {
	
	case TOP:		draw_sprite(spr_scrollarrow, 0+offset_sprite, draw_region[eR.x1] + (length div 2), draw_region[eR.y1] + (thickness div 2) - offset_icon); break;
	case RIGHT:		draw_sprite(spr_scrollarrow, 2+offset_sprite, draw_region[eR.x1] + (length div 2) + offset_icon, draw_region[eR.y1] + (thickness div 2)); break;
	case BOTTOM:	draw_sprite(spr_scrollarrow, 4+offset_sprite, draw_region[eR.x1] + (length div 2), draw_region[eR.y1] + (thickness div 2) + offset_icon); break;
	case LEFT:		draw_sprite(spr_scrollarrow, 6+offset_sprite, draw_region[eR.x1] + (length div 2) - offset_icon, draw_region[eR.y1] + (thickness div 2)); break;
	/*
	case TOP:
		draw_sprite_ext(				spriteset, 1, draw_region[eR.x1],			draw_region[eR.y1],    1,		  1, 0,  colour, 1);
		draw_sprite_stretched_ext(		spriteset, 2, draw_region[eR.x1]+tw,		draw_region[eR.y1],	   length-tw, th,    colour, 1);
		draw_sprite_ext(				spriteset, 3, draw_region[eR.x1]+length-tw, draw_region[eR.y1],	   1,		  1, 0,  colour, 1);
		if ( extra ) {
			draw_sprite_stretched_ext(	spriteset, 4, draw_region[eR.x1],			draw_region[eR.y1]+th, tw,		  extra, colour, 1);
			draw_sprite_stretched_ext(	spriteset, 5, draw_region[eR.x1]+tw,		draw_region[eR.y1]+th, length-tw, extra, colour, 1);
			draw_sprite_stretched_ext(	spriteset, 6, draw_region[eR.x1]+length-tw,	draw_region[eR.y1]+th, tw,		  extra, colour, 1);
			};
		draw_sprite(spr_scrollarrow, 0+offset_sprite, draw_region[eR.x1] + (length div 2), draw_region[eR.y1] + (thickness div 2) - offset_icon);
		break;
		
	case BOTTOM:
		draw_sprite_ext(				spriteset, 7, draw_region[eR.x1],			draw_region[eR.y1],    1,		  1, 0,  colour, 1);
		draw_sprite_stretched_ext(		spriteset, 8, draw_region[eR.x1]+tw,		draw_region[eR.y1],	   length-tw, th,    colour, 1);
		draw_sprite_ext(				spriteset, 9, draw_region[eR.x1]+length-tw, draw_region[eR.y1],	   1,		  1, 0,  colour, 1);
		if ( extra ) {
			draw_sprite_stretched_ext(	spriteset, 4, draw_region[eR.x1],			draw_region[eR.y1]+th, tw,		  extra, colour, 1);
			draw_sprite_stretched_ext(	spriteset, 5, draw_region[eR.x1]+tw,		draw_region[eR.y1]+th, length-tw, extra, colour, 1);
			draw_sprite_stretched_ext(	spriteset, 6, draw_region[eR.x1]+length-tw,	draw_region[eR.y1]+th, tw,		  extra, colour, 1);
			};
		draw_sprite(spr_scrollarrow, 4+offset_sprite, draw_region[eR.x1] + (length div 2), draw_region[eR.y1] + (thickness div 2) + offset_icon);
		break;
		
	case LEFT:
		draw_sprite_ext(				spriteset, 1, draw_region[eR.x1],			draw_region[eR.y1],    1,		  1, 0,  colour, 1);
		draw_sprite_stretched_ext(		spriteset, 4, draw_region[eR.x1]+tw,		draw_region[eR.y1],	   length-tw, th,    colour, 1);
		draw_sprite_ext(				spriteset, 7, draw_region[eR.x1]+length-tw, draw_region[eR.y1],	   1,		  1, 0,  colour, 1);
		if ( extra ) {
			draw_sprite_stretched_ext(	spriteset, 3, draw_region[eR.x1],			draw_region[eR.y1]+th, tw,		  extra, colour, 1);
			draw_sprite_stretched_ext(	spriteset, 5, draw_region[eR.x1]+tw,		draw_region[eR.y1]+th, length-tw, extra, colour, 1);
			draw_sprite_stretched_ext(	spriteset, 8, draw_region[eR.x1]+length-tw,	draw_region[eR.y1]+th, tw,		  extra, colour, 1);
			};
		draw_sprite(spr_scrollarrow, 0+offset_sprite, draw_region[eR.x1] + (length div 2), draw_region[eR.y1] + (thickness div 2) - offset_icon);
		break;*/
		
	};
#endregion

return draw_region;
