///resolutionAdapt();
/*
	[PPDK][Plugin Module: Resolution][Controller Function]
	This function performs all the important elements on the resolution system.
	In order this function:
	  -	Defines how to decide scaling (determined by your settings)
	  - Toggle fullscreen (determined by your settings)
	  - Center the window (as required)
	  -	Snaps to an ideal resolution (as required)
	
*/
var _window_width =		_windowWidth();
var _window_height =	_windowHeight();
var _ideal_width =		IdealWidth  ? IdealWidth  : round(IdealHeight*_aspectRatio());
var _ideal_height =		IdealHeight ? IdealHeight : round(IdealWidth*_aspectRatio());

#region Define Scaling Breakpoints
/*	These dictate how the controller decides what what resoution magnification level to use, and can 
	be altered by changing RES_Magnification_Min and RES_Magnification_Max.
	You can also force the game to ignore these by setting opt_res_Magnification_Locked to true, 
	which will tell the controller to use opt_res_Magnification to dictate scaling instead.*/
var _breakpointsX = [ 0, RES_MinWindowWidth ]
var _breakpointsY = [ 0, RES_MinWindowHeight ]
for ( var i = 2; i <= RES_Magnification_Max; ++i ) {
	//By default, the breakpoints are when the window the minumum over the ideal 
	_breakpointsX[i] = RES_IdealWidth * ( i-1 ) + RES_MinWidth;
	_breakpointsY[i] = RES_IdealHeight * ( i-1 ) + RES_MinHeight;
	//If RubberBanding is enabled, breakpoints are only to ideal resolutions
	if ( RES_RubberBanding ) {
		_breakpointsX[i] = RES_IdealWidth * i;
		_breakpointsY[i] = RES_IdealWidth * i;
		};
	//If the minimum scaling is higher than 1, this will force the breakpoints to match
	if ( RES_Magnification_Min >= i ) {
		_breakpointsX[i] = RES_MinWindowWidth;
		_breakpointsY[i] = RES_MinWindowHeight;
		};
	}; 
	#endregion

#region Fullscreen Correction
/*	Checks to make sure fullscreen is active if it should be, or turns it off if it shouldn't be.
	If RES_Fullscreen_ToggleEnable is false, RES_Fullscreen_AtBoot always determines the result of this, 
	otherwise opt_res_Fullscreen does.*/
if RES_Fullscreen_ToggleEnable {
	if ( window_get_fullscreen() != opt_res_Fullscreen ) {
		NextEvent_SnapResolution = true;
		window_set_fullscreen(opt_res_Fullscreen);
		};
	}
else {
	if ( window_get_fullscreen() != RES_Fullscreen_AtBoot ) {
		NextEvent_SnapResolution = true;
		window_set_fullscreen(RES_Fullscreen_AtBoot);
		};
	}; 
	#endregion

#region Center The Screen
/*	Centering the screen at the same time as making certain window changes will
	produce wonky results, by delaying the centering it corrects this behaviour*/
if NextEvent_ResolutionCenter {
	window_center();
	NextEvent_ResolutionCenter = false;
	show_debug_message("Event: Window Centering");
	}; #endregion

#region Snap To Ideal Resolution
/*	Forces the resolution of the window to seek an ideal resolution */
if NextEvent_SnapResolution {
	show_debug_message("Event: Resolution Snap ["+string(NextEvent_SnapResolution_Scale*RES_IdealWidth)+"x"+string(NextEvent_SnapResolution_Scale*RES_IdealHeight)+"]");
	window_set_size( NextEvent_SnapResolution_Scale*RES_IdealWidth, NextEvent_SnapResolution_Scale*RES_IdealHeight );
	NextEvent_SnapResolution = false;
	NextEvent_ResolutionCenter = true;
	if ( _windowWidth() != NextEvent_SnapResolution_Scale*RES_IdealWidth or _windowHeight() != NextEvent_SnapResolution_Scale*RES_IdealHeight ) {
		show_debug_message("Error: Resolution Snap not correctly registered");
		NextEvent_SnapResolution = true;
		};
	
	}; #endregion

