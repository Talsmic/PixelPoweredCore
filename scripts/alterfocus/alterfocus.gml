///alterfocus([focus_layer],[canincrease],[candecrease]);
/// @arg [focus_layer]	{integer|1-10}	(default: 10)
/// @arg [can_increase] {boolean}		(default: false)
/// @arg [can_decrease] {boolean}		(default: true)
/*
	[PixelPowered Module: Focus]
	Alters the currently being checked Focus Level based on this object's value
*/
if !instance_exists(oFocusController) exit;//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
if !oFocusController.Setting_ManageFocus exit;//[!Break!]~~~~~~~~~~~~~~~~~~~~~~>
#region Arguments
//Defaults < InstanceVariables < Parameters
var focus_layer =	argument_count > 0 ? argument[0] : objv("Layer_Focus",oFocusController.Setting_Focus_Floor);
var can_increase =	argument_count > 1 ? argument[1] : objv("FocusFixer",false);
var can_decrease =	argument_count > 2 ? argument[2] : objv("FocusSetter",true);
#endregion

//Check and change focus level
if ( focus_layer < oFocusController.Focus_NextStep and can_decrease ) { oFocusController.Focus_NextStep = focus_layer; return true };
if ( focus_layer > oFocusController.Focus_NextStep and can_increase ) { oFocusController.Focus_NextStep = focus_layer; return true };
return false;

/*=[Notes]======================================================================
	-	This script doesn't require parameters, they only exist for if you want 
		to override an object's default behaviour.
	-	By default, any object can increase decrease focus, but can't increase 
		focus. Giving an oject the variables FocusFixer or FocusSetter lets 
		you change these behaviours.