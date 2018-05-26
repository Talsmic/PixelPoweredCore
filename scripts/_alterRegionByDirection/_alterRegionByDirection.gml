///_alterRegionByDirection(input_array,[growth],[movement],[direction]);
/// @arg input_array	#region#
/// @arg [growth]		{integer}
/// @arg [movement]		{integer}
/// @arg [direction]	#eDirection#
/*
	<< Returns >> #region#
	Expands the region by [growth]
	Moves the region by [move]
*/
#region Arguments
if argument_count < 1 { show_debug_message("_alignRegion requires a region"); exit };//[!Break!]~~~>
var input_array =	_validateRegion(argument[0]);
var growth =		argument_count > 1 ? argument[1] : 0;
var movement =		argument_count > 2 ? argument[2] : 0;
var _direction =	argument_count > 3 ? argument[3] : false;
#endregion

switch ( _direction ) {
	default:
	case LEFT:		input_array[eR.x1] -= movement - growth;	
					input_array[eR.x2] -= movement;	
					break;
	case TOP: 		input_array[eR.y1] -= movement - growth;	
					input_array[eR.y2] -= movement;	
					break;
	case RIGHT:		input_array[eR.x1] += movement;	
					input_array[eR.y2] += movement + growth;	
					break;
	case BOTTOM:	input_array[eR.y1] += movement;	
					input_array[eR.x2] += movement + growth;	
					break;
	};
	
return _validateRegion(input_array);