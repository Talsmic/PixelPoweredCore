//Update Mouse GUI Position
//Storing a global position of the mouse on the GUI prevents the need to
//run a calculation every time you need it, which can be many times a draw
//event. It also limits the check to every step, while drawing can happen
//much more often than once a step in low res games.
if ( ppres_CONTROLLER_GUIMOUSETRACKING ) {
	global.GUI_MouseX = gui_mouse_get_x();
	global.GUI_MouseY = gui_mouse_get_y();
	}
else {
	global.GUI_MouseX = mouse_x;
	global.GUI_MouseY = mouse_y;
	};