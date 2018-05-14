///guimouse_get_x();
/*
	[PPC][Module:Resolution]
	>Returns {integer} Mouse x position on the GUI layer 
*/
var output = window_mouse_get_x(); //Default to the Window Position of the mouse

//If GUI Mouse tracking is enabled, divide by oResolutionController.Resolution_Magnification
if ( PPRES_GUIMouse ) { output = output div oResolutionController.Resolution_Magnification };

return output;


/*=[Notes]======================================================================
	-	This will produce a different result than window_mouse_get_x(), because
		it takes in to account both the scaling and gui offset the Resolution 
		Controller is applying.
	-	If you're not using oResolutionController,  window_mouse_get_x() will
		get you the number you need correctly.
