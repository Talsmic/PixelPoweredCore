/*[The Resolution Controller]===================================================
	The Resolution Controller manages window size, scaling, gui_mouse position
	and all the other screen, window and display elements.
	
	Most stuff you can do with this controller is optional and adjustable.
	
	These macros set the defaults, but the controller can change them once running
	*/
	
	/*
==============================================================================*/	

//Create all the Instance level variables and sets them to defaults
ppres_setresolution_default();

//Set the window colour
window_set_colour(ppres_MarginColour);

//Other Variables
global.GUI_MouseX = 0;
global.GUI_MouseY = 0;

//Apply Resolution Settings
ResolutionSnap_Magnification = Options_Magnification;
adapt_resolution();
display_reset(0, Options_Vsync);
window_set_min_width( ppres_MinWidth );
window_set_min_height( ppres_MinHeight );
alarm[1] = 10;
application_surface_draw_enable(false);


/*[PPC Dependancies]============================================================
	[Function]	ppres_defaults();
	[Function]	gui_mouse_get_x();
	[Function]	gui_mouse_get_y();
	[Function]	adapt_resolution();