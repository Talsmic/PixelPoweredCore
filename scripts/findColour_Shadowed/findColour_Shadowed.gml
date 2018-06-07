///findColour_Shadowed(colour);
/// @arg colour	#c_code#
#region Arguments & Variables
var colour = string(argument0);
//Sanitise Input
colour = string_replace_all(colour, "c_", "");
colour = string_replace_all(colour, "_dark", "");
colour = string_replace_all(colour, "_light", "");
colour = string_lettersdigits(colour);
colour = string_lower(colour);
#endregion

switch (colour) {
	
	default: 
	case "white":	case "16777215":	return c_gray12;
	case "black":	case "0":			return c_black; 
	
	#region Shades	
	case "gray1":	return c_black; 
	case "gray2":	return c_black; 
	case "gray3":	return c_gray1; 
	case "gray4":	return c_gray2; 
	case "gray5":	return c_gray3; 
	case "gray6":	return c_gray4; 
	case "gray7":	return c_gray5; 
	case "gray8":	return c_gray6; 
	case "gray9":	return c_gray7; 
	case "gray10":	return c_gray8; 
	case "gray11":	return c_gray9; 
	case "gray12":	return c_gray10; 
	case "gray13":	return c_gray11; 
	
	case "gray":	case "8421504":		return merge_colour(c_gray, c_black, 0.2); 
	case "dkgray":	case "4210752":		return merge_colour(c_dkgray, c_black, 0.2); 
	case "silver":	
	case "ltgray":	case "12632256":	return merge_colour(c_ltgray, c_black, 0.2); 
	#endregion
		
	#region Basic Colours
    case "aqua":	case "16776960":	return merge_colour(c_aqua, c_black, 0.2);
    case "blue":	case "16711680":	return merge_colour(c_blue, c_black, 0.2);
    case "fuchsia":	case "16711935":	return merge_colour(c_fuchsia, c_black, 0.2);
    case "teal":	case "8421376":		return merge_colour(c_teal, c_black, 0.2);
    case "purple":	case "8388736":		return merge_colour(c_purple, c_black, 0.2);
    case "navy":	case "8388608":		return merge_colour(c_navy, c_black, 0.2);
    case "orange":	case "4235519":		return merge_colour(c_orange, c_black, 0.2);
    case "yellow":	case "65535":		return merge_colour(c_yellow, c_black, 0.2);
    case "lime":	case "65280":		return merge_colour(c_lime, c_black, 0.2);
    case "green":	case "32768":		return merge_colour(c_green, c_black, 0.2);
    case "olive":	case "32896":		return merge_colour(c_olive, c_black, 0.2);
    case "red":		case "255":			return merge_colour(c_red, c_black, 0.2);
    case "maroon":	case "128":			return merge_colour(c_maroon, c_black, 0.2);
	#endregion
	
/*[Evolutionary Colours]======================================================*/
	#region Elemental
    case "1":	case "physical":	case string(c_physical):		
		return c_physical_shadowed;
    case "2":	case "fire":		case string(c_fire):		
		return c_fire_shadowed;
    case "3":	case "water":		case string(c_water):		case "7":
		return c_water_shadowed;
    case "4":	case "air":			case string(c_air):			case "8":
		return c_air_shadowed;
    case "5": 	case "nature":		case string(c_nature):		case "9":
		return c_nature_shadowed;
    case "6": 	case "shadow":		case string(c_shadow):		
		return c_shadow_shadowed;
	#endregion
		
	#region Attributes
	case "10":	return c_gray12;
    case "11":	case "c_power":	
		return c_power_shadowed;
    case "12":	case "c_fortitude":	
		return c_fortitude_shadowed;
    case "13":	case "c_speed":		
		return c_speed_shadowed;
    case "14":	case "c_recovery":	
		return c_recovery_shadowed;
    case "15":	case "c_potency":	
		return c_potency_shadowed;
	#endregion
/*============================================================================*/
	
	};
