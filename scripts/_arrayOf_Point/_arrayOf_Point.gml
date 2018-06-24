///_arrayOf_Point([input]);
/// @arg input		{any}
/*
	<< Returns >> {array_1d}
	[ x, y ]
*/

var output = [x, y];

#region Arguments & Variables
if ( !argument_count ) return output;
var _input =		is_array(argument[0]) ? argument[0] : [argument[0]];
var _input_length =	array_length_1d(_input);
#endregion

switch ( _input_length ) {
	default:	output[1] = _input[1];
	case 1:		output[0] = _input[0];
	};
	
return output;