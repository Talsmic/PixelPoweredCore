//_magicDrawPoint(x, y, text, [align_array]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg text			{string}
/// @arg [align_array]	{array}
var _x =		argument[0];
var _y =		argument[1];
var _text =		argument[2];
var _align =	argument_count > 3 ? _alignArray(argument[3]) : global.AlignArray;

var _output = [_x, _y];
var _text_width =  _stringWidth(_text);
var _text_height = _stringHeight(_text);

//Font Magic Numbers
switch ( _baseFont(global.Font) ) {
	case ft_Pixis05: 		var _magic_x = [ 0, 0, 0 ];	var _magic_y = [ 0, 2, 2 ];	break;
	case ft_Pixis06: 		var _magic_x = [ 0, 0, 0 ];	var _magic_y = [ 0, 1, 1 ];	break;
	case ft_Pixis07: 		var _magic_x = [ 0, 0, 0 ];	var _magic_y = [-3, 0, 1 ];	break;
	case ft_enCapsulate:	var _magic_x = [ 0, 0, 0 ];	var _magic_y = [-2, 0, 1 ];	break;
	case ft_Grandular: 		var _magic_x = [ 0, 0, 0 ];	var _magic_y = [-2, 0, 2 ];	break;
	default:				var _magic_x = [ 0, 0, 0 ];	var _magic_y = [ 0, 0, 0 ];
	};

//Style Corrections
if ( global.Font = ft_Pixis07_Bold )	{ _magic_y[2]++ };
if ( global.Font = ft_Pixis07_Italics )	{ _magic_y[2]++ };

#region Normal Alignment
switch ( _align[0] ) { 
	default:
	case fa_left:		
		_output[0] += _align[2];		
		break;
	case fa_center:		
		_output[0] -= (_text_width div 2) - _align[2]; 	
		break; 
	case fa_right:		
		_output[0] -= _text_width + _align[2];									
		break; 
	};
	
switch ( _align[1] ) { 
	default:
	case fa_top:		
		_output[1] += _align[3];										
		break;
	case fa_middle:		
		_output[1] -= (_text_height div 2) - _align[3]; 	
		break; 
	case fa_bottom:		
		_output[1] -= _text_height + _align[3];									
		break; 
	};	
#endregion
	
#region Magic Number Correction
switch ( _align[0] ) { 
	default:
	case fa_left:				
		_output[0] += _magic_x[0];	
		break;
	case fa_center:				
		_output[0] += 1;		//It's always 1 too long
		_output[0] += _magic_x[1];	
		break; 
	case fa_right:					
		_output[0] += 1;		//It's always 1 too long
		_output[0] += _magic_x[2];							
		break; 
	};
	
switch ( _align[1] ) { 
	default:
	case fa_top:							
		_output[1] += _magic_y[0];											
		break;
	case fa_middle:				
		_output[1] += _magic_y[1];	
		break; 
	case fa_bottom:							
		_output[1] += _magic_y[2];		
		break; 
	};	
#endregion

//draw_anchor(_x, _y, c_red);
return _output;