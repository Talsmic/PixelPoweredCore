///Fullscreen Toggle Check
//Fullscreen toggling, enabled with RES_Fullscreen_ToggleEnable
//Activated when RES_Fullscreen_ToggleKey	is released, while 
//RES_Fullscreen_ToggleModifier is held down.

if RES_Fullscreen_ToggleEnable {			//Checking enabled?
	if RES_Fullscreen_ToggleModifier {	//Is a modifer required?
		//Check for key release + modifer held
		if ( keyboard_check_released(RES_Fullscreen_ToggleKey) and keyboard_check(RES_Fullscreen_ToggleModifier) ) {
			show_debug_message("Fullscreen Input Recognised");
			opt_res_Fullscreen = _toggle(opt_res_Fullscreen);
			event_perform(ev_alarm,1); //call the Resolution Correction event
			};
		}
	else {
		//Just check key release
		if ( keyboard_check_released(RES_Fullscreen_ToggleKey) ) {
			show_debug_message("Fullscreen Input Recognised");
			opt_res_Fullscreen = _toggle(opt_res_Fullscreen);
			event_perform(ev_alarm,1); //call the Resolution Correction event
			};
		};
	};