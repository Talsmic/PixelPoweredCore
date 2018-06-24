///_baseFont(font);
/// @arg font		#font_id#
#region Arguments & Variables
var font = argument0;
var output;
#endregion

//Save base font for style usage
switch font {
		
	case ft_enCapsulate:
		output = ft_enCapsulate;
		break;
		
	case ft_Grandular:
		output = ft_Grandular;
		break;
		
	case ft_Pixis05:
		output = ft_Pixis05;
		break;
		
	case ft_Pixis06:
		output = ft_Pixis06;
		break;
		
	case ft_Pixis07: 	
	case ft_Pixis07_Bold: 	
	case ft_Pixis07_Condensed:		
	case ft_Pixis07_Squished:
	case ft_Pixis07_Italics:
		output = ft_Pixis07;
		break;
	
	
	
	default:	output = font; break;
	
	};

return output;