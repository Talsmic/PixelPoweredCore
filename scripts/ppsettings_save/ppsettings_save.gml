///ppsettings_save()
/*
	[PPC][Controller Function]
	Saves in game options to settings.ini
*/
ini_open("settings.ini");

//=[Video Settings]==================================================
ini_section_delete("video");
ini_write_real("video", "fullscreen", Options_Fullscreen);
ini_write_real("video", "scale", Options_Magnification);
ini_write_real("video", "lockedscale", Options_LockedMagnification);
ini_write_real("video", "vsync", Options_Vsync);
//===================================================================

//=[Sound Settings]==================================================
ini_section_delete("sound");
ini_write_real("sound", "sound_mute", Options_Mute_Sound);
ini_write_real("sound", "music_mute", Options_Mute_Music);
ini_write_real("sound", "volume_master", Options_Volume_Master);
ini_write_real("sound", "volume_sound", Options_Volume_Sound);
ini_write_real("sound", "volume_music", Options_Volume_Music);
//===================================================================

//=[Other Settings]==================================================
ini_section_delete("other");
ini_write_real("other", "language", Options_Language);
//===================================================================

show_debug_message("settings.ini Saved");

ini_close();

/*[PPC Dependancies]============================================================
	MUST BE RUN BY [Object] oSettingsContainer
