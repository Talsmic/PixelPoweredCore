///draw_icon_creature(x,y,size,icon,colour,state);
/// @arg x
/// @arg y
/// @arg size
/// @arg icon
/// @arg colour
/// @arg state
/*
	[Edited 28/4/2018]
	Draws the icon for the required creature at the provided location
*/
var X = argument0;
var Y = argument1;
var icon_size = argument2;
var icon = argument3;
var icon_colour = find_colour(argument4);
var icon_state = argument5;

//State Detection
if ( icon_state == eSkillButtonState.detectGUI ) {
	if ( infocus() ) {
		if ( mouse_in_region_gui( define_region_icon( X,Y,icon_size ) ) ) {
			if ( mouse_check_button(mb_left) ) {
				icon_state = eSkillButtonState.pressed
				}
			else { icon_state = eSkillButtonState.mouseover };
			}
		else { icon_state = eSkillButtonState.enabled };
		}
	else { icon_state = eSkillButtonState.disabled };
	};

//State Adjustments
var offset = 0;
switch ( icon_state ) {
	case eSkillButtonState.disabled:
		icon_colour = c_darkgray;
		break;
	case eSkillButtonState.enabled:
	case eSkillButtonState.mouseover:
		offset = -1;
		break;
	};
	
//Draw
switch ( icon_size ) {
	//32x32
	case 32:
		draw_sprite_ext(spr_icon_creature_32,icon,X,Y+offset,1,1,0,c_white,1);
        draw_sprite_ext(spr_icon_frame_32x32,icon_state,X,Y,1,1,0,icon_colour,1);
		break;
	//24x24
	case 24:
		draw_sprite_part_ext(spr_icon_creature_32,icon,5,5,24,24,X-12,Y-12+offset,1,1,c_white,1);
        draw_sprite_ext(spr_icon_frame_24x24,icon_state,X,Y,1,1,0,icon_colour,1);
		break;
	//24x32
	case 24.32:
		draw_sprite_part_ext(spr_icon_creature_32,icon,5,0,24,32,X-12,Y-16+offset,1,1,c_white,1);
        draw_sprite_ext(spr_icon_frame_24x32,icon_state,X,Y,1,1,0,icon_colour,1);
		break;
	};