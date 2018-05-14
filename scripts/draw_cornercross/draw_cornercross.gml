///draw_cornercross(x,y,sprite,state);
/// @arg x			
/// @arg y
/// @arg sprite		
/// @arg state

var X = argument0; 
var Y = argument1;
var sprite = argument2; 
var state = argument3;

//State Detection
if ( state == eSkillButtonState.detectGUI ) {
	if ( infocus() ) {
		if ( mouse_in_region_gui( define_region( X-sprite_get_width(sprite),Y,sprite_get_width(sprite),sprite_get_height(sprite) ) ) ) {
			if ( mouse_check_button(mb_left) ) {
				state = eSkillButtonState.pressed
				}
			else { state = eSkillButtonState.mouseover };
			}
		else { state = eSkillButtonState.enabled };
		}
	else { state = eSkillButtonState.disabled };
	};

draw_sprite(sprite,state,X,Y);