/*[Settings Container]==========================================================
	When you create a settings container, it loads all the options from 
	settings.ini
==============================================================================*/	

/*=[Controller Settings (Defaults)]===========================================*/
	OptionsChanged = false;
	set_Options_SaveOnExit = PPSETTINGS_SaveOnExit;
	set_Options_UpdateWindow = 20;
/*============================================================================*/

//Load Options from settings.ini
if ( PPSETTINGS_LoadOnOpen ) { ppsettings_load() };