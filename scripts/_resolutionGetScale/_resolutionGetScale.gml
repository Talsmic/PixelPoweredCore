///_resolutionGetScale();
/*
	[PPDK][Plugin Module: Resolution]
	<< Returns >> {integer} Resolution scaling
*/

var _width =	_windowWidth() div view_get_wport(view_current);
var _height =	_windowHeight() div view_get_hport(view_current);

var _output = _width > _height ? _height : _width;

if ( instance_exists(ResolutionController) ) { _output = ResolutionController.res_Magnification	};
	
return _output;
