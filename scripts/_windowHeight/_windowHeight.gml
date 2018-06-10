///_windowHeight();
/*
	[PPDK][Plugin Module: Resolution]
	The standard _windowHeight function in GMS:2 returns 0 if the window gets 
	minimised. This is dangerous behaviour with a lot of ResolutionController 
	scripts, and this version will always output a value greater than zero
	<< Returns >> {integer}: Window Height
*/
var _output = window_get_height();
if ( !_output ) { _output = 10 };
return _output;