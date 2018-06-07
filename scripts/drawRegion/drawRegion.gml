///drawRegion({region_array},[colour],[alpha],[outline],[rotation]);
/// @arg region_array	#region#
/// @arg [colour]		#c_code#			(default: draw_get_color())
/// @arg [alpha]		{real|0..1}			(default: draw_get_alpha())
/// @arg [outline]		{boolean+}			(default: false) [false, true&thickness]
/// @arg [rotation]		{integer|0..360}	(default: 0)
/// 
/*
	[[ Draws ]] a rectangle at [x],[y] of [width] and [height]
	Optionally, of [colour], [alpha] and [rotation]
	[outline] 0: flat colour fill, 1+: outline of [outline] thickness
*/
#region Arguments & Variables
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var region_array = _validateRegion(argument[0]);
var colour =	argument_count > 1 ? argument[1] : draw_get_color();
var alpha =		argument_count > 2 ? argument[2] : draw_get_alpha();
var outline =	argument_count > 3 ? argument[3] : false;
var rotation =	argument_count > 4 ? argument[4] : 0;
#endregion

//Draw the plane
drawPlane(region_array[aR.x1], region_array[aR.y1], region_array[aR.w], region_array[aR.h], colour, alpha, outline, rotation);