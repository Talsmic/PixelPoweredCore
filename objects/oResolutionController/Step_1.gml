//Update Mouse GUI Position
//Storing a global position of the mouse on the GUI prevents the need to
//run a calculation every time you need it, which can be many times a draw
//event. It also limits the check to every step, while drawing can happen
//much more often than once a step in low res games.

global.GUI_MouseX = guimouse_get_x();
global.GUI_MouseY = guimouse_get_y();