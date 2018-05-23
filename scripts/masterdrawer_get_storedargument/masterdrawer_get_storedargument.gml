///masterdrawer_get_storedargument(reference,class,subclass);
/// @arg reference {integer}
/// @arg class {string}
/// @arg subclass {string}
var reference = argument0;
var class = argument1;
var subclass = argument2;

var output = 0;

//Classes
switch ( class ) {
	default: output = 0; break;
	case "integer":
		//Subclasses: integers
		switch ( subclass ) {
			default:
			case "generic":		output = Arg_Integer[reference];			break;
			case "x":			output = Arg_Integer_X[reference];			break;
			case "y":			output = Arg_Integer_Y[reference];			break;
			case "width":		output = Arg_Integer_Width[reference];		break;
			case "height":		output = Arg_Integer_Height[reference];		break;
			case "image_id":	output = Arg_Integer_ImageID[reference];	break;
			case "size":		output = Arg_Integer_Size[reference];		break;
			};
		break;
	case "real":
		//Subclasses: reals
		switch ( subclass ) {
			default:
			case "generic":		output = Arg_Real[reference];				break;
			case "x":			output = Arg_Real_Alpha[reference];			break;
			};
		break;
	case "string":
		//Subclasses: strings
		switch ( subclass ) {
			default:
			case "generic":		output = Arg_String[reference];				break;
			};
		break;
	case "asset":
		//Subclasses: assets
		switch ( subclass ) {
			default:
			case "sprite_id":	output = Arg_SpriteID[reference];			break;
			};
		break;
	case "boolean":
		output = Arg_Boolean[reference];
		break;
	case "c_code":
		output = Arg_ColourCode[reference];
		break;
	};
	
return output;