///ppres_setresolution_default([usesettings]);
/// @arg [usesettings] {Boolean}	(Defaults to PPC_SETTINGS_Enable)
/*
	[PPC][Module:Resolution]
	Creates all the variables that oResolutionController needs to function, 
	setting them to their defaults.
*/
var usesettings = PPSETTINGS_Enable; 
if ( argument_count > 0 ) { usesettings = argument[0] };

//Options Variables will be changed if a settings.ini is loaded
if ( !usesettings or !oSettingsContainer ) {
	Options_Fullscreen =			PPRES_Fullscreen_AtBoot;
	Options_Magnification =			PPRES_Magnification_AtBoot;
	Options_LockedMagnification =	PPRES_Magnification_Lock;
	Options_Vsync =					PPRES_VsyncAtBoot;
	};	
else {
	Options_Fullscreen =			oSettingsContainer.Options_Fullscreen;
	Options_Magnification =			oSettingsContainer.Options_Magnification;
	Options_LockedMagnification =	oSettingsContainer.Options_LockedMagnification;
	Options_Vsync =					oSettingsContainer.Options_Vsync;
	};
Options_ResolutionSnap		= PPRES_Magnification_RubberBanding; //Should the game snap resolution every frame?

Resolution_Magnification	= 3;

Resolution_CompleteWidth	= 480;
Resolution_CompleteHeight	= 270;
Resolution_PlayableWidth	= 480;
Resolution_PlayableHeight	= 270;
Resolution_PadWidth			= 0;
Resolution_PadHeight		= 0;
Resolution_ViewWidth		= 0;
Resolution_ViewHeight		= 0;
Resolution_GUIxOffset		= 0;
Resolution_GUIyOffset		= 0;
Resolution_MarginColour		= PPRES_MarginColours;
FloatingPixels_Width		= 0;
FloatingPixels_Height		= 0;

ResolutionSnapNextFrame = true; //Should the resolution snap at the next frame?
ResolutionCenterNextFrame = false;
ResolutionSnap_Magnification = 2; //Default Zoom

/*=[Notes]======================================================================
	-	This function can be run at any time to reset a oResolutionController, 
		but make sure you run it through the instance of the object.
