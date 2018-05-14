///ppres_
/*
===[Settings]===================================================================
---[Core Systems]-------------------------------------------------------------*/
	//Enable/Disable the entire Resolution module
	#macro PPRES_Enable 				1 //true
	//Enable/Disable GUI Mouse tracking corrections
	#macro PPRES_GUIMouse				1 //true
	//Enable/Disable Cursor graphics
	#macro PPRES_Cursor  				1 //true
	//[PLEASE LEAVE THIS ENABLED UNLESS YOU ARE AN ADVANCED USER]
	//When this is enabled, the oResolutionController will sieze control of 
	//responsibility for drawing the all important Application Surface.
	//By default, GMS:2 handle this itself, but many features of this addon 
	//require slight adjustments to its drawing.
	//If you are already controlling the drawing of the surface you may want to 
	//disable this. If you do, please look at the adjustments the function
	//ppres_draw_gamesurface(); makes and account for them in your own code.
	#macro PPRES_AppSurfaceHijack		1 //true	
	
/*--[Refresh Triggers]--------------------------------------------------------*/
	//How often the controller adapts resolution sizes
	//Set to 0 to disable periodic adjustion and just rely on window size triggers,
	//beware this can cause failures to adapt.
	#macro PPRES_RefreshRate 			10 //every X steps
	//Enable/Disable to check every step for window size changes and force an
	//adapt resolution trigger
	#macro PPRES_RefreshOnWindowResize	1 //true
	
/*--[Resolution Sizes]--------------------------------------------------------*/	
	//Ideal Width & Height is the resolution your game is designed to use
	#macro PPRES_IdealWidth				384 //pixels
	#macro PPRES_IdealHeight			288 //pixels
	//Minimums before scaling is shifted
	#macro PPRES_MinWidth				192 //pixels
	#macro PPRES_MinHeight				192 //pixels
	//Maximum screen sizes before margins are added
	//If these are 0 or below, there is no maximum screen size
	#macro PPRES_MaxWidth				960 //pixels
	#macro PPRES_MaxHeight				960 //pixels
	//Minimum window can be resized to
	// -1 to disable any minimum window sizing
	#macro PPRES_MinWindowWidth			480 //pixels
	#macro PPRES_MinWindowHeight		270 //pixels
	
/*--[GUI Layer]---------------------------------------------------------------*/	
	//Set PPRES_GUIScaling to 0 or below to enable adaptable GUI scaling, 
	//forcing it to match the resolution magnification level
	//Otherwise, PPRES_GUIScaling is the fixed scaling of the GUI layer, 
	//if you want it to always have a fixed magnification [NOT RECOMMENDED] 
	#macro PPRES_GUIScaling				0 //adaptable enabled
	//Enable this to lock the GUI layer inside the margins
	#macro PPRES_GUISnap				0 //false
	
/*--[Other Settings]----------------------------------------------------------*/
	//Enable/Disable fullscreen toggling with Shift+Enter.
	//You should disable fullscreen switching in the GameMaker options and only
	//rely on this setting. You can customise the key combo to toggle fullscreen
	//with the key+mod combo
	#macro PPRES_Fullscreen_ToggleEnable	1 //true
	#macro PPRES_Fullscreen_ToggleKey		vk_enter 
	#macro PPRES_Fullscreen_ToggleModifier	vk_shift // 0 to disable
	//Should the game boot in fullscreen mode?
	#macro PPRES_Fullscreen_AtBoot			0 //false
	//What magnification level should the game boot with?
	#macro PPRES_Magnification_AtBoot		2		
	//The range of scalings the controller can access
	#macro PPRES_Magnification_Min			1 //Minimum 1		
	#macro PPRES_Magnification_Max			5		
	//Enable/Disable players to change magnfication level by scaling the screen
	#macro PPRES_Magnification_Lock			0 //false	
	//Enable/Disable if the resolution always attempts to snap to an ideal
	//after a player has adjusted it
	#macro PPRES_Magnification_RubberBanding	0 //false	
	//Enable/Disable vsync
	#macro PPRES_VsyncAtBoot				0 //false
	//Margin Colours
	#macro PPRES_MarginColours				c_gray //colourcode

/*=[Module Components]==========================================================
---[Objects]--------------------------------------------------------------------
	oResolutionController			[WIP]
	
---[Scripts]--------------------------------------------------------------------
	ppres_setresolution_default();	[Functional and Documented]
	ppres_adapt_resolution();		[WIP]
	ppres_flex_view();				[Functional and Documented]
	ppres_room_anchors();			[Functional and Documented]
	ppres_draw_gamesurface();		[WIP]
	guimouse_get_x();				[Functional and Documented]
	guimouse_get_y();				[Functional and Documented]
	window_get_width_safe();		[Functional and Documented]
		
===[Dependancies]===============================================================
---[Scripts]--------------------------------------------------------------------
	toggle()
---[Sprites]--------------------------------------------------------------------
	spr_cursor
	spr_cursor_x2
	spr_cursor_x3
	spr_cursor_x4
	spr_cursor_x5
---[Macros]---------------------------------------------------------------------
	PPSETTINGS_Enable
