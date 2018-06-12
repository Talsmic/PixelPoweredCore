///_setDepth();

//isGUIObject + isBackgroundObject
if ( _objv("isBackgroundObject", false) and _objv("isGUIObject", false) ) {
	depth = 10 + _objv("depth_offset", 0);
	exit;
	};

//isGUIObject
if ( _objv("isGUIObject", false) ) {
	if ( _objv("focus_level", 0) == -1 ) { depth = -(100 + _objv("depth_offset", 0)); return depth };
	depth = -(_objv("focus_level", 0)*10 + _objv("depth_offset", 0));
	return depth;
	};

//isBackgroundObject
if ( _objv("isBackgroundObject", false) ) {
	depth = 0 + _objv("depth_offset", 0);
	return depth;
	};
	
//Offset Depth
if ( _objv("depth_offset", 0) != 0 ) { 
	depth = _objv("depth_offset", 0); 
	return depth 
	};
	
depth = room_height - y;

return depth