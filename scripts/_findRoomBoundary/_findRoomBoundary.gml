///_findRoomBoundary([left_offset],[top_offset],[right_offset],[bottom_offset]);
/// @arg [left_offset]		{integer}	(default: 0)
/// @arg [top_offset]		{integer}	(default: 0)
/// @arg [right_offset]		{integer}	(default: 0)
/// @arg [bottom_offset]	{integer}	(default: 0)
#region Arguments & Variables
//Arguments
var _offsets;
_offsets[0] =	argument_count > 0 ? -argument[0] : 0;
_offsets[1] =	argument_count > 1 ? -argument[1] : 0;
_offsets[2] =	argument_count > 2 ? -argument[2] : 0;
_offsets[3] =	argument_count > 3 ? -argument[3] : 0;
#endregion

return _alterRegion(_roomRegion(), _offsets);
