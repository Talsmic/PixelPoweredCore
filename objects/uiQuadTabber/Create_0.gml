/// @desc Create Tabset

// Inherit the parent event
event_inherited();

uiTabset_Create(1,3,GUI_X,GUI_Y);
	Tabset_AttachToSide[1] = TOP;
	Tabset_TabFlowDirection[1] = LEFT;
uiTabset_Create(2,3,GUI_X,GUI_Y);
	Tabset_AttachToSide[2] = LEFT;
	Tabset_TabFlowDirection[2] = DOWN;
	Tabset_Rotation[2] = ANGLE_RIGHT;
uiTabset_Create(3,3,GUI_X,GUI_Y);
	Tabset_AttachToSide[3] = RIGHT;
	Tabset_TabFlowDirection[3] = DOWN;
	Tabset_Rotation[3] = ANGLE_LEFT;
uiTabset_Create(4,3,GUI_X,GUI_Y);
	Tabset_AttachToSide[4] = BOTTOM;
	Tabset_TabFlowDirection[4] = LEFT;