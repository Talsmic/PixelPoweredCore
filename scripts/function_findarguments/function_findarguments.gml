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
	case "drawSimplebox": 
		//drawSimplebox(x,y,width,height);
		output = _arrayFromStringGrid( "integer|x,integer|y,integer|width,integer|height", 0, ",", "|" );
		break;
		
	case "_drawPlane_outline":
		output = _arrayFromStringGrid( "integer|x,integer|y,integer|width,integer|height,c_code|colour,real|alpha,integer|thickness", 0, ",", "|" );
		break;
	
	
	};
	
return output;