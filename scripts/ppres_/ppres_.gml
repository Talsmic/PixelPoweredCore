///ppres_
/*
===[Settings]=================================================================*/
	#macro PPRES_Enable 				1	//true
	#macro PPRES_GUIMouse				1	//true
	#macro PPRES_Cursor  				1	//true
	
	#macro PPRES_IDEAL_WIDTH			480;	
	#macro PPRES_IDEAL_HEIGHT			270;	
	#macro PPRES_MIN_WIDTH				200;	
	#macro PPRES_MIN_HEIGHT				200;	
	#macro PPRES_MAX_WIDTH				1000;	
	#macro PPRES_MAX_HEIGHT				1000;	
	#macro PPRES_DEF_FULLSCREEN			false;	
	#macro PPRES_DEF_MAGNIFICATION		2;		
	#macro PPRES_DEF_MAGNIFICATIONLOCK	true;	
	#macro PPRES_DEF_VSYNC				false;
/*	
===[Module Components]==========================================================
---[Objects]--------------------------------------------------------------------
	oResolutionController			[WIP]
	
---[Scripts]--------------------------------------------------------------------
	ppres_setppres_default();	[WIP]
	ppres_adapt_resolution();		[WIP]
	ppres_flex_view();				[Functional and Documented]
	ppres_room_anchors();			[Functional and Documented]
	ppres_draw_gamesurface();		[WIP]
	guimouse_get_x();				[WIP]
	guimouse_get_y();				[WIP]
		
===[Dependancies]===============================================================
---[Macros]---------------------------------------------------------------------
	PPC_SETTINGS_Enable
