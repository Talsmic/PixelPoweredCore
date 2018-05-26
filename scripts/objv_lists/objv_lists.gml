///objv_lists([instance]);
/// @arg [instance]			{instance_id}	(default: id)
/*
	<< Returns >> {2d array}
	>> Stores << sorted lists
	Populates lists with all the variables in the instance, sorted in to 
	groups based on name [BuiltIn][Alarms] [Core][Settings][Other]
*/ 
#region Arguments
var instance = argument_count > 0 ? argument[0] : id;
#endregion

//Create Lists
var unsorted_list = variable_instance_get_names(instance);
var list_builtin = [0];
var list_alarms = [0];
var list_core = [0];
var list_settings = [0];
var list_other = [0];
var complete_list = [0];

return complete_list;
