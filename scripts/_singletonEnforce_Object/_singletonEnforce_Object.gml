///_singletonEnforce_Object([object],[count]);
/// @arg object		#object_id#		(default: self)
/// @arg count		{integer}		(default: 1)
/*
	Destroys instances of the object until only 1 remains
*/
#region Arguments
var _object =	argument_count > 0 ? argument[0] : self;
var _count =	argument_count > 1 ? argument[1] : 1;
#endregion

with ( _object ) {
	if ( instance_number( _object.object_index ) > _count ) {
		_destroy(self, false);
		};
	};