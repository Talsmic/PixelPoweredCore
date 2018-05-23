///ui_TabSet_drawtab([TabSetID],[TabID],[x],[y],[state]);
/// @arg [TabSetID] {integer}		(default: 0)
/// @arg [TabID]	{integer}		(default: 1)
/// @arg [x]		{real}				
/// @arg [y]		{real}					
/// @arg [state]	{eButtonState}	(default: eButtonState.detect)
#region Arguments
var ref =		argument_count > 0 ? argument[0] : 0;
var tabref =	argument_count > 1 ? argument[1] : 1;
var anchor_x =	argument_count > 2 ? argument[2] : TabSet_X[ref]+tabref*40;
var anchor_y =	argument_count > 3 ? argument[3] : TabSet_Y[ref];
var state =		argument_count > 4 ? argument[4] : eButtonState.detect;
#endregion

#region Find Dimensions
var tabwidth = TabSet_Tab_Width[ref, tabref]; 
var tabheight = TabSet_TabHeight[ref];
//Rotated Variants
if ( TabSet_Rotation[ref] == ANGLE_RIGHT or TabSet_Rotation[ref] == ANGLE_LEFT ) {
	tabwidth = TabSet_TabHeight[ref]; 
	tabheight = TabSet_Tab_Width[ref, tabref];
	};
//Tab Region
var draw_region = [anchor_x, anchor_y, anchor_x+tabwidth, anchor_y+tabheight, tabwidth, tabheight]; 
switch ( TabSet_AttachToSide[ref] ) {
	case LEFT:		draw_region = region_move(draw_region,-tabwidth,0); 		break;
	case TOP: 		draw_region = region_move(draw_region,0,-tabheight);  		break;
	};
#endregion

#region State Alternations
	 if ( !TabSet_Tab_Enabled[ref,tabref] )	{ state = eButtonState.disabled }; 
else if ( Pointer_Tabset[ref] == tabref )	{ state = eButtonState.focus };
else if ( state == eButtonState.detect )	{ state = checkstate_withregion(draw_region) };

var text_colour = TabSet_Colour_Text[ref];
var tab_colour = TabSet_Colour_Tab[ref];
var tab_alpha = 0.6;

switch ( state ) {		
	
	case eButtonState.enabled:
		draw_region = region_move_eDirection( draw_region, TabSet_AttachToSide[ref], 1 );
		break;
	
	case eButtonState.disabled:
		text_colour = c_midgray;
		tab_alpha = 0.5;
		break;
		
	case eButtonState.mouseover:
		draw_region = region_move_eDirection( draw_region, TabSet_AttachToSide[ref], 1 );
		text_colour = TabSet_Colour_TextHover[ref]
		tab_colour = TabSet_Colour_TabHover[ref]
		break;
		
	case eButtonState.pressed:
		text_colour = TabSet_Colour_TextHover[ref]
		tab_colour = TabSet_Colour_TabHover[ref]
		break;
		
	case eButtonState.focus:
		draw_region = region_adjust_eDirection( draw_region, TabSet_AttachToSide[ref], 1 );
		text_colour = TabSet_Colour_TextFocus[ref]
		tab_colour = TabSet_Colour_TabFocus[ref]
		var tab_alpha = 0.8;
		break;
		
	};
#endregion
	
#region Draw
draw_tilebox(draw_region[0],draw_region[1],draw_region[4],draw_region[5],tab_colour,tab_alpha,Tabset_Tileset[ref],Corners);

//Draw Text
var text_point = [ draw_region[0] + ( tabwidth div 2 ), draw_region[1] + ( tabheight div 2 ) ];
if ( TabSet_Rotation[ref] ) {
	draw_set_color(text_colour);
	draw_set_alpha(1);
	draw_text_transformed( text_point[0], text_point[1], TabSet_Tab_Name[ref,tabref], 1, 1, TabSet_Rotation[ref]) };
else {
	draw_text_flatcolour( text_point[0], text_point[1], TabSet_Tab_Name[ref,tabref], text_colour, 1 ) 
	};
#endregion
		
return draw_region;