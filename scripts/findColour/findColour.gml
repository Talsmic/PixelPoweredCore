///findColour(colour);
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
	case "white":	case "16777215":	return c_white;
	case "black":	case "0":			return c_black; 
	
	#region Shades	
	case "gray1":	return c_gray1; 
	case "gray2":	return c_gray2; 
	case "gray3":	return c_gray3; 
	case "gray4":	return c_gray4; 
	case "gray5":	return c_gray5; 
	case "gray6":	return c_gray6; 
	case "gray7":	return c_gray7; 
	case "gray8":	return c_gray8; 
	case "gray9":	return c_gray9; 
	case "gray10":	return c_gray10; 
	case "gray11":	return c_gray11; 
	case "gray12":	return c_gray12; 
	case "gray13":	return c_gray13; 
	
	case "gray":	case "8421504":		return c_gray; 
	case "dkgray":	case "4210752":		return c_dkgray; 
	case "silver":	
	case "ltgray":	case "12632256":	return c_ltgray; 
	#endregion
		
	#region Basic Colours
    case "aqua":	case "16776960":	return c_aqua;
    case "blue":	case "16711680":	return c_blue;
    case "fuchsia":	case "16711935":	return c_fuchsia;
    case "teal":	case "8421376":		return c_teal;
    case "purple":	case "8388736":		return c_purple;
    case "navy":	case "8388608":		return c_navy;
    case "orange":	case "4235519":		return c_orange;
    case "yellow":	case "65535":		return c_yellow;
    case "lime":	case "65280":		return c_lime;
    case "green":	case "32768":		return c_green;
    case "olive":	case "32896":		return c_olive;
    case "red":		case "255":			return c_red;
    case "maroon":	case "128":			return c_maroon;
	#endregion
	
/*[Evolutionary Colours]======================================================*/
	#region Elemental
    case "1":	case "physical":	case string(c_physical):
		return c_physical;
    case "2":	case "fire":		case string(c_fire):	
		return c_fire;
    case "3":	case "water":		case string(c_water):	case "7":
		return c_water;
    case "4":	case "air":			case string(c_air):			case "8":
		return c_air;
    case "5": 	case "nature":		case string(c_nature):		case "9":
		return c_nature;
    case "6": 	case "shadow":		case string(c_shadow):		
		return c_shadow;
	#endregion
		
	#region Attributes
	case "10": 	return c_white;
    case "11": 	case "power":	
		return c_power;
    case "12": 	case "fortitude":	
		return c_fortitude;
    case "13": 	case "speed":		
		return c_speed;
    case "14": 	case "recovery":	
		return c_recovery;
    case "15": 	case "potency":	
		return c_potency;
	#endregion
/*============================================================================*/
	
	};
