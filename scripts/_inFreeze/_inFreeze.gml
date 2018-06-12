///_inFreeze([instance]);
/// @arg instance	#instance_id#	(default: self)
/*
	<< Returns >> {boolean}
	Checks if an object is in focus
*/
#region Arguments
var _instance =	argument_count > 0 ? argument[0] : self;
#endregion

//If the object is "FocusIndependant" or has no Focus Level, this always returns true
if ( !_objv("freezable", false, _instance) ) { return false };//[!Break!]~~~~~~~~~~~~~~~~~~~~>

//Get the object's focus level
if ( _objv("focus_level", -1, _instance) = -1 ) { return false };//[!Break!]~~~~~~~~~~~~~~~~~~~~~>
var _focus_level = _objv("focus_level", 0, _instance);

//Compare to global and decide on a result
if ( _focus_level >= global.FreezeLevel ) { return false };
return true;