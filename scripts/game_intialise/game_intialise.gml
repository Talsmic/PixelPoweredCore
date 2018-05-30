///game_intialise();
/*
	>Create the controllers for core systems 
	>Push default globals
	Use this to do anything you need to do at the start of the game
*/

//Required variables:
global.UpdateWindow = 10;
//General Controller
global.GameBeat = 0;
global.ScrollBeat = 0;

global.GUI_MouseX = 0; 
global.GUI_MouseY = 0;


global.AlignX =		fa_left;
global.AlignY =		fa_top;
global.AlignXo =	0;
global.AlignYo =	0;

global.Font =		ft_EvoTooltip_6;
global.BaseFont =	ft_EvoTooltip_6;

//=[Create Controllers for PPC Modules]=========================================
if ( !instance_exists(GeneralController) ) { instance_create_depth(-1,-1,-1,GeneralController) }
//Enable the Focus system
if ( OnIntitialise_CreateFocusController ) { if ( !instance_exists(FocusController) ) { instance_create_depth(-1,-1,-1,FocusController) } };
//Create a settings container
if ( PPSETTINGS_OnIntitialise ) { if ( !instance_exists(OptionsContainer) ) { instance_create_depth(-1,-1,-1,OptionsContainer) } };
//Enable the Resolution system
if ( RES_OnIntitialise ) { if ( !instance_exists(ResolutionController) ) { instance_create_depth(-1,-1,-1,ResolutionController) }	};
