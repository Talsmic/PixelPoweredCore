///_alterRegion(region_array,[growth_array],[move_array],[flip_dimensions]);
/// @arg region_array	#region#
/// @arg [growth_array]		{array} [LEFT,UP,DOWN,RIGHT]
/// @arg [move_array]		{array} [RIGHT,DOWN]
/// @arg [flip_dimensions]	{boolean}
/*
	<< Returns >> #region#
	Expands the region by [growth_array]
	Moves the region by [move_array]
*/
#region Arguments & Variables
if argument_count < 1 { show_debug_message("_alignRegion requires a region"); exit };//[!Break!]~~~>
var input_array =		_validateRegion(argument[0]);
var growth_array =		argument_count > 1 ? _validateArray(argument[1],4,4,argument[1]) : [0,0,0,0];
var move_array =		argument_count > 2 ? _validateArray(argument[2],2,2,argument[2]) : [0,0];
var flip_dimensions =	argument_count > 3 ? argument[3] : false;
#endregion

//Make Changes
input_array[aR.x1] = input_array[aR.x1] - growth_array[0] + move_array[0];
input_array[aR.y1] = input_array[aR.y1] - growth_array[1] - move_array[1];
input_array[aR.x2] = input_array[aR.x2] + growth_array[2] + move_array[0];
input_array[aR.y2] = input_array[aR.y2] + growth_array[3] - move_array[1];
input_array= _validateRegion(input_array);

//Flip Dimensions
if ( flip_dimensions ) {
	input_array= _validateRegion( [input_array[aR.x1], input_array[aR.y1], "", "", input_array[aR.h], input_array[aR.w]] );
	};
	
return input_array;