///_setFontStyle([style],[font]);
/// @arg [style]	#eFontStyle#		(default: eFontStyle.normal)
/// @arg [font]		#font_id#			(default: global.Font)
#region Special Enumerator: #eFontStyle# 
enum eFontStyle {
	normal, bold, strong, thin, italic, condensed, squished };		
#endregion
#region Arguments & Variables
var style =	argument_count > 0 ? argument[0] : eFontStyle.normal;
var font =	argument_count > 1 ? ( argument[1] != -1 ? argument[1] : global.Font ) : global.Font;

#endregion

var basefont = _baseFont(font);

switch basefont  {
		
	case ft_Pixis07: 	
		switch style {
			default:
			case eFontStyle.normal:		font = ft_Pixis07; break;
			case eFontStyle.strong:
			case eFontStyle.bold:		font = ft_Pixis07_Bold; break;
			case eFontStyle.condensed:	font = ft_Pixis07_Condensed; break;
			case eFontStyle.squished:	font = ft_Pixis07_Squished; break;
			case eFontStyle.italic:		font = ft_Pixis07_Italics; break;
			};
		break;
	
	default:	font = basefont; break;
	
	};	
	
global.Font = font;
global.BaseFont = basefont;

draw_set_font(font);

return font;