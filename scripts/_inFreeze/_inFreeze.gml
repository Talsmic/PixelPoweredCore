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
if ( _objv("FreezeIndependant", false, _instance) ) { return true };//[!Break!]~~~~~~~~~~~~~~~~~~~~>
if ( !_objvExists("_FocusLevel", _instance) )	   { return true };//[!Break!]~~~~~~~~~~~~~~~~~~~~~>

//Get the object's focus level
var _focus_level = _objv("FocusLevel", 0, _instance);

//Compare to global and decide on a result
if ( _focus_level >= global.FreezeLevel ) { return true };
return false