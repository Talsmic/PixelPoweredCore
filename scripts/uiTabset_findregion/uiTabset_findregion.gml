///uiTabset_FindRegion(TabsetID],[TabID],[x],[y],[state]);
/// @arg [TabsetID] {integer}		(default: 0)
/// @arg [TabID]	{integer}		(default: 1)
/// @arg [x]		{real}				
/// @arg [y]		{real}				
/// @arg [state]	#eButtonState#	(default: eButtonState.detect)
/*
	<< Returns >> {region_ext} [x1,y1,x2,y2,width,height,state,mousein,mouseinGUI];
*/
#region Arguments & Variables
var ref = 0;				if argument_count > 0 { ref = argument[0] };
var tabref = 1;				if argument_count > 1 { tabref = argument[1] };
var anchor_x = Tabset_X[ref];	if argument_count > 2 { anchor_x = argument[2] };
var anchor_y = Tabset_Y[ref];	if argument_count > 3 { anchor_y = argument[3] };
#endregion

//Find Dimensions
var tabwidth = Tabset_Tab_Width[ref, tabref]; 
var tabheight = Tabset_TabHeight[ref];
//Rotated Variants
if ( Tabset_Rotation[ref] == ANGLE_RIGHT or Tabset_Rotation[ref] == ANGLE_LEFT ) {
	tabwidth = Tabset_TabHeight[ref]; 
	tabheight = Tabset_Tab_Width[ref, tabref];
	};

//Tab Region
var output = [ anchor_x, anchor_y, anchor_x+tabwidth, anchor_y+tabheight, tabwidth, tabheight ]; 
switch ( Tabset_AttachToSide[ref] ) {
	case LEFT:		draw_region = _alterRegion(draw_region, 0, [-tabwidth,0]); 	break;
	case TOP: 		draw_region = _alterRegion(draw_region, 0, [0,-tabheight]); break;
	};

//State Detection
var state = eButtonState.detect;
if argument_count > 4 { state = argument[4] };
if ( state == eButtonState.detect ) { state = buttonStateInRegion(output) };
if ( !Tabset_Tab_Enabled[ref,tabref] ) { state = eButtonState.disabled }; 
if ( Pointer_Tabset[ref] == tabref ) { state = eButtonState.focus };
	
output[6] = state;
output[7] = _mouseInRegion( output );
output[8] = _mouseInRegion( output );

return output;