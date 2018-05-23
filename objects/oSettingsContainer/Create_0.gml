/*[Settings Container]==========================================================
	When you create a settings container, it loads all the options from 
	settings.ini
==============================================================================*/	

/*=[Controller Settings (Defaults)]===========================================*/
	SettingsChanged = false;
	Settings_SaveOnExit = PPSETTINGS_SaveOnExit;
	Settings_UpdateWindow = 20;
	
	Settings_AlignTrack = true;
	Settings_AlignTrack_Carryover = false;
	Settings_FontTrack = true;
	Settings_FontTrack_Carryover = false;
	Settings_FontTrack_default = ft_EvoTooltip_6;
	
	Settings_GlobalBeats = true;
/*============================================================================*/

//Load Options from settings.ini
if ( PPSETTINGS_LoadOnOpen ) { ppsettings_load() };

//Intialise global beats
global.GameBeat = beat_create();
global.ScrollBeat = beat_create();