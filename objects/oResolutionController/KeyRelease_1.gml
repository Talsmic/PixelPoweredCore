///Fullscreen Toggle Check
//Fullscreen toggling, enabled with PPRES_FullscreenToggle_ENABLE
//Activated when PPRES_FullscreenToggle_KEY	is released, while 
//PPRES_FullscreenToggle_MODIFIER is held down.

if PPRES_Fullscreen_ToggleEnable {			//Checking enabled?
	if PPRES_Fullscreen_ToggleModifier {	//Is a modifer required?
		//Check for key release + modifer held
		if ( keyboard_check_released(PPRES_Fullscreen_ToggleKey) and keyboard_check(PPRES_Fullscreen_ToggleModifier) ) {
			Options_Fullscreen = toggle(Options_Fullscreen);
			};
		}
	else {
		//Just check key release
		if ( keyboard_check_released(PPRES_Fullscreen_ToggleKey) ) {
			Options_Fullscreen = toggle(Options_Fullscreen);
			};
		};
	};
		