///_windowHeight();
/*
	[PPDK][Plugin Module: Resolution]
	The standard window_get_height function in GMS:2 returns 0 if the window gets 
	minimised. This is dangerous behaviour with a lot of ResolutionController 
	scripts, and this version will always output a value greater than zero
	<< Returns >> {integer}: Window Height
*/
var _output = window_get_height();
if ( _output < 1 ) { _output = RES_MinWindowWidth };
return _output;