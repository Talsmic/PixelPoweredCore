///setdepth([override_mouse_layer],[depth_offset],[focus_layer]);
/// @arg [override_mouse_layer]  #eFocusLayer#	(default: eFocusLayer.standard)
/// @arg [depth_offset] {integer}		(default: 0)
/// @arg [focus_layer]  {real|1..10}	(default: 10)
/*
	[PixelPowered Module: Focus]
	<< Returns >> {integer} new object depth
	<< Pushes >> {integer} to object.depth
	This is a pretty standard depth = -y system with additional hooks to sort
	that depth by a couple of predetermined layers
*/
if !instance_exists(FocusController) return depth;//[!Break!]~~~~~~~~~~~~~~~~~>
if !FocusController.Setting_ManageDepth return depth;//[!Break!]~~~~~~~~~~~~~~>
#region Arguments
//Defaults < InstanceVariables < Parameters
if has_objv("foc_InteractionLayer") and !has_objv("Layer_Depth") { Layer_Depth = foc_InteractionLayer };
var depth_layer =	argument_count > 0 ? argument[0] : objv("Layer_Depth",eFocusLayer.standard);
var depth_offset =	argument_count > 1 ? argument[1] : objv("Layer_Depth_Offset",0);
var focus_layer =	argument_count > 2 ? argument[2] : objv("foc_FocusLevel",FocusController.Setting_Focus_Floor);
var output = depth;
#endregion

//Turn off depth layers if disabled
if !FocusController.Setting_DepthLayers { depth_layer = eFocusLayer.standard };

switch ( depth_layer ) {
	
	case eFocusLayer.background:
		//Backgrounds have a fixed depth
		output = room_height + 1;	
		output += depth_offset;
		break;
	
	default:
	case eFocusLayer.standard:
		//Depths 0+ are playfield depths
		//Playfield depths are assigned by y axis
		output = room_height - y;	
		output += depth_offset;
		break;
		
	case eFocusLayer.GUI:
		//Depths 0 to -100 are GUI depths
		//UI depths are assigned by inverted focus level
		output = -100;
		output += focus_layer*10;		
		output += depth_offset;
		break;
		
	case eFocusLayer.debug:
		//Depths -100 to -200 are Debug depths
		//Debug depths are assigned by inverted focus level
		output = -200;
		output += focus_layer*10;		
		output += depth_offset;
		break;
		
	};

depth = output;
return output;

