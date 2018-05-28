///_windowWidth();
/*
	[PPDK][Plugin Module: Resolution]
	The standard window_get_width function in GMS:2 returns 0 if the window gets 
	minimised. This is dangerous behaviour with a lot of ResolutionController 
	scripts, and this version will always output a value greater than zero
	<< Returns >> {integer}: Window Width
*/
var _output = window_get_width();
if ( _output < 1 ) { _output = RES_MinWindowWidth };
return _output;
