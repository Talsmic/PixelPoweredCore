///_positionInRegion(region_array,[align_array]);
/// @arg region_array	#region#
/// @arg [align_array]	#align#			(default: [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo]);
/*
	<< Returns >> {array} [point_in_region{boolean}, x_in_region{real}, y_in_region{real}]
*/
#region Arguments
if argument_count < 1 { show_debug_message("_positionInRegion requires a region"); exit };//[!Break!]~~~>
var region_array =	_validateRegion(argument[0]);
var align_array =	argument_count > 1 ? _storeAlign(argument[1]) : [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo];
#endregion

var x_in_region, y_in_region;

switch ( align_array[0] ) {
	
	default:
	case fa_left:	var x_in_region = region_array[eR.x1] + align_array[2];			break;		
	case fa_center:	var x_in_region = (region_array[eR.w] div 2) + align_array[2];	break;	
	case fa_right:	var x_in_region = region_array[eR.x2] - align_array[2];			break;	
		
	};
	
switch ( align_array[1] ) {	
	
	default:
	case fa_top:	var y_in_region = region_array[eR.y1] + align_array[3];			break;		
	case fa_middle:	var y_in_region = (region_array[eR.h] div 2) + align_array[3];	break;	
	case fa_bottom:	var y_in_region = region_array[eR.y2] - align_array[3];			break;	
		
	};
	
var is_point_in_region = ( x_in_region >= 0 and x_in_region <= region_array[eR.w] and y_in_region >= 0 and y_in_region <= region_array[eR.h]  ) ? true : false;

return [x_in_region, y_in_region, is_point_in_region];