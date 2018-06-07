///ppdkInitialise();
/*
	>Create the controllers for core systems 
	>Push default globals
	Use this to do anything you need to do at the start of the game
*/

_gameIntitialise();

//Required variables:
global.UpdateWindow = 10;

global.GUI_MouseX = 0; 
global.GUI_MouseY = 0;

//=[Create Controllers for PPC Modules]=========================================
//Enable the Focus system
if ( OnIntitialise_CreateFocusController ) { if ( !instance_exists(FocusController) ) { instance_create_depth(-1,-1,-1,FocusController) } };
//Create a settings container
if ( PPSETTINGS_OnIntitialise ) { if ( !instance_exists(OptionsContainer) ) { instance_create_depth(-1,-1,-1,OptionsContainer) } };
//Enable the Resolution system
if ( RES_OnIntitialise ) { if ( !instance_exists(ResolutionController) ) { instance_create_depth(-1,-1,-1,ResolutionController) }	};
