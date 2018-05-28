///uiTabset_draw([TabsetID],[x],[y]);
/// @arg [TabsetID] {integer}	(default: 0)
/// @arg [x]		{real}				
/// @arg [y]		{real}				
#region Arguments
var ref =		argument_count > 0 ? argument[0] : 0;
var draw_x = 	argument_count > 1 ? argument[1] : Tabset_X[ref];
var draw_y = 	argument_count > 2 ? argument[2] : Tabset_Y[ref];
#endregion

#region Find Corners
switch Tabset_AttachToSide[ref] {
	default:
	case BOTTOM:	Corners = [1,1,0,0]; 		break;
	case TOP: 		Corners = [0,0,1,1]; 		break;
	case RIGHT:		Corners = [1,0,1,0]; 		break;
	case LEFT:		Corners = [0,1,0,1]; 		break;
	case NONE:		Corners = [0,0,0,0]; 		break;
	};
#endregion

#region Draw Tabs
_setAlign(fa_truecenter);
set_font(Tabset_Font[ref]);
for ( var i=1; i<array_length_2d(Tabset_Tab_Name,ref); i++ ) {
	
	//Draw Tab
	var drawntab = uiTabset_drawtab( ref, i, draw_x, draw_y );
	
	//Move DrawPoint
	switch ( Tabset_TabFlowDirection[ref] ) {
		default:
		case LEFT:		draw_x += drawntab[4] + Tabset_TabSpace[ref];		break;
		case RIGHT:		draw_x -= drawntab[4] + Tabset_TabSpace[ref];		break;
		case UP:		draw_y -= drawntab[5] + Tabset_TabSpace[ref];		break;
		case DOWN:		draw_y += drawntab[5] + Tabset_TabSpace[ref];		break;
		};
		
	};
_setAlign();
#endregion

//Draw Anchor
if ( Tabset_DrawAnchor[ref] ) { draw_plane(Tabset_X[ref]-1,Tabset_Y[ref]-1,2,2,c_red,1) };