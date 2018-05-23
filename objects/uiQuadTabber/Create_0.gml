/// @desc Create TabSet

// Inherit the parent event
event_inherited();

ui_TabSet_create(1,3,GUI_X,GUI_Y);
	TabSet_AttachToSide[1] = TOP;
	TabSet_TabFlowDirection[1] = LEFT;
ui_TabSet_create(2,3,GUI_X,GUI_Y);
	TabSet_AttachToSide[2] = LEFT;
	TabSet_TabFlowDirection[2] = DOWN;
	TabSet_Rotation[2] = ANGLE_RIGHT;
ui_TabSet_create(3,3,GUI_X,GUI_Y);
	TabSet_AttachToSide[3] = RIGHT;
	TabSet_TabFlowDirection[3] = DOWN;
	TabSet_Rotation[3] = ANGLE_LEFT;
ui_TabSet_create(4,3,GUI_X,GUI_Y);
	TabSet_AttachToSide[4] = BOTTOM;
	TabSet_TabFlowDirection[4] = LEFT;