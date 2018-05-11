/*[The Master Drawer]===========================================================
	This object is a cute little super object that stores an array of draw 
	commands, then each draw step, converts them in to real GML commands and 
	draws them. 
	It also stores arrays of nearly every type of argument those commands could
	ask for, so the player can edit the parameters at will.
	Finally, it also draws a GUI that lets players edit these arrays.
	
	Why?	
	-	It offers an in practice example of any drawing based function
	-	It lets you test out how all sorts of functions actually work
	-	It also does a really good job of showing off PPCs UI functions and how 
		to use them well	
==============================================================================*/	

//How large is the array that stores DrawCommands?
var max_drawcommands = 3;
var max_drawcommandarguments = 10;
//How large is the array that stores possible Arguments?
var max_arguments = 10;

//Create the array for DrawCommands
for ( var i=0 ; i<max_drawcommands ; i++ ) {
	DrawCommand[i] = " ";
	for ( var j=0 ; j<max_drawcommandarguments ; j++ ) {
		ArgumentReference[i,j] = 0;
		};
	};
DrawCommand[0] = "draw_splane_coloured"; //Set DrawCommand[0] to an example

//Create the array for Arguments
//0 in each array is a constant, the user can't edit it
for ( var i=0 ; i<max_arguments ; i++ ) {
	Arg_X[i] = 20+20*i;
	Arg_Y[i] = 20+20*i;
	Arg_Width[i] = 50+20*i;
	Arg_Height[i] = 40+20*i;
	Arg_Colour[i] = find_colour(i);
	Arg_Alpha[i] = 1 - 0.2*i
	Arg_String[i] = "Test String #"+string(i)+string(i)+string(i);
	Arg_Sprite[i] = spr_genomestar;
	Arg_Image[i] = 0;
	Arg_Size[i] = 3+i;
	Arg_Boolean[i] = 0;
	//[WIP] There are many more arguments this could ask for
	};
	
//Other Important Variables
RequiredArguments = 0;
toDraw_Command = "";
for ( var j=0 ; j<max_drawcommandarguments ; j++ ) {
	tD_A[j] = 0;
	};

//Tabset that tracks the command to draw on the GUI
ui_tabset_create(1,max_drawcommands);
	Tabset_X[1] = 500;
	Tabset_Y[1] = 500;

/*[WIP]