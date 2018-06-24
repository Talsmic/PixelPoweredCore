///_alignRegion(region_array,[align_array],[anchor]);
/// @arg region_array	#region#
/// @arg [align_array]	#align#			(default: global.AlignArray);
/// @arg [anchor]		{array} [x,y]
/*
	<< Returns >> #region#
	Shifts a region to the provided alignment
*/
#region Arguments & Variables
if argument_count < 1 { show_debug_message("_alignRegion requires a region"); exit };//[!Break!]~~~>
var region_array =	_validateRegion(argument[0]);
var align_array =	argument_count > 1 ? _alignArrayWithOffset(argument[1]) : global.AlignArray;
var anchor =		argument_count > 2 ? argument[2] : [region_array[aR.x1], region_array[aR.y1]];
var output =		region_array;
#endregion
		
switch ( align_array[0] ) {
	default:
	case fa_left:		
		output[aR.x1]  = anchor[0] + align_array[2]; 
		output[aR.x2]  = anchor[0] + align_array[2] + output[aR.w];	
		break;
	case fa_center:		
		output[aR.x1]  = anchor[0] + align_array[2] - (output[aR.w] div 2); 
		output[aR.x2]  = anchor[0] + align_array[2] + (output[aR.w] div 2) + (output[aR.w] mod 2);	
		break;
	case fa_right:		
		output[aR.x1]  = anchor[0] - align_array[2] - output[aR.w]; 
		output[aR.x2]  = anchor[0] - align_array[2];	
		break;
	};

switch ( align_array[1] ) {
	case fa_top:		
		output[aR.y1]  = anchor[1] + align_array[3]; 
		output[aR.y2]  = anchor[1] + align_array[3] + output[aR.h];	
		break;
	case fa_middle:		
		output[aR.y1]  = anchor[1] + align_array[3] - (output[aR.h] div 2); 
		output[aR.y2]  = anchor[1] + align_array[3] + (output[aR.h] div 2) + (output[aR.h] mod 2);	
		break;
	case fa_bottom:		
		output[aR.y1]  = anchor[1] - align_array[3] - output[aR.h]; 
		output[aR.y2]  = anchor[1] - align_array[3];	
	};

return output;