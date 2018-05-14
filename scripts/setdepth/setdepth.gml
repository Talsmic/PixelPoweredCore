///setdepth([depth_layer],[depth_offset],[focus_level]);
/// @arg [depth_layer] {integer:ObjectID}	(Defaults to id)
/// @arg [depth_offset] {integer:ObjectID}	(Defaults to id)
/// @arg [focus_level] {integer:ObjectID}	(Defaults to id)
/*
	[PPC][Module:Focus]
	This is a pretty standard depth = -y system with additional hooks to sort
	that depth by a couple of predetermined layers
*/

//Fail to run if depth management is disabled
if !PPC_FOCUS_ManageDepth { return 0 };

//Variable defaults
var depth_layer = DEPTHLAYER_PLAYFIELD
var focus_level = 10;
var depth_offset = 0;

//Check for object stored variables
if ( variable_instance_exists(id,"FocusLevel") ) { focus_level = FocusLevel }; 
if ( variable_instance_exists(id,"DepthOffset") ) { depth_offset = DepthOffset };

//Parameters overrule stored values
if ( argument_count > 0 ) { depth_layer = argument[0] } ;
if ( argument_count > 1 ) { focus_level = argument[1] } ;
if ( argument_count > 2 ) { depth_offset = argument[2] } ;

//Turn off depth layers if disabled
if !PPC_FOCUS_DepthLayers { depth_layer = DEPTHLAYER_PLAYFIELD } ;

//Default to not changing depth
var output = depth;

switch ( depth_layer ) {
	
	case DEPTHLAYER_PLAYFIELD:
		//Depths 0+ are playfield depths
		//Playfield depths are assigned by y axis
		output = room_height - y;	
		output += depth_offset;
		break;
		
	case DEPTHLAYER_GUI:
		//Depths 0 to -100 are GUI depths
		//UI depths are assigned by inverted focus level
		output = -100;
		output += focus_level*10;		
		output += depth_offset;
		break;
		
	case DEPTHLAYER_DEBUG:
		//Depths -100 to -200 are Debug depths
		//Debug depths are assigned by inverted focus level
		output = -200;
		output += focus_level*10;		
		output += depth_offset;
		break;
		
	};

depth = output;
return output;

