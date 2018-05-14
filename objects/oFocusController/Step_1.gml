/// @desc Reset Focus

//Reset Focus
FocusCurrent = FocusCheck;	//Upgrade the previous checked focus to active
FocusCheck = 10;			//Start a new check

setdepth(DEPTHLAYER_GUI,-1,FocusCurrent);