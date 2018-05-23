///find_colour_light(colour);
/// @arg colour	{c_code}
var colour = string(argument0);
//Cleanse Input
colour = string_replace_all(colour, "c_", "");
colour = string_replace_all(colour, "_dark", "");
colour = string_replace_all(colour, "_light", "");
colour = string_lettersdigits(colour);
colour = string_lower(colour);

switch (colour) {
	
	//Elemental
    case "1":	case "physical":	case string(c_physical):		
		return c_physical_light;
    case "2":	case "fire":		case string(c_fire):		
		return c_fire_light;
    case "3":	case "water":		case string(c_water):		case "7":
		return c_water_light;
    case "4":	case "air":			case string(c_air):			case "8":
		return c_air_light;
    case "5": 	case "nature":		case string(c_nature):		case "9":
		return c_nature_light;
    case "6": 	case "shadow":		case string(c_shadow):		
		return c_shadow_light;
		
	//Attributes
	default: 
	case "10": case "white":		case string(c_white):
		return c_white;
    case "11": case "c_power":	
		return c_power_light;
    case "12": case "c_fortitude":	
		return c_fortitude_light;
    case "13": case "c_speed":		
		return c_speed_light;
    case "14": case "c_recovery":	
		return c_recovery_light;
    case "15": case "c_potency":	
		return c_potency_light;
	
	//Basic Colours
    case "c_orange":	case string(c_orange):		return c_orange;
	case "c_black":		case string(c_black):		return c_black; 	
	
	//Depreciated (Removed Elements)
    case "earth": 		return c_earth;
    case "frost":		return c_frost;
    case "electric":	return c_electric;
    case "magic":		return c_magic;	
	
	};