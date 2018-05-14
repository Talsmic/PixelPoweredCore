/*[The Resolution Controller]===================================================
	The Resolution Controller manages window size, scaling, gui_mouse position
	and all the other screen, window and display elements.
	
	Most stuff you can do with this controller is optional and adjustable, see
	ppres_();
==============================================================================*/	

//Create all the Instance level variables and sets them to defaults
ppres_setresolution_default();

//Set the window colour
window_set_colour(Resolution_MarginColour);

//Apply Resolution Settings
ResolutionSnap_Magnification = Options_Magnification;
ppres_adapt_resolution();
display_reset(0, Options_Vsync);
alarm[1] = PPRES_RefreshRate;
//Enforce Minimum Window Sizes
if PPRES_MinWindowWidth { window_set_min_width( PPRES_MinWindowWidth ) };
if PPRES_MinWindowHeight { window_set_min_height( PPRES_MinWindowHeight ) };
//Sieze control of Application Surface
if PPRES_AppSurfaceHijack { application_surface_draw_enable(false) };