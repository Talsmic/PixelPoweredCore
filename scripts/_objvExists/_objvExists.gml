///_objvExists("var_name",[instance]);
/// @arg var_name			{string}			
/// @arg [instance]			{instance_id}	(default: id)
/*
	<< Returns >> {boolean}
	A slight variant on variable_instance_exists()
*/ 
#region Arguments & Variables
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var var_name =		argument[0];
var instance =		argument_count > 1 ? argument[1] : id;
#endregion

return variable_instance_exists(instance, var_name);

