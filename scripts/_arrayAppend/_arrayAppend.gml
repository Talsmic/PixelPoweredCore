///_arrayAppend(array1, array2)
/// @arg arrayA					{array}		
/// @arg arrayB					{array}	
#region Arguments & Variables & Variables
var _arrayA =	argument0;
var _arrayB =	argument1;
var _output =	-1;
#endregion

//Neither is an array
if ( !is_array(_arrayA) and !is_array(_arrayB) ) {
	if ( _arrayA == -1 and _arrayB == -1 ) { return -1 }
	else if ( _arrayA == -1 ) { return [_arrayB] }; 
	else if ( _arrayB == -1 ) { return [_arrayA] };
	_output = [_arrayA, _arrayB];
	}
	
//Only A is an array
else if ( is_array(_arrayA) and !is_array(_arrayB) ) {
	if ( _arrayB == -1 ) { return _arrayA };
	_output = _arrayA;
	_output[array_length_1d(_arrayA)] = _arrayB;
	}
	
//Only B is an array
else if ( !is_array(_arrayA) and is_array(_arrayB) ) {
	if ( _arrayA == -1 ) { return _arrayB };
	_output = [_arrayA];
	for( var i=0 ; i<array_length_1d(_arrayB) ; ++i ) {
	    _output[array_length_1d(_output)] = _arrayB[i];
		};
	}
	
//Both Are Arrays
else if ( is_array(_arrayA) and is_array(_arrayB) ) {
	_output = _arrayA;
	for( var i=0 ; i<array_length_1d(_arrayB) ; ++i ) {
	    _output[array_length_1d(_output)] = _arrayB[i];
		};
	};
	
return _output;