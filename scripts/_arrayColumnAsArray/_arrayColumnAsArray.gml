///_arrayColumnAsArray(input_array,column,[first_value],[last_value]);
/// @arg input			{array}		
/// @arg column			{integer}			
/// @arg [first_value]	{integer}	
/// @arg [last_value]	{integer}
#region Arguments & Variables
var _array =		argument[0];
var _column =		argument[1];
var _first_value =	argument_count > 2 ? argument[2] : 0;
var _last_value =	argument_count > 3 ? argument[3] : -1;
//Other Variables
var _array_height = array_height_2d(_array);
var c = 0;
var _output = [0];
var _array_length;
#endregion

//1D Array
if ( _array_height == 1 ) {
	
	//Check Length
	var _array_length = array_length_1d(_array);	 
	
	if ( _column > _array_length-1 ) { return [0] };
	
	_output = [_array[_column]]
	
	}
	
//2D Array
else if ( _array_height > 1 ) {	
	
	if ( _last_value == -1 ) { _last_value = _array_height };
	var _total_values = _last_value - _first_value;
	if ( _total_values < 0 ) { return [0] };
	
	//Loop through
	for ( var i=_first_value ; i<=_last_value ; ++i ) { 
		//Check Length
		var _array_length = array_length_2d(_array, i);	 		
		_output[c] = i < _array_length ? _array[i, _column] : 0;
		c++;
		};
		
	};

return _output;