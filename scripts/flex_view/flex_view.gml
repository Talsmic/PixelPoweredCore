///flex_view(view);
/// @arg view
//Flex views check the current room and adjust the view based on 
//the availible space if the room allows for it

var view = argument0;

//Adjust the view size to fit the screen
view_xport[view] = 0;
view_yport[view] = 0;
view_wport[view] = Resolution_PlayableWidth;
view_hport[view] = Resolution_PlayableHeight;
camera_set_view_size( view_camera[view], view_wport[view], view_hport[view] );

//Adjust the view location if the view size has changed
var width_change = Resolution_ViewWidth - Resolution_PlayableWidth;
var height_change = Resolution_ViewHeight - Resolution_PlayableHeight;
if ( width_change != 0 or height_change != 0 ) {
	camera_set_view_pos( view_camera[view], camera_get_view_x(view_camera[view]) + floor(width_change*0.5), camera_get_view_y(view_camera[view]) + floor(height_change*0.5) );
	};
	
//Room Specific Anchors
switch ( room ) {
	default:				var fixed_X = -1; 		var fixed_Y = -1;		break;
	case rm_DebugMenu:		var fixed_X = 240; 		var fixed_Y = 135;		break;	
	};
//Apply Archors
if ( fixed_X >= 0 or fixed_Y >= 0 ) {	
	camera_set_view_pos( view_camera[view], fixed_X - floor(Resolution_PadWidth*0.5), fixed_Y - floor(Resolution_PadHeight*0.5)  );
	};

//Save New Dimensions
Resolution_ViewWidth = view_wport[view];
Resolution_ViewHeight = view_hport[view];