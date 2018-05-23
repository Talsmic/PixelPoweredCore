/*[The Focus Controller]========================================================
	The Focus Controller is a very simple controller that tracks focus
	The focus system is a simple measure of tracking what level of the game a
	player can interact with, where focus of 10 is everything, and as focus gets
	lower, objects with a higher focus can't be interacted with.
	This is really useful for menus, stacking UIs, prompts and other such things 
==============================================================================*/	
event_inherited();

/*=[Controller Settings (Defaults)]===========================================*/
	Setting_ManageFocus = true;
	Setting_ManageDepth = true;
	Setting_DepthLayers = true;
	Setting_ManageDrawLayers = true;
	//Number of FocusLevels to track.
	Setting_Focus_Floor = 10;
	//This causes the oFocusController to draw a flat colour layer over any 
	//elements not in focus
	Setting_FocusFog = true;
	Setting_FocusFog_Level = 9;
	Setting_FocusFog_Colour = c_white;
	Setting_FocusFog_Alpha = 0.3;
	Setting_FocusFog_AlphaByFocus = 0;
/*============================================================================*/

Focus_Current = Setting_Focus_Floor;	//Current focus is the stored level of focus
Focus_NextStep = Setting_Focus_Floor;	//Check focus is the currently being written to variable
