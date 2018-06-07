///_baseFont(font);
/// @arg font		#font_id#
#region Arguments & Variables
var font = argument0;
var output;
#endregion

//Save base font for style usage
switch font {
		
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