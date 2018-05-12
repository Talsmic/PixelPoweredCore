///ppres_adapt_resolution();
/*
	[PPC][Controller Function]
	[WIP]
*/

//Define Breakpoints
var breakpoints_width = [	0,
							Resolution_MinWidth,
							Resolution_IdealWidth+Resolution_MinWidth,
							Resolution_IdealWidth*2+Resolution_MinWidth,
							Resolution_IdealWidth*3+Resolution_MinWidth,
							Resolution_IdealWidth*4+Resolution_MinWidth
							];
var breakpoints_height = [	0,
							Resolution_MinHeight,
							Resolution_IdealHeight+Resolution_MinHeight,
							Resolution_IdealHeight*2+Resolution_MinHeight,
							Resolution_IdealHeight*3+Resolution_MinHeight,
							Resolution_IdealHeight*4+Resolution_MinHeight
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
	window_set_size( ResolutionSnap_Magnification*Resolution_IdealWidth, ResolutionSnap_Magnification*Resolution_IdealHeight );
	ResolutionSnapNextFrame = false;
	ResolutionCenterNextFrame = true;
	};

//Detect Real Magnification Level
Resolution_Magnification = 1;
for ( var i=1 ; i<5 ; i++ ) {
	if ( window_get_width() >= breakpoints_width[i] and window_get_height() >= breakpoints_height[i] ) {
		Resolution_Magnification = i;
		};
	};
if ( Options_LockedMagnification ) {	Resolution_Magnification = Options_Magnification	};
	
//Update Stored Dimensions
Resolution_CompleteWidth	= ceil( window_get_width() / Resolution_Magnification );
Resolution_CompleteHeight	= ceil( window_get_height() / Resolution_Magnification );
if ( Resolution_CompleteWidth > Resolution_MaxWidth ) {	Resolution_PlayableWidth = Resolution_MaxWidth };
	else {	Resolution_PlayableWidth	= Resolution_CompleteWidth };
if ( Resolution_CompleteHeight > Resolution_MaxHeight ) {	Resolution_PlayableHeight = Resolution_MaxHeight };
	else {	Resolution_PlayableHeight	= Resolution_CompleteHeight };
Resolution_PadWidth			= Resolution_PlayableWidth - Resolution_IdealWidth;
Resolution_PadHeight		= Resolution_PlayableHeight - Resolution_IdealHeight;

//Adapt Cursor
if ( RESOLUTION_CONTROLLER_MANAGECURSOR ) {
	switch ( Resolution_Magnification ) {
		case 1: 			cursor_sprite = spr_cursor;		break;
		case 2:				cursor_sprite = spr_cursor_x2;	break;
		case 3:				cursor_sprite = spr_cursor_x3;	break;
		case 4:	default:	cursor_sprite = spr_cursor_x4;	break;
		};
	};

//Adapt GUI Layer
if ( Resolution_GUIsnap ) {
	var a = application_get_position();
	Resolution_GUIxOffset = a[0];
	Resolution_GUIyOffset = a[1];
	}
else {
	var a = application_get_position();
	Resolution_GUIxOffset = 0;
	Resolution_GUIyOffset = 0;
	};
display_set_gui_maximise( Resolution_Magnification, Resolution_Magnification, Resolution_GUIxOffset, Resolution_GUIyOffset );

//AdaptView
flex_view(0);

//Adapt Application Surface
if ( !surface_exists(application_surface) ) { return };
surface_resize( application_surface, Resolution_PlayableWidth, Resolution_PlayableHeight );

/*[PPC Dependancies]============================================================
	MUST BE RUN BY [Object] oResolutionController