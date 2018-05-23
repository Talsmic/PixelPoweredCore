/// @desc Update Slaves

//Tabset
TabPage = Slave[1].Pointer_Tabset[1];

//FunctionBox
if ( TabPage == 1 ) { Slave[2].Hidden = true } else { Slave[2].Hidden = false };
Slave[2].FunctionName = FunctionName[TabPage-1];
Slave[2].FunctionArguments = FunctionArguments[TabPage-1];

alarm[1] = 5;