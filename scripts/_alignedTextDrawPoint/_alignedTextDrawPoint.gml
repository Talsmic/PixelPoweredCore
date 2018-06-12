//_alignedTextDrawPoint(x, y, text, [align_array]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg text			{string}
/// @arg align_array	{array}
var _x =		argument[0];
var _y =		argument[1];
var _text =		argument[2];
var _align =	argument_count > 3 ? _storeAlign(argument[3]) : [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo];

var _output = [_x, _y];
var _text_width =  _stringWidth(_text);
var _text_height = _stringHeight(_text);

var _magic = [0,0,0, 0,0,0]

//Font Magic Numbers
if ( _baseFont(global.Font) = ft_Pixis05 )		{ _magic = [ 0, 0, 0,    0, 2, 2] }
if ( _baseFont(global.Font) = ft_Pixis06 )		{ _magic = [ 0, 0, 0,    0, 1, 1] }
if ( _baseFont(global.Font) = ft_Pixis07 )		{ _magic = [ 0, 0, 0,   -3, 0, 1] }
if ( _baseFont(global.Font) = ft_enCapsulate )	{ _magic = [ 0, 0, 0,   -2, 0, 1] }
if ( _baseFont(global.Font) = ft_Grandular )	{ _magic = [ 0, 0, 0,   -2, 0, 2] }

//Style Corrections
if ( global.Font = ft_Pixis07_Bold )			{ _magic[5]++;	}
if ( global.Font = ft_Pixis07_Italics )			{ _magic[5]++;	}

//Normal Alignment
switch ( _align[0] ) { 
	default:
	case fa_left:		
		_output[0] += _align[2];		
		break;
	case fa_center:		
		_output[0] -= (_text_width div 2) + (_text_width mod 2) - _align[2]; 	
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
		_output[1] -= (_text_height div 2) + (_text_height mod 2) - _align[3]; 	
		break; 
	case fa_bottom:		
		_output[1] -= _text_height + _align[3];									
		break; 
	};	
	
var _anchor = [_x, _y];
//Magic Number Correction
switch ( _align[0] ) { 
	default:
	case fa_left:				
		_output[0] += _magic[0];	
		break;
	case fa_center:				
		_output[0] += 1;		//It's always 1 too long
		_output[0] += _magic[1];	
		break; 
	case fa_right:					
		_output[0] += 1;		//It's always 1 too long
		_output[0] += _magic[2];							
		break; 
	};
	
switch ( _align[1] ) { 
	default:
	case fa_top:							
		_output[1] += _magic[3];											
		break;
	case fa_middle:				
		_output[1] += _magic[4];	
		break; 
	case fa_bottom:							
		_output[1] += _magic[5];		
		break; 
	};	

//draw_anchor(_anchor[0], _anchor[1], c_red);
return _output;