///_resolutionGetHeight([type]);
/// @arg [type]
#region Arguments & Variables & Variables
//Arguments
var _type =	argument_count > 0 ? argument[0] : "Complete";
//Other Variables
var _output = _windowHeight();
#endregion
 
if ( instance_exists(ResolutionController) ) {	
	
	switch ( _type ) {	
		default:
		case "Complete":		_output = ResolutionController.res_CompleteHeight;			break;			
		case "Playable":		_output = ResolutionController.res_PlayableHeight;			break;
		case "Padded":			_output = ResolutionController.res_PadHeight;				break;			
		case "GUIOffset":		_output = ResolutionController.res_GUIyOffset;				break;			
		case "FloatingPixels":	_output = ResolutionController.FloatingPixels_Height;		break;			
		case "View":
		case "Camera":			_output = ResolutionController.res_ViewHeight;				break;			
		};		
		
	}
else {	
	
	switch ( _type ) {		
		case "Padded":
		case "GUIOffset":
		case "FloatingPixels":	_output = 0;												break;			
		case "View":			_output = view_get_hport(view_current);						break;			
		case "Camera":			_output = camera_get_view_y(view_camera[view_current]);		break;			
		};		
		
	};

return _output;
