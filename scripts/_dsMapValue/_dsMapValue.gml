///_dsMapValue(ds_map,value_key,[default_value]);
/// @arg ds_map				#ds_map#		
/// @arg value_key			{string}			
/// @arg [default_value]	#eUpto#		(default: 0)
/*
	<< Returns >>	
*/
#region Arguments & Variables
if argument_count < 2 { show_debug_message("_dsMapValue requires an input and value"); return argument[0] };//[!Break!]
//Arguments
var _ds_map =	argument[0];
var _key =		string(argument[1]);
var _default =	argument_count > 2 ? argument[2] : 0;
//Other Variables
var _output;
#endregion

if ( !_ds_map ) { return _default };

_output = ds_map_find_value(_ds_map, _key);

if ( is_undefined(_output) ) { _output = _default };

return _output;