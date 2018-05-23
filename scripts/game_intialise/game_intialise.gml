///game_intialise();
/*
	>Create the controllers for core systems 
	>Push default globals
	Use this to do anything you need to do at the start of the game
*/

//Required variables:
global.UpdateWindow = 10;
global.GameBeat = 0;
global.ScrollBeat = 0;

global.GUI_MouseX = 0; 
global.GUI_MouseY = 0;

global.AlignX = fa_left;
global.AlignY = fa_top;
global.Font = ft_EvoTooltip_6;
global.BaseFont = ft_EvoTooltip_6;


global.DepthLayer = eDepthLayer.standard;
global.inProgress_Draw = false;
global.inProgress_DrawGUI = false;
global.inProgress_Step = false;

//=[Create Controllers for PPC Modules]=========================================
//Enable the Focus system
if ( PPC_FOCUS_OnIntitialise ) { if ( !instance_exists(oFocusController) ) {instance_create_depth(-1,-1,-1,oFocusController) }	};
//Create a settings container
if ( PPSETTINGS_OnIntitialise ) { if ( !instance_exists(oSettingsContainer) ) {instance_create_depth(-1,-1,-1,oSettingsContainer) }	};
//Enable the Resolution system
if ( PPRES_OnIntitialise ) { if ( !instance_exists(oResolutionController) ) {instance_create_depth(-1,-1,-1,oResolutionController) }	};
