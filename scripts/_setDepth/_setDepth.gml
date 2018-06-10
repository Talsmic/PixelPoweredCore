///_setDepth();

//GUIObject + Background
if ( _objv("BackgroundObject", false) and _objv("GUIObject", false) ) {
	depth = 10 + _objv("DepthOffset", 0);
	exit;
	};

//GUIObject
if ( _objv("GUIObject", false) ) {
	depth = _objv("GUILevel", _objv("FocusLevel", 1) ) + _objv("DepthOffset", 0);
	exit;
	};

//Background
if ( _objv("BackgroundObject", false) ) {
	depth = 0 + _objv("DepthOffset", 0);
	exit;
	};
	
//Offset Depth
if ( _objv("DepthOffset", 0) != 0 ) { depth = _objv("DepthOffset", 0) };
	
depth = room_height - y;