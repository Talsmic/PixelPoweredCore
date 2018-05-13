///ppres_flex_view([view],[room]);
/// @arg [view] {Integer:ViewID}	(Defaults to view_current)
/// @arg [room] {Integer:RoomID}	(Defaults to room)
/*
	[PPC][Module:ResolutionController]
	Adjusts the view to fit the current resolution and room
*/
var flex_view = view_current;
if ( argument_count > 0 ) { flex_view = argument[0] };
var flex_room = room; 
if ( argument_count > 1 ) { flex_room = argument[1] };

//Adjust the flex_view size to fit the screen
view_xport[flex_view] = 0;
view_yport[flex_view] = 0;
view_wport[flex_view] = ppres_PlayableWidth;
view_hport[flex_view] = ppres_PlayableHeight;
camera_set_view_size( view_camera[flex_view], view_wport[flex_view], view_hport[flex_view] );

//Adjust the flex_view location if the flex_view size has changed
var width_change = ppres_ViewWidth - ppres_PlayableWidth;
var height_change = ppres_ViewHeight - ppres_PlayableHeight;
if ( width_change != 0 or height_change != 0 ) {
	camera_set_view_pos( view_camera[flex_view], camera_get_view_x(view_camera[flex_view]) + floor(width_change*0.5), camera_get_view_y(view_camera[flex_view]) + floor(height_change*0.5) );
	};
	
//Room Specific Anchors
var anchors = ppres_room_anchors(flex_room);
if ( anchors[0] ) {	
	camera_set_view_pos( view_camera[flex_view], anchors[1] - floor(ppres_PadWidth*0.5), anchors[2] - floor(ppres_PadHeight*0.5)  );
	};

//Save New Dimensions
ppres_ViewWidth = view_wport[flex_view];
ppres_ViewHeight = view_hport[flex_view];

/*=[Notes]======================================================================
	-	For the default functionality, don't bother providing arguments, they 
		are an option offered should circumstances arise that you are resizing 
		a view you aren't using, or adjusting for a room other than the 
		currently being displayed room.
