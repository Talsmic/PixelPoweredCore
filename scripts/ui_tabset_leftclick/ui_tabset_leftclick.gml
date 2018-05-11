///ui_tabset_leftclick(#);
/// @arg #
var ref = argument0;
		
var changed = false;
//Find Correct List Length
var x1 = 0;
var y1 = 0;
var tabwidth = Tabset_TabWidth[ref]; 
var tabheight = Tabset_TabHeight[ref];
//Rotated Tab Adjustments
if ( Tabset_Rotation[ref] == ANGLE_RIGHT or Tabset_Rotation[ref] == ANGLE_LEFT ) {
	tabwidth = Tabset_TabHeight[ref]; 
	tabheight = Tabset_TabWidth[ref];
	};
	
switch ( Tabset_AttachToSide[ref] ) {
	case RIGHT:			
		var x1 = 1;
		var X = Tabset_X[ref]+1;
		var Y = Tabset_Y[ref]+tabheight+1;	
		break;
	case LEFT:			
		var x1 = -1;
		var X = Tabset_X[ref]-tabwidth; 
		var Y = Tabset_Y[ref]+tabheight+1;		
		break;
	case UP: default:	
		var y1 = -1; 
		var X = Tabset_X[ref]; 
		var Y = Tabset_Y[ref];			
		break;
	case DOWN:			
		var y1 = 1; 
		var X = Tabset_X[ref]; 
		var Y = Tabset_Y[ref]+tabheight+1;	
		break;
	};
	
//Buttons
for ( var i=1 ; i<array_length_2d(Tabset_List,ref) ; i++ ) {
	if ( infocus() and mouse_in_region_gui( define_region( X-1-abs(x1), Y-tabheight-2, tabwidth+abs(x1), tabheight+abs(y1) ) ) and Tabset_TabEnabled[ref,i] ) {
		Tabset_Pointer[ref] = i;
		changed = true;
		};
			
	//Move DrawPoint
	switch ( Tabset_ListDirection[ref] ) {
			default:
			case LEFT:			X += tabwidth + Tabset_TabSpace[ref];		break;
			case RIGHT:			X -= tabwidth + Tabset_TabSpace[ref];		break;
			case UP:			Y -= tabheight + Tabset_TabSpace[ref] + 1;	break;
			case DOWN:			Y += tabheight + Tabset_TabSpace[ref] + 1;	break;
		};
			
	};	
	
return changed;