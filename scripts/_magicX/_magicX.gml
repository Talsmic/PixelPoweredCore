//_magicX(x);
/// @arg x				{real}
/// @arg [x_align]		{real}
var _x =		argument[0];
var _align =	argument_count > 1 ? argument[1] : global.AlignX;

//Font Magic Numbers
switch ( _baseFont(global.Font) ) {
	case ft_Pixis05: 		var _magic = [ 0, 0, 0 ];	break;
	case ft_Pixis06: 		var _magic = [ 0, 0, 0 ];	break;
	case ft_Pixis07: 		var _magic = [ 0, 0, 0 ];	break;
	case ft_enCapsulate:	var _magic = [ 0, 0, 0 ];	break;
	case ft_Grandular: 		var _magic = [ 0, 0, 0 ];	break;
	default:				var _magic = [ 0, 0, 0 ];
	};
	
//Normal Alignment
switch ( _align ) { 
	default:
	case fa_left:				
		_x += _magic[0];	
		break;
	case fa_center:				
		_x += 1;		//It's always 1 too long
		_x += _magic[1];	
		break; 
	case fa_right:					
		_x += 1;		//It's always 1 too long
		_x += _magic[2];							
		break; 
	};
	
return _x;