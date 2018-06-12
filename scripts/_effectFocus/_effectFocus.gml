///_effectFocus([focus_level]);
/// @arg [focus_level]	{integer|1-10}	(default: 0)
/*
	Contributes to the calculation of the next global.FocusLevel
*/

if ( !instance_exists(_focusController) ) exit;//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>
if ( !_objv("isFocusSetter", true) ) exit;//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>

#region Arguments
//Defaults < InstanceVariables < Parameters
var _focus_level =	argument_count > 0 ? argument[0] : _objv("focus_level", 0);
#endregion

//Check and change focus level
if ( _focus_level > _focusController.NextFocus ) { _focusController.NextFocus = _focus_level; return true };
return false;