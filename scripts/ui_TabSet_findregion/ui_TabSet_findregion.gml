///ui_TabSet_findregion(TabSetID],[TabID],[x],[y],[state]);
/// @arg [TabSetID] {integer}		(default: 0)
/// @arg [TabID]	{integer}		(default: 1)
/// @arg [x]		{real}				
/// @arg [y]		{real}				
/// @arg [state]	{eButtonState}	(default: eButtonState.detect)
/*
	>>Returns {region_ext} [x1,y1,x2,y2,width,height,state,mousein,mouseinGUI];
*/
#region Arguments
var ref = 0;				if argument_count > 0 { ref = argument[0] };
var tabref = 1;				if argument_count > 1 { tabref = argument[1] };
var anchor_x = TabSet_X[ref];	if argument_count > 2 { anchor_x = argument[2] };
var anchor_y = TabSet_Y[ref];	if argument_count > 3 { anchor_y = argument[3] };
#endregion

//Find Dimensions
var tabwidth = TabSet_Tab_Width[ref, tabref]; 
var tabheight = TabSet_TabHeight[ref];
//Rotated Variants
if ( TabSet_Rotation[ref] == ANGLE_RIGHT or TabSet_Rotation[ref] == ANGLE_LEFT ) {
	tabwidth = TabSet_TabHeight[ref]; 
	tabheight = TabSet_Tab_Width[ref, tabref];
	};

//Tab Region
var output = [ anchor_x, anchor_y, anchor_x+tabwidth, anchor_y+tabheight, tabwidth, tabheight ]; 
switch ( TabSet_AttachToSide[ref] ) {
	case LEFT:		output = region_move(output,-tabwidth,0); 		break;
	case TOP: 		output = region_move(output,0,-tabheight);  		break;
	};

//State Detection
var state = eButtonState.detect;
if argument_count > 4 { state = argument[4] };
if state == eButtonState.detect { state = checkstate_withregion(output) };
if ( !TabSet_Tab_Enabled[ref,tabref] ) { state = eButtonState.disabled }; 
if ( Pointer_Tabset[ref] == tabref ) { state = eButtonState.focus };
	
output[6] = state;
output[7] = mouse_in_region( output );
output[8] = mouse_in_region( output );

return output;