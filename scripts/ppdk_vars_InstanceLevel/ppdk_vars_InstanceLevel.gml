///ppdk_vars_InstanceLevel
/*
Note:	This should list any object level variable in a class, but won't list every single variable 
		ever used in an object.
		
		objv functions should interact with or cater to all of these
===[Variable]=======================[IsArray]==[Datatype]==========[Associated Classes]=============
---[Common]-----------------------------------------------------------------------------------------
	GUI_X							|		|					|
	GUI_Y							|		|					|
	UseGUITracking					|		|					|
	
---[States]-----------------------------------------------------------------------------------------
	Hidden							|		|					|
	DrawNormal						|		|					|
	DrawGUI							|		|					|
	DrawAnchor						|		|					|
	
	
---{set_}-[Settings: General]-----------------------------------------------------------------------
	set_EnableUpdates				|		|					|
	
---{set_}-[Settings: Specific]----------------------------------------------------------------------
	set_AnchorToView				|		|					|	bg, 
	set_GlobalAlignment_Track		|		|					|	GeneralController
	set_GlobalAlignment_Carryover	|		|					|	GeneralController		
	set_GlobalFont_Track			|		|					|	GeneralController
	set_GlobalFont_Carryover		|		|					|	GeneralController
	set_GlobalFont_DefaultFont		|		|					|	GeneralController
	set_GlobalBeats					|		|					|	GeneralController

	
---{foc_}-[Focus]-----------------------------------------------------------------------------------
	foc_InteractionLayer			|		|	#eFocusLayer#	|
	foc_FocusLevel					|		|					|	
	
	
	
	
---{back_}-[Backgrounds]----------------------------------------------------------------------------
	back_Flat						|		|					|	bg, 
	back_Flat_Colour				|		|					|	bg, 
	back_Flat_Alpha					|		|					|	bg, 
	back_StoredBGs					|		|					|	bg, 
	back_StoredBG_Draw				|  1D	|	{boolean}		|	bg, 
	back_StoredBG_DrawID			|  1D	|	{boolean}		|	bg, 
	back_StoredBG_Sprite			|  1D	|					|	bg, 
	back_StoredBG_Frame				|  1D	|	#image_id#		|	bg, 
	back_StoredBG_AnchorX			|  1D	|	#align#			|	bg, 
	back_StoredBG_AnchorY			|  1D	|	#align#			|	bg, 
	back_StoredBG_Tint				|  1D	|	#c_code#		|	bg, 
	back_StoredBG_Alpha				|  1D	|	{real|0..1}		|	bg, 
	back_StoredBG_ScaleX			|  1D	|	{real}			|	bg, 
	back_StoredBG_ScaleY			|  1D	|	{real}			|	bg, 
	back_StoredBG_Tile				|  1D+	|	{array}			|	bg, 
									|		|					|
									|		|					|
									|		|					|
									|		|					|
									|		|					|
									|		|					|
									|		|					|
									|		|					|
									|		|					|
									|		|					|
---[other]-----------------------------------------------------------------------------------------
	