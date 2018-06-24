//_alignedPoint_Text(x, y, text, [align_array]);
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

//Normal Alignment
switch ( _align[0] ) { 
	default:
	case fa_left:		
		_output[0] += _align[2];		
		break;
	case fa_center:		
		_output[0] -= (_text_width div 2) + (_text_width mod 2) - _align[2] - 1; 	
		break; 
	case fa_right:		
		_output[0] -= _text_width + _align[2] - 1;									
		break; 
	};
	
switch ( _align[1] ) { 
	default:
	case fa_top:		
		_output[1] += _align[3];										
		break;
	case fa_middle:		
		_output[1] -= (_text_height div 2) + (_text_height mod 2) - _align[3]; 	
		break; 
	case fa_bottom:		
		_output[1] -= _text_height + _align[3];									
		break; 
	};	

//draw_anchor(_x, _y, c_red);
return _output;