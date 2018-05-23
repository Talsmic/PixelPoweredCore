///array_contains_1d(array,value);
/// @arg array	{array}	
/// @arg value	{any}
#region Arguments
var array = argument0;
var value = argument1;
#endregion

for ( var i=0 ; i<array_length_1d(array) ; i++ ) {
    if array[i] == value { return i };
	};

return false;