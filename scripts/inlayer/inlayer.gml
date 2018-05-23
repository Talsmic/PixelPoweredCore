///inlayer(layer,[object]);
/// @arg layer		{eDepthLayer}
/// @arg [object]	{ObjectID}		(default: id)
/*
	[PixelPowered Module: Focus]
	>>Returns {boolean}
	Checks what interation layer an object is in
	This is basically a priority list for which identifier gets to decide
*/
if !instance_exists(oFocusController) return true;//[!Break!]~~~~~~~~~~~~~~~~~~>
if !oFocusController.Setting_ManageDrawLayers return true;//[!Break!]~~~~~~~~~~>
#region Arguments
var check_layer = argument[0];
var object_id =	argument_count > 1 ? argument[1] : id;
var object_layer = objv("Interaction_Layer",eDepthLayer.standard,object_id);
#endregion

if object_layer == check_layer return true;//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>

switch check_layer {
		
	case eDepthLayer.debug:		
	case eDepthLayer.GUI: 
		if global.inProgress_DrawGUI return true;//[!Break!]~~~~~~~~~~~~~~~~~~~>
		
	case eDepthLayer.background: 
	case eDepthLayer.standard:	
		if global.inProgress_Draw return true;//[!Break!]~~~~~~~~~~~~~~~~~~~~~~>
		
	};
	
return false;
