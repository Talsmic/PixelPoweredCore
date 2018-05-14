///alterfocus(focus_level,canincrease,candecrease);
/// @arg focus_level
/// @arg can_increase
/// @arg can_decrease
/*
	[PPC][Module:Focus]
	Alters the currently being checked Focus Level based on this object's value
*/
//Variable defaults
var focus_level = 10;
var can_increase = false;
var can_decrease = true;

//Check for object stored variables
if ( variable_instance_exists(id,"FocusLevel") ) { focus_level = FocusLevel };
if ( variable_instance_exists(id,"FocusCanUp") ) { can_increase = FocusCanUp };
if ( variable_instance_exists(id,"FocusCanDown") ) { can_decrease = FocusCanDown };

//Parameters overrule stored values
if ( argument_count > 0 ) { focus_level = argument[0] };
if ( argument_count > 1 ) { can_increase = argument[1] };
if ( argument_count > 2 ) { can_decrease = argument[2] };

//Check and change focus level
if ( focus_level < oFocusController.FocusCheck and can_decrease ) { oFocusController.FocusCheck = focus_level };
if ( focus_level > oFocusController.FocusCheck and can_increase ) { oFocusController.FocusCheck = focus_level };

/*=[Notes]======================================================================
	-	This script doesn't require parameters, they only exist for if you want 
		to override an object's default behaviour.
	-	By default, any object can increase decrease focus, but can't increase 
		focus. Giving an oject the variables FocusCanUp or FocusCanDown lets 
		you change these behaviours.