if Setting_ManageDrawLayers { global.inProgress_Step = true };
/// @desc Reset Focus



//Reset Focus
Focus_Current = Focus_NextStep;	//Upgrade the previous checked focus to active
Focus_NextStep = Setting_Focus_Floor;			//Start a new check

setdepth(eDepthLayer.GUI,1,Focus_Current);
