///_asArrayOf(input,default);
/// @arg input		{any}
/// @arg default	{array}		
/*
	<< Returns >>	{array_1d}
*/ 
#region Arguments & Variables
var _input =		is_array(argument0) ? argument0 : [argument0];
var _default =		argument1;
var _length =		array_length_1d(_default);
var _input_length =	array_length_1d(_input);
#endregion

if ( _input_length == _length ) return _input;//Array is already perfect[!Break!]
	
var output = _default;

//Add [input]'s values to [output]
for ( var i=0 ; i<_input_length ; ++i ) {
	
	if ( i >= _length ) break;
	output[i] = _input[i];
	
	};

return output;