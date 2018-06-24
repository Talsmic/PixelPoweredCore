//_magicY(y, [y_align]);
/// @arg y			{real}
/// @arg [y_align]	{real}
var _y =		argument[0];
var _align =	argument_count > 1 ? argument[1] : global.AlignY;

//Font Magic Numbers
switch ( _baseFont(global.Font) ) {
	case ft_Pixis05: 		var _magic = [ 0, 2, 2 ];	break;
	case ft_Pixis06: 		var _magic = [ 0, 1, 1 ];	break;
	case ft_Pixis07: 		var _magic = [-3, 0, 1 ];	break;
	case ft_enCapsulate:	var _magic = [-2, 0, 1 ];	break;
	case ft_Grandular: 		var _magic = [-2, 0, 2 ];	break;
	default:				var _magic = [ 0, 0, 0 ];
	};

//Style Corrections
if ( global.Font = ft_Pixis07_Bold )	{ _magic[2]++ };
if ( global.Font = ft_Pixis07_Italics )	{ _magic[2]++ };


//Normal Alignment
switch ( _align ) { 
	default:
	case fa_top:				
		_y += _magic[0];	
		break;
	case fa_middle:				
		_y += _magic[1];	
		break; 
	case fa_bottom:					
		_y += _magic[2];							
		break; 
	};
	
return _y;