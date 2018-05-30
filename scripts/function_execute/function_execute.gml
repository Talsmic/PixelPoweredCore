///function_execute(function,argument_array);
/*
	[PPC][General Function][Miscellaneous]
	While GMS2 allows you to execute user made scripts at will, it doesn't let
	you execute built in functions on command.
	This script works around that by allowing you to call a lot of commonly used
	functions by providing the arguments to them in an array
*/
/// @arg function {string:Function Name}	
/// @arg argument_array {array}		
var function_name = argument0;
var arg = argument1;
var output = 0;

switch ( function_name ) {
	
//=[Built in Functions]=========================================================	
	
	
//=[PPC Functions]==============================================================
//-[Drawing]--------------------------------------------------------------------
	case "drawSimplebox": 
		drawSimplebox(x+arg[0],y+arg[1],arg[2],arg[3]);
		break;
		
	case "_drawPlane":
		_drawPlane(x+arg[0],y+arg[1],arg[2],arg[3],arg[4],arg[5],arg[6]);
		break;
	
	};
	
return output;