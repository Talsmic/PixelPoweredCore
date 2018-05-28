/*Update Mouse GUI Position
	Storing a global position of the mouse on the GUI prevents the need to
	/run a calculation every time you need it, which can be many times a draw
	event. It also limits the check to every step, while drawing can happen
	much more often than once a step in low res games.*/
global.GUI_MouseX = _mouseGUI_X();
global.GUI_MouseY = _mouseGUI_Y();

/*Check For Changes to Window Size
	Checks if the window size has changed, and if it has, runs the correction 
	event. This very rarely may fail to detect a change, which is why completely
	disabling refresh rate is not recommended.*/
if RES_RefreshOnWindowResize {
	if ( WindowSizeX != _windowWidth() or WindowSizeY != _windowHeight() ) {
		show_debug_message("Event: Window Size Change Detected");
		WindowSizeX = _windowWidth();
		WindowSizeY = _windowHeight();
		event_perform(ev_alarm,1); //call the Resolution Correction event
		};
	};
	
/*Check For Floating Pixels
	Checks there are any floating pixels, and resizes the window to remove them*/
if ( FloatingPixels_Width or FloatingPixels_Height ) {
	if ( alarm[2] <= 0 ) {
		show_debug_message("Floating Pixels Registered");
		alarm[2] = 100;
		};
	};
