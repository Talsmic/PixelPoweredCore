///array_contains_2d(array,value);
/// @arg array	{array}	
/// @arg value	{any}
#region Arguments
var array = argument0;
var value = argument1;
#endregion

for ( var i=0 ; i<array_height_2d(array) ; i++ ) {
	for ( var j=0 ; j<array_length_2d(array,i) ; i++ ) {
		if ( array[i,j] == value ) { return true };
		};
	};

return false;