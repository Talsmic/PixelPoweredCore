///_dsMapCreate([key|value_array]);
/// @arg [key|value_array]		{array}			
/*
	<< Returns >>	#ds_map#
	!Always make sure [key|value_array] goes ["KeyNameA", valueA, ["KeyNameB", valueB, ..]!
*/ 
#region Arguments & Variables
//Arguments
var _add_values =	argument_count > 0 ? true : false;
var _array =		argument_count > 0 ?_asArray(argument[0]) : 0;
//Other Variables
var _output;
#endregion

//Create dsMap
_output = ds_map_create();

//Add values
if ( _add_values ) {
	_dsMapAddValues(_output, _array);
	};

//Return the dsMap
return _output;