///ppres_setresolution_default([usesettings]);
/// @arg [usesettings] {Boolean}	(Defaults to PPC_SETTINGS_Enable)
/*
	[PPC][Module:ResolutionController]
	Creates all the variables that oResolutionController needs to function, 
	setting them to their defaults.
	This function can be run at any time to reset a oResolutionController, but 
	it must be run through the instance of the object.
*/
var usesettings = PPC_SETTINGS_Enable; 
if ( argument_count > 0 ) { usesettings = argument[0] };

//Options Variables will be changed if a settings.ini is loaded
if ( !usesettings or !oSettingsContainer ) {
	Options_Fullscreen =			ppres_DEF_FULLSCREEN;
	Options_Magnification =			ppres_DEF_MAGNIFICATION;
	Options_LockedMagnification =	ppres_DEF_MAGNIFICATIONLOCK;
	Options_Vsync =					ppres_DEF_VSYNC;
	};	
else {
	Options_Fullscreen =			oSettingsContainer.Options_Fullscreen;
	Options_Magnification =			oSettingsContainer.Options_Magnification;
	Options_LockedMagnification =	oSettingsContainer.Options_LockedMagnification;
	Options_Vsync =					oSettingsContainer.Options_Vsync;
	};
Options_ResolutionSnap = false; //Should the game snap resolution every frame?

Resolution_IdealWidth		= ppres_IDEAL_WIDTH;
Resolution_IdealHeight		= ppres_IDEAL_HEIGHT;
Resolution_MinWidth			= ppres_MIN_WIDTH;
Resolution_MinHeight		= ppres_MIN_HEIGHT;
Resolution_MaxWidth			= ppres_MAX_WIDTH;
Resolution_MaxHeight		= ppres_MAX_HEIGHT;

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
Resolution_GUIsnap			= false;	//Should the GUI be locked to the room view or can it exist in the margins?
Resolution_MarginColour		= c_shadow_dark;

ResolutionSnapNextFrame = true; //Should the resolution snap at the next frame?
ResolutionCenterNextFrame = false;
ResolutionSnap_Magnification = 2; //Default Zoom
