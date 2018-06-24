///_setAlign([align_x],[align_y],[x_offset],[y_offset]); 
/// @arg [align_x] 		{array or fa_}
/// @arg [align_y] 		{fa_}
/// @arg [x_offset] 	{integer}
/// @arg [y_offset] 	{integer}
/*
	<< Pushes >>	global.Align
	<< Pushes >>	global.AlignX
	<< Pushes >>	global.AlignY
	<< Pushes >>	global.AlignXo
	<< Pushes >>	global.AlignYo
	<< Pushes >>	global.AlignArray
	<<  Sets  >>	h_align
	<<  Sets  >>	v_align
	<< Returns >>	global.AlignArray
	Sets the h_align and v_align used for drawing.
	Call with no arguments to reset alignment to the default of fa_left, fa_top
*/
#region Arguments & Variables
var _align_x =  0;
var _align_y =  0;
var _offset_x = 0;
var _offset_y = 0;
//argument[0] can be an array so this splits that if it is
if ( argument_count > 0 ) {
	var _inputA = argument[0];
	if ( is_array(_inputA) ) {
		switch ( array_length_1d(_inputA) ) {
			default:
			case 4:		_offset_y = _inputA[3];
			case 3:		_offset_x = _inputA[2];
			case 2:		_align_y =  _inputA[1];
			case 1:		_align_x =  _inputA[0];
			};
		} else {		_align_x =  _inputA };
	};
//The other arguments
switch ( argument_count ) { 
	default:
	case 4:		_offset_y = argument[3];
	case 3:		_offset_x = argument[2];
	case 2:		_align_y =  argument[1];
	case 1: case 0:
	};
#endregion

//Change X alignment
switch ( _align_x ) {	
	default:
	case fa_left:			draw_set_halign(fa_left);		global.AlignX = fa_left;		break;
	case fa_center:			draw_set_halign(fa_center);		global.AlignX = fa_center;		break;
	case fa_right:			draw_set_halign(fa_right);		global.AlignX = fa_right;		break;							
	};	
	
//Change Y alignment	
switch ( _align_y ) {	
	default:
	case fa_top:			draw_set_valign(fa_top);		global.AlignY = fa_top;			break;
	case fa_middle:			draw_set_valign(fa_middle);		global.AlignY = fa_middle;		break;
	case fa_bottom:			draw_set_valign(fa_bottom);		global.AlignY = fa_bottom;		break;
	};
	
//Change offset
global.AlignXo = _offset_x;
global.AlignYo = _offset_y;

//Update Array
global.AlignArray[0] = global.AlignX;
global.AlignArray[1] = global.AlignY;
global.AlignArray[2] = global.AlignXo;
global.AlignArray[3] = global.AlignYo;
return global.AlignArray;

/*==[Notes]=========================================================================================
	-	It's impossible to track alignment without storing the alignment to a variable yourself, so 
		this function is meant to replace draw_set_valign() and draw_set_halign();
	-	If you don't have a GeneralController, be aware that the stored globals lose their 
		effectiveness at the start of each draw step as the h_align and v_align reset but the 
		variables don't.