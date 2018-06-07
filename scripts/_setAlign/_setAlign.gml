///_setAlign([input]); 
/// @arg [input] 	{array}
//		   [	
//			[align_x], 			fa_align	(default: fa_left)
//			[align_y],			fa_align	(default: fa_top)
//			[align_x_offset],	{real}		(default: 0)
//			[align_y_offset]	{real}		(default: 0)
//		   ]
/*
	<< Pushes >>	global.Align
	<< Pushes >>	global.AlignX
	<< Pushes >>	global.AlignY
	<< Pushes >>	global.AlignXo
	<< Pushes >>	global.AlignYo
	<<  Sets  >>	h_align
	<<  Sets  >>	v_align
	<< Returns >>	#align#	{array} [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo];
	Sets the h_align and v_align used for drawing.
	Call with no arguments to reset alignment to the default of fa_left, fa_top
*/
#region Arguments & Variables
var input = argument_count > 0 ? _validateArray(argument[0], 4, 4, [fa_left, fa_top, 0, 0]) : [fa_left, fa_top, 0, 0];
input[1] =	argument_count > 1 ? argument[1] : input[1];
input[2] =	argument_count > 2 ? argument[2] : input[2];
input[3] =	argument_count > 3 ? argument[3] : input[3];
#endregion

switch ( input[0] ) {	
	default:
	case fa_left:			draw_set_halign(fa_left);	global.AlignX = fa_left;	break;
	case fa_center:			draw_set_halign(fa_center); global.AlignX = fa_center;	break;
	case fa_right:			draw_set_halign(fa_right);	global.AlignX = fa_right;	break;							
	};	
	
switch ( input[1] ) {	
	default:
	case fa_top:			draw_set_valign(fa_top);	global.AlignY = fa_top;		break;
	case fa_middle:			draw_set_valign(fa_middle); global.AlignY = fa_middle;	break;
	case fa_bottom:			draw_set_valign(fa_bottom);	global.AlignY = fa_bottom;	break;
	};
	
global.AlignXo = input[2];
global.AlignYo = input[3];

return [ global.AlignX, global.AlignY, global.AlignXo, global.AlignYo ];

/*==[Notes]=========================================================================================
	-	It's impossible to track alignment without storing the alignment to a variable yourself, so 
		this function is meant to replace draw_set_valign() and draw_set_halign();
	-	If you don't have a GeneralController, be aware that the stored globals lose their 
		effectiveness at the start of each draw step as the h_align and v_align reset but the 
		variables don't.