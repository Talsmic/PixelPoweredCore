///_alignArrayWithOffset([input]);
/// @arg input		{any}
/*
	<< Returns >> {array_1d}
	[ x_align(horizontal), y_align(horizontal), x_offset, y_offset ]
*/

//[Check #0] No input: return current global alignment
if ( !argument_count ) { return global.AlignArray };

var _input =	argument[0];

//[Check #1] Is it an array? (This is the only time we should create a new array)
if ( !is_array(argument[0]) ) { return [argument[0], global.AlignY] }; //[!Break!]

//[Check #2] Length
var _input_length =	array_length_1d(_input);
if ( _input_length >= 4 ) { return _input }; //[!Break!]
//Fill missing values
switch ( _input_length ) {
	case 0:		_input[@ 0] = global.AlignX;
	case 1:		_input[@ 1] = global.AlignY;
	case 2:		_input[@ 2] = global.AlignXo;
	case 3:		_input[@ 3] = global.AlignYo;
	};
return _input;