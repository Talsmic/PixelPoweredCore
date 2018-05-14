/*Update Mouse GUI Position
	Storing a global position of the mouse on the GUI prevents the need to
	/run a calculation every time you need it, which can be many times a draw
	event. It also limits the check to every step, while drawing can happen
	much more often than once a step in low res games.*/
global.GUI_MouseX = guimouse_get_x();
global.GUI_MouseY = guimouse_get_y();

/*Check For Changes to Window Size
	Checks if the window size has changed, and if it has, runs the correction 
	event. This very rarely may fail to detect a change, which is why completely
	disabling refresh rate is not recommended.*/
if PPRES_RefreshOnWindowResize {
	if ( WindowSizeX != window_get_width_safe() or WindowSizeY != window_get_height_safe() ) {
		WindowSizeX = window_get_width_safe();
		WindowSizeY = window_get_height_safe();
		event_perform(ev_alarm,1); //call the Resolution Correction event
		};
	};