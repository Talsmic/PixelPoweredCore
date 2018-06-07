///ppres_setresolution_default([usesettings]);
/// @arg [usesettings] {boolean}	(default: PPC_SETTINGS_Enable)
/*
	[PPC][Module:Resolution]
	Creates all the variables that ResolutionController needs to function, 
	setting them to their defaults.
*/
#region Arguments & Variables
var usesettings = argument_count > 0 ? argument[0] : true;
#endregion

//Options Variables will be changed if a settings.ini is loaded
if ( !usesettings or !instance_exists(OptionsContainer) ) {
	opt_res_Fullscreen =			RES_Fullscreen_AtBoot;
	opt_res_Magnification =			RES_Magnification_AtBoot;
	opt_res_Magnification_Locked =	RES_Magnification_Lock;
	opt_res_Vsync =					RES_VsyncAtBoot;
	};	
else {
	opt_res_Fullscreen =			OptionsContainer.opt_res_Fullscreen;
	opt_res_Magnification =			OptionsContainer.opt_res_Magnification;
	opt_res_Magnification_Locked =	OptionsContainer.opt_res_Magnification_Locked;
	opt_res_Vsync =					OptionsContainer.opt_res_Vsync;
	};
opt_res_ResolutionSnap_Locked		= RES_Magnification_RubberBanding; //Should the game snap resolution every frame?

res_Magnification	= 3;

res_CompleteWidth	= 480;
res_CompleteHeight	= 270;
res_PlayableWidth	= 480;
res_PlayableHeight	= 270;
res_PadWidth			= 0;
res_PadHeight		= 0;
res_ViewWidth		= 0;
res_ViewHeight		= 0;
res_GUIxOffset		= 0;
res_GUIyOffset		= 0;
res_MarginColour		= RES_MarginColours;
FloatingPixels_Width		= 0;
FloatingPixels_Height		= 0;

NextEvent_SnapResolution = true; //Should the resolution snap at the next frame?
NextEvent_ResolutionCenter = false;
NextEvent_SnapResolution_Scale = opt_res_Magnification; //Default Zoom

_breakpointsX			= [0,0,0,0];
_breakpointsY			= [0,0,0,0];

/*=[Notes]======================================================================
	-	This function can be run at any time to reset a ResolutionController, 
		but make sure you run it through the instance of the object.
