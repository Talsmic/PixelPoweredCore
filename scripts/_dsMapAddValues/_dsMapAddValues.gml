///_dsMapAddValues(ds_map,key|value_array);
/// @arg ds_map				#ds_map#	
/// @arg [key|value_array]	{array}				
/*
	<< Returns >>	
	!Always make sure [key|value_array] goes ["KeyNameA", valueA, ["KeyNameB", valueB, ..]!
	This edits the original dsMap, you don't need to return it
*/
#region Arguments & Variables & Variables
//Arguments
var _dsMap =	argument0;
var _array =	argument1;
#endregion

//Add values
for ( var i=0 ; i < array_length_1d(_array) ; i+=2 ) {
	if ( i+1 < array_length_1d(_array) ) { _dsMap[? _array[i]] = _arrayValue(_array, i+1, eUpto.loop) } else { _dsMap[? _array[i]] = 0 };
	};

//Return the dsMap
return _dsMap;