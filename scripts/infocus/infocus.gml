///infocus();
//Use in events:
//if ( !infocus() ) { return };
///*FocusCheck*/	if ( !infocus() ) { return };	/*FocusCheck*/

//If Focus isn't being tracked on an object, return true
if ( variable_instance_exists(id,"FocusLevel") == false ) { return true }; 

//If Focus is being tracked and is too low for the object, return false
if ( oFocusController.FocusCurrent < FocusLevel ) { return false };

//Otherwise, assume the object is in focus and return true
return true;