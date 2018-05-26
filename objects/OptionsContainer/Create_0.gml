/*[Settings Container]==========================================================
	When you create a settings container, it loads all the options from 
	settings.ini
==============================================================================*/	

/*=[Controller Settings (Defaults)]===========================================*/
	SettingsChanged = false;
	Settings_SaveOnExit = PPSETTINGS_SaveOnExit;
	Settings_UpdateWindow = 20;
/*============================================================================*/

//Load Options from settings.ini
if ( PPSETTINGS_LoadOnOpen ) { ppsettings_load() };

//Intialise global beats
global.GameBeat = beat_create();
global.ScrollBeat = beat_create();