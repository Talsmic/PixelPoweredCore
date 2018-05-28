///_dsMapCreate([key_array],[value_array]);
/// @arg [key_array]		{array}		
/// @arg [value_array]		{array}			
/*
	<< Returns >>	#ds_map#
*/ 
#region Arguments & Variables
//Arguments
var _add_values =	argument_count > 0 ? true : false;
var _key_array =	argument_count > 0 ? _validateArray(argument[0]) : 0;
var _value_array =	argument_count > 1 ? _validateArray(argument[1]) : [0];
var _output;
#endregion

//Create dsMap
_output = ds_map_create();

//Add values
if ( _add_values ) {
	for ( var i=0 ; i < array_length_1d(_key_array) ; i++) {
	    _output[? _key_array[i]] = _arrayValue(_value_array, i, "loop");
		};
	};

//Return the dsMap
return _output