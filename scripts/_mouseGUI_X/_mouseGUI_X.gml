///_mouseGUI_X();
/*
	[PPDK][Plugin Module: Resolution]
	<< Returns >> {integer} Mouse x position on the GUI layer 
*/
var _output = window_mouse_get_x(); //Default to the Window Position of the mouse

//If GUI Mouse tracking is enabled, divide by res_Magnification
if ( instance_exists(ResolutionController) and RES_GUIMouse ) { _output = _output div _resolutionGetScale() };

return _output;


/*=[Notes]======================================================================
	-	This will produce a different result than window_mouse_get_x(), because
		it takes in to account both the scaling and gui offset the Resolution 
		Controller is applying.
	-	If you're not using ResolutionController,  window_mouse_get_x() will
		get you the number you need correctly.
