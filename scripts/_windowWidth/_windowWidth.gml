///_windowWidth();
/*
	[PPDK][Plugin Module: Resolution]
	The standard _windowWidth function in GMS:2 returns 0 if the window gets 
	minimised. This is dangerous behaviour with a lot of ResolutionController 
	scripts, and this version will always output a value greater than zero
	<< Returns >> {integer}: Window Width
*/
var _output = window_get_width();
if ( !_output ) { _output = 10 };
return _output;
