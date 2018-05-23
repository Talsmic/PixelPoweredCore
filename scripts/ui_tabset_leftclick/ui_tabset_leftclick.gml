///ui_TabSet_leftclick([TabSetID],[x],[y]);
/// @arg [TabSetID] {integer}	(default: 0)
/// @arg [x] {real}				(default: TabSet_X[TabSetID])
/// @arg [y] {real}				(default: TabSet_Y[TabSetID])
/*
	>>>Returns {boolean} Did focus change?
*/
#region Arguments
var ref = 0;					if argument_count > 0 { ref = argument[0] };
var anchor_x = TabSet_X[ref];	if argument_count > 1 { anchor_x = argument[1] };
var anchor_y = TabSet_Y[ref];	if argument_count > 2 { anchor_y = argument[2] };		
var changed = false;
#endregion
	
//Buttons
for ( var i=1; i<array_length_2d(TabSet_Tab_Name,ref); i++ ) {
	var regioncheck = ui_TabSet_findregion(ref,i,anchor_x,anchor_y);
	if ( infocus() and regioncheck[8] and TabSet_Tab_Enabled[ref,i] and Pointer_Tabset[ref] != i ) {
		Pointer_Tabset[ref] = i;
		changed = true;
		};
			
	//Move DrawPoint
	switch ( TabSet_TabFlowDirection[ref] ) {
		default:
		case LEFT:		anchor_x += regioncheck[4] + TabSet_TabSpace[ref];		break;
		case RIGHT:		anchor_x -= regioncheck[4] + TabSet_TabSpace[ref];		break;
		case UP:		anchor_y -= regioncheck[5] + TabSet_TabSpace[ref];		break;
		case DOWN:		anchor_y += regioncheck[5] + TabSet_TabSpace[ref];		break;
		};
			
	};	
	
return changed;