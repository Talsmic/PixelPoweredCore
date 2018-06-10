///draw_icon_halo(x,y,size,colour,rarity,state,alpha);
/// @arg x
/// @arg y
/// @arg size
/// @arg colour
/// @arg rarity
/// @arg state
/// @arg alpha
/*
	[Edited 24/4/2018]
	Draws the icon selection halo for the required skill at the provided location
*/
var X = argument0;
var Y = argument1;
var halo_size = argument2;
var halo_colour = findColour(argument3);
var halo_rarity = argument4;
var halo_state = argument5;
var halo_alpha = argument6;

//State Detection
if ( halo_state == eSkillButtonState.detect ) {
	if ( _inFocus() ) {
		if ( _mouseInRegion( _spriteRegion( X,Y,halo_size ) ) ) {
			if ( mouse_check_button(mb_left) ) {
				halo_state = eSkillButtonState.pressed
				}
			else { halo_state = eSkillButtonState.mouseover };
			}
		else { halo_state = eSkillButtonState.enabled };
		}
	else { halo_state = eSkillButtonState.disabled };
	};

//State Adjustments
if ( halo_rarity == "C" or halo_rarity == "D" ) { halo_state += 4; };
	
//Draw
switch ( halo_size ) {
	
	case 32:
		//Draw Frame
        draw_sprite_ext(spr_icon_halo_24x24,halo_state,X,Y,1,1,0,halo_colour,halo_alpha);
		break;
		
	case 24:
		//Draw Frame
        draw_sprite_ext(spr_icon_halo_24x24,halo_state,X,Y,1,1,0,halo_colour,halo_alpha);
		break;
	
	case 24.32:
		//Draw Frame
        draw_sprite_ext(spr_icon_halo_24x24,halo_state,X,Y,1,1,0,halo_colour,halo_alpha);
		break;
		
	};