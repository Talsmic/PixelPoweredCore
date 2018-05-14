///ppsettings_load()
/*
	[PPC][Controller Function]
	Loads in game options controlled by settings.ini
*/

ini_open("settings.ini");

//=[Video Settings]==================================================
Options_Fullscreen = ini_read_real("video", "fullscreen", 0);
Options_Magnification = ini_read_real("video", "scale", 3);
Options_LockedMagnification = ini_read_real("video", "lockedscale", false);
Options_Vsync = ini_read_real("video", "vsync", false);
//===================================================================

//=[Sound Settings]==================================================
Options_Mute_Sound = ini_read_real("sound", "sound_mute", 0);
Options_Mute_Music = ini_read_real("sound", "music_mute", 0);
Options_Volume_Master = ini_read_real("sound", "volume_master", 100);
Options_Volume_Sound = ini_read_real("sound", "volume_sound", 100);
Options_Volume_Music = ini_read_real("sound", "volume_music", 100);
//===================================================================

//=[Other Settings]==================================================
Options_Language = ini_read_string("other", "language", "English");
//===================================================================

ini_close();

/*[PPC Dependancies]============================================================
	MUST BE RUN BY [Object] oSettingsContainer
