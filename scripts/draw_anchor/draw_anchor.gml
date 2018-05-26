///draw_anchor([x],[y],[colour]);
/// @arg [x]		{real}		(default: x)
/// @arg [y]		{real}		(default: y)
/// @arg [colour]	#c_code#	(default: c_red)
#region Arguments
var draw_x =	argument_count > 0 ? argument[0] : x;
var draw_y =	argument_count > 1 ? argument[1] : y;
var colour =	argument_count > 2 ? argument[2] : c_red;
#endregion

draw_plane(draw_x-1,draw_y-1,2,2,colour,1)