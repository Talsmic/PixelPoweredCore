///_smallestOf(input_array);
/// @arg input_array	{array}		
/*
	<< Returns >>	{*}
*/
#region Arguments & Variables & Variables
var _input = argument0;
#endregion

var _output = _input[0];
for ( var i=1 ; i<array_length_1d(_input) ; ++i ) {
	if ( !is_real(_input[i]) ) { continue };
	if ( _input[i] < _output ) { _output = _input[i] };
	}; 
	
return _output;