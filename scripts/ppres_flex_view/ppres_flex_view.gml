///ppres_flex_view([view],[room]);
/// @arg [view] {ViewID}	(default: view_current)
/// @arg [room] {RoomID}	(default: room)
/*
	[PPC][Module:Resolution]
	Adjusts the view to fit the current resolution and room
*/
#region Arguments
var flex_view =	argument_count > 0 ? argument[0] : view_current;
var flex_room =	argument_count > 1 ? argument[1] : room;
var output = false;
#endregion

//Adjust the flex_view size to fit the screen
view_xport[flex_view] = 0;
view_yport[flex_view] = 0;
view_wport[flex_view] = Resolution_PlayableWidth;
view_hport[flex_view] = Resolution_PlayableHeight;
camera_set_view_size( view_camera[flex_view], view_wport[flex_view], view_hport[flex_view] );

//Adjust the flex_view location if the flex_view size has changed
var width_change = Resolution_ViewWidth - Resolution_PlayableWidth;
var height_change = Resolution_ViewHeight - Resolution_PlayableHeight;
if ( width_change != 0 or height_change != 0 ) {
	output = true;
	show_debug_message("View Repositioned");		
	//Find the repositioned view:
	var x_new = camera_get_view_x(view_camera[flex_view]) + (width_change div 2);
	var y_new = camera_get_view_y(view_camera[flex_view]) + (height_change div 2);
	//Common corrections to width:
	if ( Resolution_PlayableWidth <= room_width ) {				//Room too small
		show_debug_message("room_width too small");
		x_new = (Resolution_PlayableWidth - room_width) div 2 }	
	else if ( x_new < 0 ) {										//Too far left
		show_debug_message("left boundary");
		x_new = 0 }
	else if ( x_new + Resolution_PlayableWidth < room_width ) { //Too far right
		show_debug_message("right boundary");
		x_new = room_width - Resolution_PlayableWidth };		
	//Common corrections to height:
	if ( Resolution_PlayableHeight <= room_height ) {			//Room too small
		show_debug_message("room_height too small");
		y_new = (Resolution_PlayableHeight - room_height) div 2 }	
	else if ( y_new < 0 ) {										//Too far up
		show_debug_message("top boundary");
		y_new = 0 }
	else if ( y_new + Resolution_PlayableHeight < room_height ) {//Too far down
		show_debug_message("bottom boundary");
		y_new = room_height - Resolution_PlayableHeight };			
	show_debug_message("New X: "+string(x_new));
	show_debug_message("New Y: "+string(y_new));
	camera_set_view_pos( view_camera[flex_view], x_new, y_new );
	};
	
//Room Specific Anchors
var anchors = ppres_room_anchors(flex_room);
if anchors[0] {	
	camera_set_view_pos( view_camera[flex_view], anchors[1] - (Resolution_PadWidth div 2), anchors[2] - (Resolution_PadHeight div 2)  );
	};

//Save New Dimensions
Resolution_ViewWidth = view_wport[flex_view];
Resolution_ViewHeight = view_hport[flex_view];

return output;

/*=[Notes]======================================================================
	-	For the default functionality, don't bother providing arguments, they 
		are an option offered should circumstances arise that you are resizing 
		a view you aren't using, or adjusting for a room other than the 
		currently being displayed room.
