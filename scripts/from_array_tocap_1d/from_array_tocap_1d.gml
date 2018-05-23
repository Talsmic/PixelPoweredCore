///from_array_tocap_1d(array,id);
/// @arg array	{array}	
/// @arg id		{integer}
#region Arguments
var array =		argument0;
var value_id =	argument1;
var output = 0;
#endregion

var array_length = array_length_1d(array) ;
if ( array_length > value_id ) { 
	output = array[value_id];
	}
else { 
	output = array[array_length-1];
	};

return output;