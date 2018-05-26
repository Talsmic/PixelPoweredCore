///set_font_style([style],[font]);
/// @arg [style]	#eFontStyle#		(default: eFontStyle.normal)
/// @arg [font]		#font_id#			(default: global.Font)
#region Arguments
var style =	argument_count > 0 ? argument[0] : eFontStyle.normal;
var font =	argument_count > 1 ? argument[1] : global.Font;
#endregion

var basefont = get_base_font(font);

switch basefont  {
	
	case ft_EvoTooltip_6: 	
		switch style {
			default:
			case eFontStyle.normal:		font = ft_EvoTooltip_6; break;
			case eFontStyle.strong:
			case eFontStyle.bold:		font = ft_EvoTooltip_6_Bold; break;
			case eFontStyle.condensed:	font = ft_EvoTooltip_6_Condensed; break;
			case eFontStyle.squished:	font = ft_EvoTooltip_6_Squished; break;
			};
		break;
	
	default:	font = basefont; break;
	
	};	
	
global.Font = font;
global.BaseFont = basefont;

draw_set_font(font);

return font;