#region Update Magnification Level
/*	Forces the resolution of the window to seek an ideal resolution */
if opt_res_Magnification_Locked {
	res_Magnification = opt_res_Magnification	
	}
else {
	res_Magnification = RES_Magnification_Min;
	for ( var i=1; i<=RES_Magnification_Max; ++i ) {
		if ( _window_width >= _breakpointsX[i] and _window_height >= _breakpointsY[i] ) {
			res_Magnification = i;
			};
		};
	}; #endregion
	
#region Update Stored Dimensions
/*	You can access these variables through the ResolutionController and they 
	are incredibly useful for sizing and placing UIs on the screen.
	[res_CompleteWidth/Height] store the entire window size in pixels, 
	  before scaling 
	[FloatingPixels_Width/Height] stores the leftovers that can't be scaled 
	  properly, this is used to avoid wonky scaling at odd window sizes. */
res_CompleteWidth		= _window_width div res_Magnification;
res_CompleteHeight		= _window_height div res_Magnification;
FloatingPixels_Width	= _window_width mod res_Magnification;
FloatingPixels_Height	= _window_height mod res_Magnification;
//If the window is minimised
/*	[res_PlayableWidth/Height] store the area on the screen inside the 
	  margins. If there are margins, this will be the same as res_Complete.
	[res_PadWidth/Height] stores how far from Ideal the screen size is.
	  If postive, this is the added vision, but doesn't include any margins.
	  If negative, this is the lost vision. */
if ( res_CompleteWidth > RES_MaxWidth )   { res_PlayableWidth  = RES_MaxWidth };
											  else { res_PlayableWidth  = res_CompleteWidth };
if ( res_CompleteHeight > RES_MaxHeight ) { res_PlayableHeight = RES_MaxHeight };
											  else { res_PlayableHeight = res_CompleteHeight };
res_PadWidth	 = res_PlayableWidth - RES_IdealWidth;
res_PadHeight = res_PlayableHeight - RES_IdealHeight;
#endregion

#region Update Cursor
/*	If RES_Cursor is enabled, this sets the cursor graphic to match the 
	maginfication size of the screen.
	[WIP] I may update this with a better solution down the track*/
if RES_Cursor {
	switch ( res_Magnification ) {
		case 1: 			cursor_sprite = spr_cursor;		break;
		case 2:				cursor_sprite = spr_cursor_x2;	break;
		case 3:				cursor_sprite = spr_cursor_x3;	break;
		case 4:				cursor_sprite = spr_cursor_x4;	break;
		case 5:	default:	cursor_sprite = spr_cursor_x5;	break;
		};
	}; #endregion

#region Resize and Reposition GUI Layer
/*	If RES_GUIScaling is less than or equal 0, adaptable scaling is enabled
	and the GUI layer will match the magnification size. Otherwise, the GUI 
	layer has fixed magnification and won't scale.
	If RES_GUISnap is enabled, the GUI can only exist within the playable area 
	of the screen, otherwise it can exist over the margins (should they exist). */
if RES_GUISnap {
	var a = application_get_position();
	res_GUIxOffset = a[0];
	ppres_GUIyOffset = a[1];
	}
else {
	res_GUIxOffset = 0;
	res_GUIyOffset = 0;
	};
if RES_GUIScaling < 1 {
	display_set_gui_size(res_CompleteWidth, res_CompleteHeight);
	display_set_gui_maximise( res_Magnification, res_Magnification, res_GUIxOffset, res_GUIyOffset );
	}
else {
	display_set_gui_size(res_CompleteWidth, res_CompleteHeight);
	display_set_gui_maximise( RES_GUIScaling, RES_GUIScaling, res_GUIxOffset, res_GUIyOffset );
	};
#endregion

#region Resize and Reposition View and Camera
/*	Runs the function that resizes the camera and views */
resolutionAdjustView(view_current);
#endregion

#region Resize the application surface
/*This is important even if you're not using the application surface redraw features */
if ( !surface_exists(application_surface) ) {  }
else {
	surface_resize( application_surface, res_PlayableWidth, res_PlayableHeight )
	};
#endregion
