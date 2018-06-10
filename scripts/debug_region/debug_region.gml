///debug_region({region_array});
/// @arg region_array	#region#
/*
	[[ Draws ]] a rectangle at [x],[y] of [width] and [height]
	Optionally, of [colour], [alpha] and [rotation]
	[outline] 0: flat colour fill, 1+: outline of [outline] thickness
*/
#region Arguments & Variables
var _region =	_validateRegion(argument0);
#endregion

//Draw the plane
drawPlane(_region[aR.x1], _region[aR.y1], _region[aR.w], _region[aR.h], c_water, 0.4, 2);