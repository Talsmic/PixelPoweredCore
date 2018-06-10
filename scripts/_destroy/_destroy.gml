///_destroy([instance],[execute_destroy_event])
/// @arg instance	#instance_id#	(default: self)
/*
	Just a quick instance_destroy variant that makes sure instance_destroy always occurs in the target
*/
#region Arguments
var _instance =	argument_count > 0 ? argument[0] : self;
var _event =	argument_count > 1 ? argument[1] : false;
#endregion

with ( _instance ) {
	instance_destroy(self, _event);
	}