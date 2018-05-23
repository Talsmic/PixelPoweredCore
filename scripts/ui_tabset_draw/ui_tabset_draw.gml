///ui_TabSet_draw([TabSetID],[x],[y]);
/// @arg [TabSetID] {integer}	(default: 0)
/// @arg [x]		{real}				
/// @arg [y]		{real}				
#region Arguments
var ref =		argument_count > 0 ? argument[0] : 0;
var draw_x = 	argument_count > 1 ? argument[1] : TabSet_X[ref];
var draw_y = 	argument_count > 2 ? argument[2] : TabSet_Y[ref];
#endregion

#region Find Corners
switch TabSet_AttachToSide[ref] {
	default:
	case BOTTOM:	Corners = [1,1,0,0]; 		break;
	case TOP: 		Corners = [0,0,1,1]; 		break;
	case RIGHT:		Corners = [1,0,1,0]; 		break;
	case LEFT:		Corners = [0,1,0,1]; 		break;
	case NONE:		Corners = [0,0,0,0]; 		break;
	};
#endregion

#region Draw Tabs
set_align(fa_truecenter);
set_font(TabSet_Font[ref]);
for ( var i=1; i<array_length_2d(TabSet_Tab_Name,ref); i++ ) {
	
	//Draw Tab
	var drawntab = ui_TabSet_drawtab( ref, i, draw_x, draw_y );
	
	//Move DrawPoint
	switch ( TabSet_TabFlowDirection[ref] ) {
		default:
		case LEFT:		draw_x += drawntab[4] + TabSet_TabSpace[ref];		break;
		case RIGHT:		draw_x -= drawntab[4] + TabSet_TabSpace[ref];		break;
		case UP:		draw_y -= drawntab[5] + TabSet_TabSpace[ref];		break;
		case DOWN:		draw_y += drawntab[5] + TabSet_TabSpace[ref];		break;
		};
		
	};
set_align();
#endregion

//Draw Anchor
if ( TabSet_DrawAnchor[ref] ) { draw_plane(TabSet_X[ref]-1,TabSet_Y[ref]-1,2,2,c_red,1) };