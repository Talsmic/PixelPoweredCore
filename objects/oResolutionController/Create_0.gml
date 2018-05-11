/*[The Resolution Controller]===================================================
	The Resolution Controller manages window size, scaling, gui_mouse position
	and all the other screen, window and display elements.
	
	Most stuff you can do with this controller is optional and adjustable.
	
	These macros set the defaults, but the controller can change them once running
	*/#macro	RESOLUTION_IDEAL_WIDTH				480;	/*
	*/#macro	RESOLUTION_IDEAL_HEIGHT				270;	/*
	*/#macro	RESOLUTION_MIN_WIDTH				200;	/*
	*/#macro	RESOLUTION_MIN_HEIGHT				200;	/*
	*/#macro	RESOLUTION_MAX_WIDTH				1000;	/*
	*/#macro	RESOLUTION_MAX_HEIGHT				1000;	/*
	*/#macro	RESOLUTION_DEF_FULLSCREEN			false;	/*
	*/#macro	RESOLUTION_DEF_MAGNIFICATION		2;		/*
	*/#macro	RESOLUTION_DEF_MAGNIFICATIONLOCK	true;	/*
	*/#macro	RESOLUTION_DEF_VSYNC				false;	/*
==============================================================================*/	

//Create all the Instance level variables and sets them to defaults
resolution_defaults();

//Set the window colour
window_set_colour(Resolution_MarginColour);

//Other Variables
global.GUI_MouseX = 0;
global.GUI_MouseY = 0;

//Apply Resolution Settings
ResolutionSnap_Magnification = Options_Magnification;
adapt_resolution();
display_reset(0, Options_Vsync);
window_set_min_width( Resolution_MinWidth );
window_set_min_height( Resolution_MinHeight );
alarm[1] = 10;
application_surface_draw_enable(false);


/*[PPC Dependancies]============================================================
	[Function]	resolution_defaults();
	[Function]	gui_mouse_get_x();
	[Function]	gui_mouse_get_y();
	[Function]	adapt_resolution();