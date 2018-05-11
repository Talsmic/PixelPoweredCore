///setdepth(depth_layer);
/// @arg depth_layer
var depth_layer = "Playfield"
if ( argument_count > 0 ) { depth_layer = argument[0] } 
var focus_level = 10;
var depth_offset = 0;
var set_depth = 0;
if ( variable_instance_exists(id,"FocusLevel") ) { focus_level = FocusLevel }; 
if ( variable_instance_exists(id,"DepthOffset") ) { depth_offset = DepthOffset };


switch ( depth_layer ) {
	
	case "Playfield":
		//Depths 0+ are playfield depths
		//Playfield depths are assigned by y axis
		set_depth = 0;
		set_depth = room_width - y;
		break;
		
	case "UI":
		//Depths 0 to -100 are UI depths
		//UI depths are assigned by focus level
		set_depth = -100;
		set_depth += focus_level*10;		
		set_depth += depth_offset;
		break;
		
	case "Debug":
		//Depths -100 to -200 are Debug depths
		//Debug depths are assigned by inverted focus level
		set_depth = -200;
		set_depth += focus_level*10;		
		set_depth += depth_offset;
		break;
		
	};

depth = set_depth;
return set_depth;