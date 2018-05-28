/*[The Resolution Controller]===================================================
	The Resolution Controller manages window size, scaling, gui_mouse position
	and all the other screen, window and display elements.
	
	Most stuff you can do with this controller is optional and adjustable, see
	ppres_();
==============================================================================*/	
event_inherited();
resolutionDefaults();

//Enforce Minimum Window Sizes
if ( RES_MinWindowWidth )  { window_set_min_width( RES_MinWindowWidth ) };
if ( RES_MinWindowHeight ) { window_set_min_height( RES_MinWindowHeight ) };

//Sieze control of Application Surface
if ( RES_DrawGameSurface ) { application_surface_draw_enable(false) };

//Store WindowSize for comparison
if RES_RefreshOnWindowResize {
	WindowSizeX = _windowWidth();
	WindowSizeY = _windowHeight();
	};

//Set the window colour
window_set_colour(c_orange);

//Apply Resolution Settings
event_perform(ev_alarm,1); //call the Resolution Correction event