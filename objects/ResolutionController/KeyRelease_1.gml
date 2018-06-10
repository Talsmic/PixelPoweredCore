///Fullscreen Toggle Check
//Fullscreen toggling, enabled with RES_Fullscreen_ToggleEnable
//Activated when RES_Fullscreen_ToggleKey	is released, while 
//RES_Fullscreen_ToggleModifier is held down.

if ( FullscreenToggle ) {			//Checking enabled?
	
	if ( keyboard_check_released(vk_enter) ) {
		if ( keyboard_check(vk_lalt) or keyboard_check(vk_ralt) ) {
			
			show_debug_message("Fullscreen Input Recognised");
			Fullscreen = _toggle(Fullscreen);
			event_perform(ev_alarm, 0); //call the Resolution Correction event
		
			};
		};
		
	};