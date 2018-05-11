///game_intialise();
/*
	[PPC][Controller Function]
	Activates the controllers for core systems 
	Use this to do anything you need to do at the start of the game
*/


//=[Focus Controller]===========================================================
//Enable the focus system
if ( MANAGE_FOCUS ) {	
	if ( !object_exists(oFocusController) ) {
		instance_create_depth(-1,-1,-1,oFocusController);
		};
	};
	
//=[Settings Container / settings.ini]==========================================
//Create a settings container
if ( MANAGE_OPTIONS ) {	
	if ( !object_exists(oSettingsContainer) ) {
		instance_create_depth(-1,-1,-1,oSettingsContainer);
		};
	};

//=[Resolution Controller]======================================================
//Enable the Resolution Controller
if ( MANAGE_RESOLUTION ) {
	//Create an oResolutionController unless one already exists
	if ( !object_exists(oResolutionController) ) {
		instance_create_depth(-1,-1,-1,oResolutionController);
		};
	};

/*[PPC Dependancies]============================================================
	[Object]	oResolutionController