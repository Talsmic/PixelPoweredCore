///infocus([object]);
/// @arg [object] {integer:ObjectID}	(Defaults to id)
/*
	[PPC][Module:Focus]
	Checks if an object is in focus
*/
var object_id = id;
if ( argument_count > 0 ) { object_id = argument[0] };

//If Focus isn't being tracked on the object, it can be interacted with no 
//matter what, so return true
if ( variable_instance_exists(object_id,"FocusLevel") == false ) { return true }; 

//If Focus is being tracked and is too low for the object, return false, it 
//can't be interacted with
if ( oFocusController.FocusCurrent < object_id.FocusLevel ) { return false };

//Otherwise, assume the object is in focus and return true
return true;

/*=[Notes]======================================================================
	-	This event only includes parameters so you can check if other objects 
		are in focus, for most cases, leave it blank.
	-	For general use in events:
			if ( !infocus() ) { return }; //Focus Check
		This will cancel any event if an object is out of focus.