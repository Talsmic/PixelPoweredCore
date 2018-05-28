///_validate(input,[datatype]);
/// @arg input				{any}
/// @arg [datatype]			#eDataType#		
/*
	<< Returns >>	{any}
	_validate makes sure the provided input is the datatype you require and returns the default value
	if _validated was provided
	Useful for validating arguments
*/ 
#region Arguments
enum eDataType { 
	_any, _string, _real, _integer, _boolean, _array, _array1d, _array2d };
if argument_count < 1 { show_debug_message("_arg requires an input"); exit };//[!Break!]~~~~~~~~~~~>
var input =				argument[0];
var required_datatype =	argument_count > 1 ? argument[1] : 0;
#endregion

if ( argument_count > 1 ) {
	switch ( required_datatype ) {
		
		case eDataType._array: 
		case eDataType._array1d: 
		case eDataType._array2d: 
			if ( is_array(input) ) { return input } else { return [input] };
			
		case eDataType._boolean:
			if ( real(input) == true ) { return true } else { return false };			
			
		case  eDataType._string: 
			return string(input);
			
		case  eDataType._real: 
			return real(input);
				
		case  eDataType._integer: 
			return round(real(input));	
			
		};
	};
	
return input;