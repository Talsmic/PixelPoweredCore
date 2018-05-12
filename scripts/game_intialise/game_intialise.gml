///game_intialise();
/*
	[PPC][Controller Function]
	Activates the controllers for core systems 
	Use this to do anything you need to do at the start of the game
*/


//=[Create Controllers for PPC Modules]=========================================
//Enable the Focus system
if ( PPC_FOCUS_Enable ) { if ( !instance_exists(oFocusController) ) {instance_create_depth(-1,-1,-1,oFocusController) }	};
//Create a settings container
if ( PPC_SETTINGS_Enable ) { if ( !instance_exists(oSettingsContainer) ) {instance_create_depth(-1,-1,-1,oSettingsContainer) }	};
//Enable the Resolution system
if ( PPRES_Enable ) { if ( !instance_exists(oResolutionController) ) {instance_create_depth(-1,-1,-1,oResolutionController) }	};

/*[PPC Dependancies]============================================================
[wip]