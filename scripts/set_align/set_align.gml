///set_align([align_x],[align_y]);
/// @arg [align_x] {fa_left OR fa_center or fa_right} (default: fa_left)
/// @arg [align_y] {fa_top OR fa_middle or fa_bottom} (default: fa_top)
/*
	>>Pushes to global.AlignX & global.AlignY
	It's impossible to track alignment without storing the alignment to a 
	variable yourself, so this function is meant to replace 
	draw_set_valign() and draw_set_halign();
*/
#region Arguments
var align_x = argument_count > 0 ? argument[0] : fa_left;
var align_y = argument_count > 1 ? argument[1] : fa_top;
#endregion

switch align_x {
	
	default:
	case fa_left:			draw_set_halign(fa_left);	global.AlignX = fa_left;	break;
	case fa_center:			draw_set_halign(fa_center); global.AlignX = fa_center;	break;
	case fa_right:			draw_set_halign(fa_right);	global.AlignX = fa_right;	break;
	
	case fa_topleft:		draw_set_halign(fa_left);	global.AlignX = fa_left;	
							draw_set_valign(fa_top);	global.AlignY = fa_top;		
							return [global.AlignX,global.AlignY];
	case fa_topcenter:		draw_set_halign(fa_center);	global.AlignX = fa_center;	
							draw_set_valign(fa_top);	global.AlignY = fa_top;		
							return [global.AlignX,global.AlignY];
	case fa_topright:		draw_set_halign(fa_left);	global.AlignX = fa_left;	
							draw_set_valign(fa_top);	global.AlignY = fa_top;		
							return [global.AlignX,global.AlignY];
	case fa_middleleft:		draw_set_halign(fa_left);	global.AlignX = fa_left;	
							draw_set_valign(fa_middle);	global.AlignY = fa_middle;		
							return [global.AlignX,global.AlignY];
	case fa_truecenter:		draw_set_halign(fa_center);	global.AlignX = fa_center;	
							draw_set_valign(fa_middle);	global.AlignY = fa_middle;		
							return [global.AlignX,global.AlignY];
	case fa_middleright:	draw_set_halign(fa_right);	global.AlignX = fa_right;	
							draw_set_valign(fa_middle);	global.AlignY = fa_middle;		
							return [global.AlignX,global.AlignY];
	case fa_bottomleft:		draw_set_halign(fa_left);	global.AlignX = fa_left;	
							draw_set_valign(fa_bottom);	global.AlignY = fa_bottom;		
							return [global.AlignX,global.AlignY];
	case fa_bottomcenter:	draw_set_halign(fa_center);	global.AlignX = fa_center;	
							draw_set_valign(fa_bottom);	global.AlignY = fa_bottom;		
							return [global.AlignX,global.AlignY];
	case fa_bottomright:	draw_set_halign(fa_right);	global.AlignX = fa_right;	
							draw_set_valign(fa_bottom);	global.AlignY = fa_bottom;		
							return [global.AlignX,global.AlignY];
							
	};
	
switch align_y {
	
	default:
	case fa_top:			draw_set_valign(fa_top);	global.AlignY = fa_top;		break;
	case fa_middle:			draw_set_valign(fa_middle); global.AlignY = fa_middle;	break;
	case fa_bottom:			draw_set_valign(fa_bottom);	global.AlignY = fa_bottom;	break;
	
	case fa_topleft:		draw_set_halign(fa_left);	global.AlignX = fa_left;	
							draw_set_valign(fa_top);	global.AlignY = fa_top;		
							return [global.AlignX,global.AlignY];
	case fa_topcenter:		draw_set_halign(fa_center);	global.AlignX = fa_center;	
							draw_set_valign(fa_top);	global.AlignY = fa_top;		
							return [global.AlignX,global.AlignY];
	case fa_topright:		draw_set_halign(fa_left);	global.AlignX = fa_left;	
							draw_set_valign(fa_top);	global.AlignY = fa_top;		
							return [global.AlignX,global.AlignY];
	case fa_middleleft:		draw_set_halign(fa_left);	global.AlignX = fa_left;	
							draw_set_valign(fa_middle);	global.AlignY = fa_middle;		
							return [global.AlignX,global.AlignY];
	case fa_truecenter:		draw_set_halign(fa_center);	global.AlignX = fa_center;	
							draw_set_valign(fa_middle);	global.AlignY = fa_middle;		
							return [global.AlignX,global.AlignY];
	case fa_middleright:	draw_set_halign(fa_right);	global.AlignX = fa_right;	
							draw_set_valign(fa_middle);	global.AlignY = fa_middle;		
							return [global.AlignX,global.AlignY];
	case fa_bottomleft:		draw_set_halign(fa_left);	global.AlignX = fa_left;	
							draw_set_valign(fa_bottom);	global.AlignY = fa_bottom;		
							return [global.AlignX,global.AlignY];
	case fa_bottomcenter:	draw_set_halign(fa_center);	global.AlignX = fa_center;	
							draw_set_valign(fa_bottom);	global.AlignY = fa_bottom;		
							return [global.AlignX,global.AlignY];
	case fa_bottomright:	draw_set_halign(fa_right);	global.AlignX = fa_right;	
							draw_set_valign(fa_bottom);	global.AlignY = fa_bottom;		
							return [global.AlignX,global.AlignY];
							
	};
	
return [global.AlignX,global.AlignY];
