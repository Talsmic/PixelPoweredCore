///ppsettings_load()
/*
	[PPC][Controller Function]
	Loads in game options controlled by settings.ini
*/

ini_open("settings2.ini");

//=[Video Settings]==================================================
opt_res_Fullscreen = ini_read_real("video", "fullscreen", 0);
opt_res_Magnification = ini_read_real("video", "scale", 3);
opt_res_Magnification_Locked = ini_read_real("video", "lockedscale", false);
opt_res_Vsync = ini_read_real("video", "vsync", false);
//===================================================================

//=[Sound Settings]==================================================
Options_Mute_Sound = ini_read_real("sound", "sound_mute", 0);
Options_Mute_Music = ini_read_real("sound", "music_mute", 0);
Options_Volume_Master = ini_read_real("sound", "volume_master", 99);
Options_Volume_Sound = ini_read_real("sound", "volume_sound", 98);
Options_Volume_Music = ini_read_real("sound", "volume_music", 97);
//===================================================================

//=[Other Settings]==================================================
Options_Language = ini_read_string("other", "language", "English");
//===================================================================

show_debug_message("settings.ini Loaded");

ini_close();

/*[PPC Dependancies]============================================================
	MUST BE RUN BY [Object] OptionsContainer
