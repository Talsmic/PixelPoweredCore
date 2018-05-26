///objv("var_name",[default_value],[instance]);
/// @arg var_name			{string}			
/// @arg [default_value]	{any}			(default: 0)
/// @arg [instance]			{instance_id}	(default: id)
/*
	<< Returns >> {any}
	A slight variant on variable_instance_exists()
*/ 
#region Arguments
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var var_name =		argument[0];
var default_value =	argument_count > 1 ? argument[1] : 0;
var instance =		argument_count > 2 ? argument[2] : id;
#endregion

var local_v = has_objv(var_name,instance) ? variable_instance_get(instance, var_name) : default_value;

return local_v;
