///resolutionDefaults();

#region [Core Systems]------------------------------------------------------------------------------
	//Create a ResolutionController in ppdkInitialise();
	#macro RES_OnIntitialise		true
	//Enable Manual gameSurface Drawing
	#macro RES_DrawGameSurface		true	
	#endregion
	
/*--[GUI Layer]---------------------------------------------------------------*/	
	//Enable/Disable GUI Mouse tracking corrections
	#macro RES_GUIMouse					true
	//Enable/Disable Cursor graphics
	#macro RES_Cursor  					true
	//Set PPRes_GUIScaling to 0 or below to enable adaptable GUI scaling, 
	//forcing it to match the resolution magnification level
	//Otherwise, PPRes_GUIScaling is the fixed scaling of the GUI layer, 
	//if you want it to always have a fixed magnification [NOT RECOMMENDED] 
	#macro RES_GUIScaling				0 //adaptable enabled
	//Enable this to lock the GUI layer inside the margins
	#macro RES_GUISnap					false
	
#region [Resolution Sizes]--------------------------------------------------------------------------
	//Ideal Width & Height is the resolution your game is designed to use
	#macro RES_IdealWidth			384 //pixels
	#macro RES_IdealHeight			288 //pixels
	#macro RES_IdealScaling			3
	#macro RES_Fullscreen_AtBoot	false
	//Minimums before scaling is shifted
	#macro RES_MinWidth				192 //pixels
	#macro RES_MinHeight			192 //pixels
	//Maximum screen sizes before margins are added
	//If these are 0 or below, there is no maximum screen size
	#macro RES_MaxWidth				960 //pixels
	#macro RES_MaxHeight			960 //pixels
	//The range of scalings the controller can access
	#macro RES_Magnification_Min	1 //Minimum 1		
	#macro RES_Magnification_Max	6		
	#macro RES_Magnification_Lock	0	
	//Minimum window can be resized to
	#macro RES_MinWindowWidth		384
	#macro RES_MinWindowHeight		288
	#endregion
	
#region [Other]-------------------------------------------------------------------------------------
	//How often the controller adapts resolution sizes
	//Set to 0 to disable periodic adjustion to just rely on window size triggers,
	//beware this can cause failures to adapt.
	#macro RES_RefreshRate 					60 //every X steps
	//Enable/Disable to check every step for window size changes and force an adapt resolution trigger
	#macro RES_RefreshOnWindowResize		true
	//Enable/Disable fullscreen toggling with Shift+Enter.
	//You should disable fullscreen switching in the GameMaker options and only rely on this setting. 
	//You can customise the key combo to toggle fullscreen with the key+mod combo
	#macro RES_Fullscreen_ToggleEnable		true
	#macro RES_Fullscreen_ToggleKey			vk_enter 
	#macro RES_Fullscreen_ToggleModifier	vk_alt // 0 to disable
	//Enable/Disable if the resolution always attempts to snap to an ideal after a player has adjusted it
	#macro RES_RubberBanding				false
	//Other
	res_MarginColour =	c_orange;
	res_Vsync =			false;
	#endregion

opt_res_Fullscreen =			false;
opt_res_Magnification =			3;
opt_res_Magnification_Locked =	false;

//Set screen resolution to default:
var _width = RES_IdealWidth;
var _height = RES_IdealHeight;
var _scale = RES_IdealScaling;
resolutionSet(_width, _height, _scale);