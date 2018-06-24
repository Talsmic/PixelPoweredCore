///_arrayOfLength(input,length);
/// @arg input				{any}
/// @arg length				{integer}	
/*
	<< Returns >>	{array_1d}
*/ 
var _input =	argument0;
var _length =	argument1;

//[Check #1] Is it an array? (This is the only time we should create a new array)
if ( !is_array(argument0) ) { return array_create(_length, _input) }; //[!Break!]

//[Check #2] Is it already long enough?
var _input_length =	array_length_1d(_input);
if ( _input_length >= _length ) { return _input }; //[!Break!]
//Increase the length 
_input[@ _length-1] = 0; 
for ( var i=_input_length-1 ; i<_length ; ++i ) {	
	_input[@ i] = _arrayValue(_input, i);	
	};
	
return _input;