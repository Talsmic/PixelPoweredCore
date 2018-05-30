///debug_region({region_array});
/// @arg region_array	#region#
/*
	[[ Draws ]] a rectangle at [x],[y] of [width] and [height]
	Optionally, of [colour], [alpha] and [rotation]
	[outline] 0: flat colour fill, 1+: outline of [outline] thickness
*/
#region Arguments
var region_array = _validateRegion(argument0);
#endregion

//Draw the plane
_drawPlane(region_array[eR.x1], region_array[eR.y1], region_array[eR.w], region_array[eR.h], c_water, 0.4, 2);