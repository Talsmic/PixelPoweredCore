///instance_create_as_slave(x,y,object,[depthoffset],[focusoffset]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg object			{integer|ObjectID}
/// @arg [depthoffset]	{integer}			(default: 0);
/// @arg [focusoffset]	{real}				(default: 0);
/*
	[[ Draws ]] text with an outline
*/
#region Arguments & Variables
if argument_count < 3 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var obj_x =			argument[0];
var obj_y =			argument[1];
var object =		argument[2];
//Defaults < InstanceVariables < Parameters
var depth_offset =	argument_count > 3 ? _objv("Layer_Depth_Offset",0) + argument[3] : _objv("Layer_Depth_Offset",0);
var obj_focus =		argument_count > 4 ? _objv("foc_focus_level",0) - argument[4] : _objv("foc_focus_level",10);
var obj_depth = depth+depth_offset;	
#endregion

var output = instance_create_depth(obj_x,obj_y,obj_depth,object);
output.foc_focus_level = obj_focus;
output.Layer_Depth_Offset = depth_offset;
output.IsSlave = true;
output.Master = id;

return output;