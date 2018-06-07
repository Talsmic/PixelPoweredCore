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
#region Arguments & Variables
if argument_count < 1 { show_debug_message("_alignRegion requires a region"); exit };//[!Break!]~~~>
var input_array =	_validateRegion(argument[0]);
var growth =		argument_count > 1 ? argument[1] : 0;
var movement =		argument_count > 2 ? argument[2] : 0;
var _direction =	argument_count > 3 ? argument[3] : false;
#endregion

switch ( _direction ) {
	default:
	case LEFT:		input_array[aR.x1] -= movement - growth;	
					input_array[aR.x2] -= movement;	
					break;
	case TOP: 		input_array[aR.y1] -= movement - growth;	
					input_array[aR.y2] -= movement;	
					break;
	case RIGHT:		input_array[aR.x1] += movement;	
					input_array[aR.y2] += movement + growth;	
					break;
	case BOTTOM:	input_array[aR.y1] += movement;	
					input_array[aR.x2] += movement + growth;	
					break;
	};
	
return _validateRegion(input_array);