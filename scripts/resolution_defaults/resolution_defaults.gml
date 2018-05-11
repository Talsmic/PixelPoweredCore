///resolution_defaults();
/*
	[PPC][Controller Function]
	Creates all the variables a oResolutionController needs to function, 
	setting them to their defaults.
	This function can be run at any time to reset a oResolutionController, but 
	it but be run through the instance of the object.
*/

//Options Variables will be changed if a settings.ini is loaded
if ( !MANAGE_OPTIONS or !oSettingsContainer ) {
	Options_Fullscreen =			RESOLUTION_DEF_FULLSCREEN;
	Options_Magnification =			RESOLUTION_DEF_MAGNIFICATION;
	Options_LockedMagnification =	RESOLUTION_DEF_MAGNIFICATIONLOCK;
	Options_Vsync =					RESOLUTION_DEF_VSYNC;
	};	
else {
	Options_Fullscreen =			oSettingsContainer.Options_Fullscreen;
	Options_Magnification =			oSettingsContainer.Options_Magnification;
	Options_LockedMagnification =	oSettingsContainer.Options_LockedMagnification;
	Options_Vsync =					oSettingsContainer.Options_Vsync;
	};
Options_ResolutionSnap = false; //Should the game snap resolution every frame?

Resolution_IdealWidth		= RESOLUTION_IDEAL_WIDTH;
Resolution_IdealHeight		= RESOLUTION_IDEAL_HEIGHT;
Resolution_MinWidth			= RESOLUTION_MIN_WIDTH;
Resolution_MinHeight		= RESOLUTION_MIN_HEIGHT;
Resolution_MaxWidth			= RESOLUTION_MAX_WIDTH;
Resolution_MaxHeight		= RESOLUTION_MAX_HEIGHT;

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
