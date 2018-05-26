///resolution_get_height([type]);
/// @arg [type]
if argument_count > 0 { var type = argument[0] } else { var type = "Complete" };
var output = window_get_height();

 
if instance_exists(ResolutionController) {
	
	switch ( type ) {
	
		case "Complete":
			output = ResolutionController.Resolution_CompleteHeight;
			break;
			
		case "Playable":
			output = ResolutionController.Resolution_PlayableHeight;
			break;
			
		case "Padded":
			output = ResolutionController.Resolution_PadHeight;
			break;
			
		case "GUIOffset":
			output = ResolutionController.Resolution_GUIyOffset;
			break;
			
		case "FloatingPixels":
			output = ResolutionController.FloatingPixels_Height;
			break;
			
		case "View":
		case "Camera":
			output = ResolutionController.Resolution_ViewHeight;
			break;
			
		};
		
	}
else {
	
	switch ( type ) {
		
		case "Padded":
		case "GUIOffset":
		case "FloatingPixels":
			output = 0;
			break;
			
		case "View":
			output = view_get_hport(view_current);
			break;
			
		case "Camera":
			output = camera_get_view_y(view_camera[view_current]);
			break;
			
		};
		
	};

return output;
