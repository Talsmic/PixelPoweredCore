///_singletonEnforce_Instance([instance]);
/// @arg instance	#instance_id#	(default: self)
/*
	Destroys the instance if it is not the only instance of the object.
	In this way, you can make sure an object is the only object of it's type at any time.
*/
#region Arguments
var _instance =	argument_count > 0 ? argument[0] : self;
#endregion

if ( instance_number( _instance.object_index ) > 1 ) {
	_destroy(self, false);
	}