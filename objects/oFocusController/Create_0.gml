/*[The Focus Controller]========================================================
	The Focus Controller is a very simple controller that tracks focus
	The focus system is a simple measure of tracking what level of the game a
	player can interact with, where focus of 10 is everything, and as focus gets
	lower, objects with a higher focus can't be interacted with.
	This is really useful for menus, stacking UIs, prompts and other such things 
==============================================================================*/	

FocusCurrent = 10;	//Current focus is the stored level of focus
FocusCheck = 10;	//Check focus is the currently being written to variable
