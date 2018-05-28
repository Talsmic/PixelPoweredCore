///uiTabset_drawtab([TabsetID],[TabID],[x],[y],[state]);
/// @arg [TabsetID] {integer}		(default: 0)
/// @arg [TabID]	{integer}		(default: 1)
/// @arg [x]		{real}				
/// @arg [y]		{real}					
/// @arg [state]	#eButtonState#	(default: eButtonState.detect)
#region Arguments
var ref =		argument_count > 0 ? argument[0] : 0;
var tabref =	argument_count > 1 ? argument[1] : 1;
var anchor_x =	argument_count > 2 ? argument[2] : Tabset_X[ref]+tabref*40;
var anchor_y =	argument_count > 3 ? argument[3] : Tabset_Y[ref];
var state =		argument_count > 4 ? argument[4] : eButtonState.detect;
#endregion

#region Find Dimensions
var tabwidth = Tabset_Tab_Width[ref, tabref]; 
var tabheight = Tabset_TabHeight[ref];
//Rotated Variants
if ( Tabset_Rotation[ref] == ANGLE_RIGHT or Tabset_Rotation[ref] == ANGLE_LEFT ) {
	tabwidth = Tabset_TabHeight[ref]; 
	tabheight = Tabset_Tab_Width[ref, tabref];
	};
//Tab Region
var draw_region = [anchor_x, anchor_y, anchor_x+tabwidth, anchor_y+tabheight, tabwidth, tabheight]; 
switch ( Tabset_AttachToSide[ref] ) {
	case LEFT:		draw_region = _alterRegion(draw_region, 0, [-tabwidth,0]); 	break;
	case TOP: 		draw_region = _alterRegion(draw_region, 0, [0,-tabheight]); break;
	};
#endregion

#region State Alternations
	 if ( !Tabset_Tab_Enabled[ref,tabref] )	{ state = eButtonState.disabled }; 
else if ( Pointer_Tabset[ref] == tabref )	{ state = eButtonState.focus };
else if ( state == eButtonState.detect )	{ state = checkstate_withregion(draw_region) };

var text_colour = Tabset_Colour_Text[ref];
var tab_colour = Tabset_Colour_Tab[ref];
var tab_alpha = 0.6;

switch ( state ) {		
	
	case eButtonState.enabled:
		draw_region = _alterRegionByDirection(draw_region, 0, 1, Tabset_AttachToSide[ref]);
		break;
	
	case eButtonState.disabled:
		text_colour = c_gray7;
		tab_alpha = 0.5;
		break;
		
	case eButtonState.mouseover:
		draw_region = _alterRegionByDirection(draw_region, 0, 1, Tabset_AttachToSide[ref]);
		text_colour = Tabset_Colour_TextHover[ref]
		tab_colour = Tabset_Colour_TabHover[ref]
		break;
		
	case eButtonState.pressed:
		text_colour = Tabset_Colour_TextHover[ref]
		tab_colour = Tabset_Colour_TabHover[ref]
		break;
		
	case eButtonState.focus:
		draw_region = _alterRegionByDirection(draw_region, 1, 0, Tabset_AttachToSide[ref]);
		text_colour = Tabset_Colour_TextFocus[ref]
		tab_colour = Tabset_Colour_TabFocus[ref]
		var tab_alpha = 0.8;
		break;
		
	};
#endregion
	
#region Draw
draw_tilebox(draw_region[0],draw_region[1],draw_region[4],draw_region[5],tab_colour,tab_alpha,Tabset_Tileset[ref],Corners);

//Draw Text
var text_point = [ draw_region[0] + ( tabwidth div 2 ), draw_region[1] + ( tabheight div 2 ) ];
if ( Tabset_Rotation[ref] ) {
	draw_set_color(text_colour);
	draw_set_alpha(1);
	draw_text_transformed( text_point[0], text_point[1], Tabset_Tab_Name[ref,tabref], 1, 1, Tabset_Rotation[ref]) 
	}
else {
	_drawText( text_point[0], text_point[1], Tabset_Tab_Name[ref,tabref], text_colour, 1 ) 
	};
#endregion
		
return draw_region;