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
var max_drawcommandarguments = 8;
//How large is the array that stores possible Arguments?
var max_storedarguments = 5;

#region Create UI Elements
//[Slave[1]] Tabset
Slave[1] = instance_create_as_slave(x,y,uiTabset);
	with (Slave[1]) { uiTabset_AlterTabs(1,1+max_drawcommands,[11,48,1]) };
	Slave[1].WindowAnchor_X = fa_left;
	Slave[1].WindowAnchor_X_pad = 2;
	Slave[1].WindowAnchor_Y = fa_bottom;
	Slave[1].Tabset_AttachToSide[1] = TOP;
	Slave[1].Tabset_Tab_Name[1,1] = "Adjust";
	Slave[1].Pointer_Tabset[1] = 2;
	for ( var i=1; i<=max_drawcommands; ++i ) {
		Slave[1].Tabset_Tab_Width[1,i+1] = 68;
		Slave[1].Tabset_Tab_Name[1,i+1] = "Function "+string(i);
		};
	
//[Slave[2]] FunctionBox
Slave[2] = instance_create_as_slave(x,y,uiFunctionBox);
	Slave[2].WindowAnchor_X = fa_right;
	Slave[2].WindowAnchor_X_pad = 4;
	Slave[2].WindowAnchor_Y = fa_bottom;
	Slave[2].WindowAnchor_Y_pad = 20;

#endregion

#region Create Function & Argument Storage
//Create the array for Functions
for ( var i=1; i<=max_drawcommands; ++i ) {
	FunctionName[i] = "drawSimplebox";
	FunctionArguments[i] = [10*i,10*i,10*i,10*i];
	for ( var j=0; j<max_drawcommandarguments; ++j ) {
		FunctionArgumentClass[i,j] = "integer";
		FunctionArgumentSubClass[i,j] = "x";
		FunctionArgumentReference[i,j] = i;
		};
	};

//Create the arrays for Arguments
//0 in each array is a constant, the user can't edit it
masterdrawer_storearguments(max_storedarguments);

#endregion
	
//Other Important Variables
DrawAnchor = true;
InputArgument = -1;
alarm[0] = 60;
alarm[1] = 5;