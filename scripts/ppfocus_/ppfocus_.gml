///ppfocus_
/*
===[Overview]===================================================================

===[Quick Setup]================================================================	

===[Settings]=================================================================*/
	//Enable the entire Focus module
	#macro PPC_FOCUS_Enable 			1 //true
	//Enable depth sorting
	#macro PPC_FOCUS_ManageDepth		1 //true
	//Enable depth sorting by layers
	#macro PPC_FOCUS_DepthLayers		1 //true
	//Enable focus fogging
	//This causes the oFocusController to draw a flat colour layer over any 
	//elements not in focus
	#macro PPC_FOCUS_FocusFog			1 //true
	#macro PPC_FOCUS_FocusFog_Colour	c_white //colour_code
	#macro PPC_FOCUS_FocusFog_Alpha		0.5

/*=[Module Components]==========================================================
---[Objects]--------------------------------------------------------------------
	oFocusController								[Functional and Documented]
	
---[Scripts]--------------------------------------------------------------------
	focus_set();									[Functional and Documented]
	infocus();										[Functional and Documented]
	setdepth();										[Functional and Documented]
	
---[Macros]-------------------------------------------------------------------*/
	#macro DEPTHLAYER_PLAYFIELD		1
	#macro DEPTHLAYER_GUI			2
	#macro DEPTHLAYER_DEBUG			3