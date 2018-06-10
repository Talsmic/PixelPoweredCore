///uiTabset_LeftClick([TabsetID],[X],[y]);
/// @arg [TabsetID] {integer}	(default: 0)
/// @arg [X] {real}				(default: Tabset_X[TabsetID])
/// @arg [y] {real}				(default: Tabset_Y[TabsetID])
/*
	><< Returns >> {boolean} Did focus change?
*/
#region Arguments
var ref = 0;					if argument_count > 0 { ref = argument[0] };
var anchor_x = Tabset_X[ref];	if argument_count > 1 { anchor_x = argument[1] };
var anchor_y = Tabset_Y[ref];	if argument_count > 2 { anchor_y = argument[2] };		
var changed = false;
#endregion
	
//Buttons
for ( var i=1; i<array_length_2d(Tabset_Tab_Name,ref); i++ ) {
	var regioncheck = uiTabset_FindRegion(ref,i,anchor_x,anchor_y);
	if ( _inFocus() and regioncheck[8] and Tabset_Tab_Enabled[ref,i] and Pointer_Tabset[ref] != i ) {
		Pointer_Tabset[ref] = i;
		changed = true;
		};
			
	//Move DrawPoint
	switch ( Tabset_TabFlowDirection[ref] ) {
		default:
		case LEFT:		anchor_x += regioncheck[4] + Tabset_TabSpace[ref];		break;
		case RIGHT:		anchor_x -= regioncheck[4] + Tabset_TabSpace[ref];		break;
		case UP:		anchor_y -= regioncheck[5] + Tabset_TabSpace[ref];		break;
		case DOWN:		anchor_y += regioncheck[5] + Tabset_TabSpace[ref];		break;
		};
			
	};	
	
return changed;