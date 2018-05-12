///guimouse_get_x();
/*
	[PPC][Controller Function][ResolutionController]
	>Returns {integer} Mouse position on the GUI layer 
*/

return floor( window_mouse_get_x() / oResolutionController.Resolution_Magnification ) + oResolutionController.Resolution_GUIxOffset;


/*=[Notes]======================================================================
	-	This produces a different result than window_mouse_get_x(), because
		it takes in to account both the scaling and gui offset the Resolution 
		Controller is applying.
	-	If you're not using oResolutionController,  window_mouse_get_x() is fine