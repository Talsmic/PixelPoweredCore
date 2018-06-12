///debug_region({region_array},[colour],[alpha],[outline]);
/// @arg region_array	#region#
/// @arg [colour]	#c_code#			
/// @arg [alpha]	{real|0..1}			
/// @arg [outline]	{boolean+}		
/*
	[[ Draws ]] a rectangle at [x],[y] of [width] and [height]
	Optionally, of [colour], [alpha] and [rotation]
	[outline] 0: flat colour fill, 1+: outline of [outline] thickness
*/
#region Arguments & Variables
var _region =	_validateRegion(argument[0]);
var _colour =	argument_count > 1 ? argument[1] : c_orange;
var _alpha =	argument_count > 2 ? argument[2] : 0.5;
var _outline =	argument_count > 3 ? argument[3] : 2;
#endregion

//Draw the plane
drawPlane(_region[aR.x1], _region[aR.y1], _region[aR.w], _region[aR.h], _colour, _alpha, _outline);