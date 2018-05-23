///get_base_font(font);
/// @arg font		{font_id}	
#region Arguments
var font = argument0;
var output;
#endregion

//Save base font for style usage
switch font {
	
	case ft_EvoTooltip_6: 	
	case ft_EvoTooltip_6_Bold: 	
	case ft_EvoTooltip_6_Condensed:		
	case ft_EvoTooltip_6_Squished:
		output = ft_EvoTooltip_6;
		break;
	
	default:	output = font; break;
	
	};

return output;