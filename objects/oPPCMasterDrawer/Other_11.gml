/// @desc Find Required Arguments

//Empty old array
RequiredArguments = 0;

switch (toDraw_Command) {
	//GMS Draw Functions
	
	//PPC Draw Functions
	case "draw_splane_coloured":
		RequiredArguments = ["x","y","x","y","colour","alpha"];
		break;		
		
	//[WIP] There are many more arguments this could ask for
	};