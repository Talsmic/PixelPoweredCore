///_alterRegion(region_array,[growth_array],[move_array],[flip_dimensions]);
/// @arg region_array	#region#
/// @arg [growth_array]		{array} [LEFT,UP,DOWN,RIGHT]
/// @arg [move_array]		{array} [RIGHT,DOWN]
/// @arg [flip_dimensions]	{boolean}
/*
	<< Returns >> #region#
	Expands the region by [growth_array]
	Moves the region by [move_array]
*/
#region Arguments & Variables
if argument_count < 1 { show_debug_message("_alignRegion requires a region"); exit };//[!Break!]~~~>
var _region =			_validateRegion(argument[0]);
var _growth =			argument_count > 1 ? argument[1] : -1;
var _movement =			argument_count > 2 ? argument[2] : -1;
var flip_dimensions =	argument_count > 3 ? argument[3] : false;
#endregion

//Growth
if ( _growth != -1 ) {
	switch ( array_length_1d(_growth) ) {
		default:
		case 4:		_region[@ aR.y2] += _growth[3];
					_region[@ aR.h]  += _growth[3];
		case 3:		_region[@ aR.x2] += _growth[2];
					_region[@ aR.w]  += _growth[2];
		case 2:		_region[@ aR.y1] -= _growth[1];
					_region[@ aR.h]  += _growth[1];
		case 1:		_region[@ aR.x1] -= _growth[0];
					_region[@ aR.w]  += _growth[0];
		case 0:
		};
	};
	
//Movement
if ( _movement != -1 ) {
	switch ( array_length_1d(_movement) ) {
		default:
		case 2:		_region[@ aR.x1] += _movement[0];
					_region[@ aR.x2] += _movement[0];
					_region[@ aR.y1] += _movement[1];
					_region[@ aR.y2] += _movement[1];
					break;
		case 1:		_region[@ aR.x1] += _movement[0];
					_region[@ aR.x2] += _movement[0];
					_region[@ aR.y1] += _movement[0];
					_region[@ aR.y2] += _movement[0];
					break;
		};
	};

//Flip Dimensions
if ( flip_dimensions ) {
	//_region= _regionBySize(_region[aR.x1], _region[aR.y1], _region[aR.h], _region[aR.w]);
	};
	
return _region;