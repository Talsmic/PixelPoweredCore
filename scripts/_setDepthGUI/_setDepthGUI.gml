///_setDepthGUI();

if ( _objv("focus_level", 0) == -1 ) { depth = -(100 + _objv("depth_offset", 0)); return depth };
depth = -(_objv("focus_level", 0)*10 + _objv("depth_offset", 0));
return depth;