///_alignRegion(region_array,[align_array],[anchor]);
/// @arg region_array	#region#
/// @arg [align_array]	#align#			(default: [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo]);
/// @arg [anchor]		{array} [x,y]
/*
	<< Returns >> #region#
	Shifts a region to the provided alignment
*/
#region Arguments
if argument_count < 1 { show_debug_message("_alignRegion requires a region"); exit };//[!Break!]~~~>
var region_array =	_validateRegion(argument[0]);
var align_array =	argument_count > 1 ? _storeAlign(argument[1]) : [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo];
var anchor =		argument_count > 2 ? argument[2] : [region_array[eR.x1], region_array[eR.y1]];
var output =		region_array;
#endregion
		
switch ( align_array[0] ) {
	default:
	case fa_left:		
		output[eR.x1]  = anchor[0] + align_array[2]; 
		output[eR.x2]  = anchor[0] + align_array[2] + output[eR.w];	
		break;
	case fa_center:		
		output[eR.x1]  = anchor[0] + align_array[2] - (output[eR.w] div 2); 
		output[eR.x2]  = anchor[0] + align_array[2] + (output[eR.w] div 2) + (output[eR.w] mod 2);	
		break;
	case fa_right:		
		output[eR.x1]  = anchor[0] - align_array[2] - output[eR.w]; 
		output[eR.x2]  = anchor[0] - align_array[2];	
		break;
	};

switch ( align_array[1] ) {
	case fa_top:		
		output[eR.y1]  = anchor[1] + align_array[3]; 
		output[eR.y2]  = anchor[1] + align_array[3] + output[eR.h];	
		break;
	case fa_middle:		
		output[eR.y1]  = anchor[1] + align_array[3] - (output[eR.h] div 2); 
		output[eR.y2]  = anchor[1] + align_array[3] + (output[eR.h] div 2) + (output[eR.h] mod 2);	
		break;
	case fa_bottom:		
		output[eR.y1]  = anchor[1] - align_array[3] - output[eR.h]; 
		output[eR.y2]  = anchor[1] - align_array[3];	
	};

return output;