draw_self();

//Loop through all stored DrawCommands
for ( var i=0 ; i<array_length_1d(DrawCommand) ; i++ ) {
	//Store the Command
	toDraw_Command = DrawCommand[i];
	//Check Required Arguments
	event_user(1);
	//Loop through Arguments
	for ( var j=0 ; j<array_length_1d(RequiredArguments) ; j++ ) {
		//Store the Arguments (not just the reference to the arguments)
		switch (RequiredArguments[j]) {	
			default:		tD_A[j] = 0;									break;			
			case "x":		tD_A[j] = Arg_X[ArgumentReference[i,j]];		break;		
			case "y":		tD_A[j] = Arg_Y[ArgumentReference[i,j]];		break;		
			case "width":	tD_A[j] = Arg_Width[ArgumentReference[i,j]];	break;	
			case "height":	tD_A[j] = Arg_Height[ArgumentReference[i,j]];	break;		
			case "colour":	tD_A[j] = Arg_Colour[ArgumentReference[i,j]];	break;		
			case "alpha":	tD_A[j] = Arg_Alpha[ArgumentReference[i,j]];	break;		
			case "string":	tD_A[j] = Arg_String[ArgumentReference[i,j]];	break;		
			case "sprite":	tD_A[j] = Arg_Sprite[ArgumentReference[i,j]];	break;		
			case "image":	tD_A[j] = Arg_Image[ArgumentReference[i,j]];	break;		
			case "size":	tD_A[j] = Arg_Size[ArgumentReference[i,j]];		break;		
			case "boolean":	tD_A[j] = Arg_Boolean[ArgumentReference[i,j]];	break;		
			//[WIP] There are many more arguments this could ask for
			};
		};
	//Perform Draw
	event_user(0);
	};