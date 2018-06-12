///_inFocus([instance]);
/// @arg instance	#instance_id#	(default: self)
/*
	<< Returns >> {boolean}
	Checks if an object is in focus
*/
#region Arguments
var _instance =	argument_count > 0 ? argument[0] : self;
#endregion

//Get the object's focus level
if ( _objv("focus_level", -1, _instance) = -1 ) { return true };//[!Break!]~~~~~~~~~~~~~~~~~~~~~>
var _focus_level = _objv("focus_level", 0, _instance);

//Compare to global and decide on a result
if ( _focus_level >= global.FocusLevel ) { return true };
return false;