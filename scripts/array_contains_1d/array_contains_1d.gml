///array_contains_1d(array,value);
/// @arg array
/// @arg value
var array = argument0;
var value = argument1;

for ( var i=0 ; i<array_length_1d(array); i++ ) {
    if ( array[i] == value ) { return true };
	};

return false;