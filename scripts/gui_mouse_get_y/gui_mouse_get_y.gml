///gui_mouse_get_y();
/*
	[PPC][Controller Function][ResolutionController]
	>Returns {integer} Mouse position on the GUI layer 
*/

return floor( window_mouse_get_y() / oResolutionController.Resolution_Magnification ) + oResolutionController.Resolution_GUIyOffset;


/*[PPC Dependancies]============================================================
	[Object]	oResolutionController	MUST EXIST IN GAME
==[PPC Notes]===================================================================
	-	This produces a different result than window_mouse_get_y(), because
		it takes in to account both the scaling and gui offset the Resolution 
		Controller is applying.
	-	If you're not using oResolutionController,  window_mouse_get_y() is fine