///ppres_adapt_resolution();
/*
	[PPC][Controller Function]
	[WIP]
*/

//Define Breakpoints
var breakpoints_width = [	0,
							ppres_MinWidth,
							ppres_IdealWidth+ppres_MinWidth,
							ppres_IdealWidth*2+ppres_MinWidth,
							ppres_IdealWidth*3+ppres_MinWidth,
							ppres_IdealWidth*4+ppres_MinWidth
							];
var breakpoints_height = [	0,
							ppres_MinHeight,
							ppres_IdealHeight+ppres_MinHeight,
							ppres_IdealHeight*2+ppres_MinHeight,
							ppres_IdealHeight*3+ppres_MinHeight,
							ppres_IdealHeight*4+ppres_MinHeight
							];

//Fullscreen
if ( window_get_fullscreen() != Options_Fullscreen ) {
	ResolutionSnapNextFrame = true;
	window_set_fullscreen(Options_Fullscreen);
	};

//Center
if ( ResolutionCenterNextFrame ) {
	window_center();
	ResolutionCenterNextFrame = false;
	};

//Resolution Snap
if ( ResolutionSnapNextFrame == true ) {
	window_set_size( ResolutionSnap_Magnification*ppres_IdealWidth, ResolutionSnap_Magnification*ppres_IdealHeight );
	ResolutionSnapNextFrame = false;
	ResolutionCenterNextFrame = true;
	};

//Detect Real Magnification Level
ppres_Magnification = 1;
for ( var i=1 ; i<5 ; i++ ) {
	if ( window_get_width() >= breakpoints_width[i] and window_get_height() >= breakpoints_height[i] ) {
		ppres_Magnification = i;
		};
	};
if ( Options_LockedMagnification ) {	ppres_Magnification = Options_Magnification	};
	
//Update Stored Dimensions
ppres_CompleteWidth	= ceil( window_get_width() / ppres_Magnification );
ppres_CompleteHeight	= ceil( window_get_height() / ppres_Magnification );
if ( ppres_CompleteWidth > ppres_MaxWidth ) {	ppres_PlayableWidth = ppres_MaxWidth };
	else {	ppres_PlayableWidth	= ppres_CompleteWidth };
if ( ppres_CompleteHeight > ppres_MaxHeight ) {	ppres_PlayableHeight = ppres_MaxHeight };
	else {	ppres_PlayableHeight	= ppres_CompleteHeight };
ppres_PadWidth			= ppres_PlayableWidth - ppres_IdealWidth;
ppres_PadHeight		= ppres_PlayableHeight - ppres_IdealHeight;

//Adapt Cursor
if ( ppres_CONTROLLER_MANAGECURSOR ) {
	switch ( ppres_Magnification ) {
		case 1: 			cursor_sprite = spr_cursor;		break;
		case 2:				cursor_sprite = spr_cursor_x2;	break;
		case 3:				cursor_sprite = spr_cursor_x3;	break;
		case 4:	default:	cursor_sprite = spr_cursor_x4;	break;
		};
	};

//Adapt GUI Layer
if ( ppres_GUIsnap ) {
	var a = application_get_position();
	ppres_GUIxOffset = a[0];
	ppres_GUIyOffset = a[1];
	}
else {
	var a = application_get_position();
	ppres_GUIxOffset = 0;
	ppres_GUIyOffset = 0;
	};
display_set_gui_maximise( ppres_Magnification, ppres_Magnification, ppres_GUIxOffset, ppres_GUIyOffset );

//AdaptView
ppres_flex_view(0);

//Adapt Application Surface
if ( !surface_exists(application_surface) ) { return };
surface_resize( application_surface, ppres_PlayableWidth, ppres_PlayableHeight );
