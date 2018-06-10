/// @desc Manage Focus

//Manage Focus
if !Hidden _effectFocus();

//Update Anchors
switch ( WindowAnchor_X ) {
	case fa_left:	GUI_X = 0 + WindowAnchor_X_pad;											break;
	case fa_center:	GUI_X = ( _resolutionGetWidth() div 2 ) - ( LastDrawWidth div 2 );		break;
	case fa_right:	GUI_X = _resolutionGetWidth() - LastDrawWidth - WindowAnchor_X_pad;	break;
	}; 
switch ( WindowAnchor_Y ) {
	case fa_top:	GUI_Y = 0 + WindowAnchor_Y_pad;											break;
	case fa_center:	GUI_Y = ( _resolutionGetHeight() div 2 ) - ( LastDrawHeight div 2 );	break;
	case fa_bottom:	GUI_Y = _resolutionGetHeight() - LastDrawHeight - WindowAnchor_Y_pad;	break;
	}; 
