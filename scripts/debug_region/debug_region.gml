///debug_region({region_array});
/// @arg region_array	#region#
/*
	[[ Draws ]] a rectangle at [x],[y] of [width] and [height]
	Optionally, of [colour], [alpha] and [rotation]
	[outline] 0: flat colour fill, 1+: outline of [outline] thickness
*/
#region Arguments & Variables
var region_array = _validateRegion(argument0);
#endregion

//Draw the plane
drawPlane(region_array[aR.x1], region_array[aR.y1], region_array[aR.w], region_array[aR.h], c_water, 0.4, 2);