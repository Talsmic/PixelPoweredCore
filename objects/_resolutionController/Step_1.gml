/// @desc Update Regions and Fullscreen

//Resolution Regions
global.DisplayRegion =			_regionBySize(0, 0, Width, Height);
global.DisplayRegion_Scaled =	_regionBySize(0, 0, Width*Scaling, Height*Scaling);
global.DisplayRegion_View =		_viewRegion(global.PrimaryView);
global.DisplayRegion_GUI =		_guiRegion();

//Fullscreen Toggle
if ( FullscreenToggle ) {			//Checking enabled?
	
	if ( keyboard_check_released(vk_enter) ) {
		if ( keyboard_check(vk_lalt) or keyboard_check(vk_ralt) ) {
			
			show_debug_message("Fullscreen Input Recognised");
			Fullscreen = _toggle(Fullscreen);
			event_perform(ev_alarm, 0); //call the Resolution Correction event
		
			};
		};
		
	};

//Detect Window Size Changes
if ( Stored_Width != _windowWidth() or Stored_Height != _windowHeight() ) {
	show_debug_message("Event: Window Size Change Detected");
	Stored_Width  = _windowWidth();
	Stored_Height = _windowHeight();
	event_perform(ev_alarm, 0); //call the Resolution Correction event
	};
	
//Detect Room Changes
if ( Stored_Room != room ) {
	show_debug_message("Event: Room Change Detected");
	Stored_Room = room;
	Stored_Height = _windowHeight();
	event_perform(ev_alarm, 0); //call the Resolution Correction event
	};