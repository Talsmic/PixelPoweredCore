///_arrayContains(array,value);
/// @arg array	{array}	
/// @arg value	{any}
#region Arguments & Variables
var _array = argument0;
var _value = argument1;
//Other Variables
var _array_height = array_height_2d(_array);
#endregion

//1D Array
if ( _array_height == 1 ) {
	
	var _array_length = array_length_1d(_array);	 
	for ( var i=0 ; i<_array_length ; ++i ) { if _array[i] == _value { return true } };
	
	}
	
//2D Array
else if ( _array_height > 1 ) {	
	for ( var i=0 ; i<_array_height ; ++i ) {
	
		var _array_length = array_length_2d(_array, i);		
		for ( var j=0 ; j<_array_length ; ++j ) { if ( _array[i,j] == _value ) { return true } };
		
		};
	};

return false;