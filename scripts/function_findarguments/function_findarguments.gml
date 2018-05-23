///function_findarguments(function);
/*
	[PPC][General Function][Miscellaneous]
	> Return 2D Array [ argument_type|argument_subtype ]	
*/
/// @arg function {string:Function Name}	
var function_name = argument0;
var output = [" "|" "];

switch ( function_name ) {
	
//=[Built in Functions]=========================================================	
	
	
//=[PPC Functions]==============================================================
//-[Drawing]--------------------------------------------------------------------
	case "draw_simplebox": 
		//draw_simplebox(x,y,width,height);
		output = parse_array2d( "integer|x,integer|y,integer|width,integer|height", ",", "|" );
		break;
		
	case "draw_plane_outline":
		output = parse_array2d( "integer|x,integer|y,integer|width,integer|height,c_code|colour,real|alpha,integer|thickness", ",", "|" );
		break;
	
	
	};
	
return output;