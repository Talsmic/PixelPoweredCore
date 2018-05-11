///draw_icon_skill(x,y,size,icon,colour,rarity,state);
/// @arg x
/// @arg y
/// @arg size
/// @arg skill
/// @arg colour
/// @arg rarity
/// @arg state
/*
	[Edited 24/4/2018]
	Draws the icon for the required skill at the provided location
*/
var X = argument0;
var Y = argument1;
var icon_size = argument2;
var icon = argument3;
var icon_colour = find_colour(argument4);
var icon_rarity = argument5;
var icon_state = floor(argument6);
var icon_recharge = round(10*frac(argument6));
var icon_mask = 1;

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
	case eSkillButtonState.disabled_recharge:
		icon_colour = c_gray;
		break;
	case eSkillButtonState.disabled_energy:
		icon_colour = c_gray;
		break;
	};
if ( icon_rarity == "C" or icon_rarity == "D" ) { icon_state += 6; icon_mask = 2 };
	
//Draw
switch ( icon_size ) {
	
	case 32:
		draw_sprite_ext(spr_icon_skill_32,icon,X,Y+offset,1,1,0,icon_colour,1);
        draw_sprite_ext(spr_icon_frame_32x32,icon_state,X,Y,1,1,0,icon_colour,1);
		if ( icon_recharge ) {
			draw_set_font(ft_EvoLarge_12);
			draw_set_halign(fa_center);
			draw_text_outline_coloured(X+1,Y-10,string(icon_recharge),c_lightgray,c_darkgray);
			draw_set_halign(fa_left);
			};
		break;
		
	case 24:
		var IconSurface = surface_create( 24, 24 );
		//{ Icon Surface
			surface_set_target(IconSurface);
			//Flat Colour
			draw_sprite_ext(spr_icon_mask_24,0,12,12,1,1,0,icon_colour,1);
			//Add Icon Graphic
			draw_sprite_part_ext(spr_icon_skill_24,icon,1,1,22,22,1,1,1,1,icon_colour,1);
			//Mask
			gpu_set_blendmode(bm_subtract);
			draw_sprite_ext(spr_icon_mask_24,icon_mask,12,12,1,1,0,icon_colour,1);
			gpu_set_blendmode(bm_normal);	
			surface_reset_target();
			draw_surface(IconSurface,X-12,Y-12+offset);
			surface_free(IconSurface);
		//}
		//Draw Frame
        draw_sprite_ext(spr_icon_frame_24x24,icon_state,X,Y,1,1,0,icon_colour,1);
		if ( icon_recharge ) {
			draw_set_font(ft_EvoLarge_12);
			draw_set_halign(fa_center);
			draw_text_outline_coloured(X+1,Y-10,string(icon_recharge),c_lightgray,c_darkgray);
			draw_set_halign(fa_left);
			};
		break;
	
	case 24.32:
		draw_sprite_part_ext(spr_icon_skill_32,0,5,0,24,32,X-12,Y-16+offset,1,1,icon_colour,1);
		draw_sprite_part_ext(spr_icon_skill_32,icon,5,0,22,32,X-11,Y-16+offset,1,1,icon_colour,1);
        draw_sprite_ext(spr_icon_frame_24x32,icon_state,X,Y,1,1,0,icon_colour,1);
		if ( icon_recharge ) {
			draw_set_font(ft_EvoLarge_12);
			draw_set_halign(fa_center);
			draw_text_outline_coloured(X+1,Y-10,string(icon_recharge),c_lightgray,c_darkgray);
			draw_set_halign(fa_left);
			};
		break;
		
	};