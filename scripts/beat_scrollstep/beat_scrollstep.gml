///beat_scrollstep(beat);
/// @arg beat
//For use with beats that need to flash 1 for exactly 1 frame before resetting
//The count on these beats resets if arrows, LeftMouse, PgUp or PgDown are pressed
var beat = argument0;

if ( beat[0] == 1 ) { beat[0] = 0; beat[3] = 0 };
if (mouse_check_button_pressed(mb_left) 
 or	keyboard_check_pressed(vk_pageup) 
 or	keyboard_check_pressed(vk_pagedown) 	
 or	keyboard_check_pressed(vk_left)
 or	keyboard_check_pressed(vk_right)
 or	keyboard_check_pressed(vk_up)
 or	keyboard_check_pressed(vk_down) )
	{ beat[3] = -10 };

beat[3]++
if ( beat[3] >= beat[1] ) {
	beat[3] = 0;
	beat[0] += beat[2]*beat[4];
	};
	
return beat;