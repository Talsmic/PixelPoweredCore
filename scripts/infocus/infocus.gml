///infocus([object]);
/// @arg [object] {ObjectID}	(default: id)
/*
	[PixelPowered Module: Focus]
	<< Returns >> {boolean}
	Checks if an object is in focus
*/
if !instance_exists(FocusController) return true;//[!Break!]~~~~~~~~~~~~~~~~~~>
if !FocusController.Setting_ManageFocus return true;//[!Break!]~~~~~~~~~~~~~~~>
#region Arguments
var object_id =	argument_count > 0 ? argument[0] : id;
#endregion

//If Focus isn't being tracked on the object, it can be interacted with no 
//matter what, so return true
if !has_objv("foc_FocusLevel",object_id) return true;//[!Break!]~~~~~~~~~~~~~~~~~~>

//If Focus is being tracked and is too low for the object, return false, it 
//can't be interacted with
if ( FocusController.Focus_Current < object_id.foc_FocusLevel ) return false;
return true;

/*=[Notes]======================================================================
	-	This event only includes parameters so you can check if other objects 
		are in focus, for most cases, leave it blank.
	-	For general use in events:
			if ( !infocus() ) { return }; //Focus Check
		This will cancel any event if an object is out of focus.
