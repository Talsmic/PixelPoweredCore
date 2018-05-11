///focus_set(focus_level,canincrease,candecrease);
/// @arg focus_level
/// @arg can_increase
/// @arg can_decrease
var focus_level = 10;
var can_increase = false;
var can_decrease = true;
if ( variable_instance_exists(id,"FocusLevel") ) { focus_level = FocusLevel };
if ( variable_instance_exists(id,"FocusCanUp") ) { can_increase = FocusCanUp };
if ( variable_instance_exists(id,"FocusCanDown") ) { can_decrease = FocusCanDown };
if ( argument_count > 0 ) { focus_level = argument[0] };
if ( argument_count > 1 ) { can_increase = argument[1] };
if ( argument_count > 2 ) { can_decrease = argument[2] };

if ( focus_level < oFocusController.FocusCheck and can_decrease ) { oFocusController.FocusCheck = focus_level };
if ( focus_level > oFocusController.FocusCheck and can_increase ) { oFocusController.FocusCheck = focus_level };