///ui_tabset_draw(#);
/// @arg #
var ref = argument0;
	
var x1 = 0; var x2 = 0;
var y1 = 0; var y2 = 0;
var tabwidth = Tabset_TabWidth[ref]; 
var tabheight = Tabset_TabHeight[ref];
//Rotated Tab Adjustments
if ( Tabset_Rotation[ref] == ANGLE_RIGHT or Tabset_Rotation[ref] == ANGLE_LEFT ) {
	tabwidth = Tabset_TabHeight[ref]; 
	tabheight = Tabset_TabWidth[ref];
	};
	
//Find Corner Cuts and alignments
switch ( Tabset_AttachToSide[ref] ) {
	case RIGHT:			
		var c = [1,0,1,0]; 
		var x1 = 1;
		var x2 = 1;
		var X = Tabset_X[ref]+1;
		var Y = Tabset_Y[ref]+tabheight+1;		
		break;
	case LEFT:			
		var c = [0,1,0,1]; 
		var x1 = -1;
		var X = Tabset_X[ref]-tabwidth; 
		var Y = Tabset_Y[ref]+tabheight+1;			
		break;
	case UP: default:	
		var c = [0,0,1,1]; 
		var y1 = -1; 
		var y2 = 1;
		var X = Tabset_X[ref]; 
		var Y = Tabset_Y[ref];		
		break;
	case DOWN:			
		var c = [1,1,0,0]; 
		var y1 = 1; 
		var X = Tabset_X[ref]; 
		var Y = Tabset_Y[ref]+tabheight+1;		
		break;
	};
	
//Draw
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(Tabset_Font[ref]);
//Draw Tabs
for ( var i=1 ; i<array_length_2d(Tabset_List,ref) ; i++ ) {
		
	//State Detection
	var state = eButtonState.enabled
	if ( infocus() and mouse_in_region_gui( define_region( X-1-abs(x1), Y-tabheight-2, tabwidth+abs(x1), tabheight+abs(y1) ) ) ) {
		if ( mouse_check_button(mb_left) ) {	var state = eButtonState.pressed;	}
			else { var state = eButtonState.mouseover; };
		};
	if ( !Tabset_TabEnabled[ref,i] ) { var state = eButtonState.disabled }; 
	if ( Tabset_Pointer[ref] == i ) { state = eButtonState.focus; };
		
	//Draw Tab
	switch ( state ) {		
		case eButtonState.disabled:
			draw_tilebox_cornerless( X, Y+y1-tabheight-1+y2*2, tabwidth-abs(x1), tabheight-abs(y1), spr_whitebox,Tabset_Colour_Tab[ref],0.6,c[0],c[1],c[2],c[3]);
			if ( Tabset_Rotation[ref] ) {
				draw_set_color(c_midgray);
				draw_text_ext_transformed( X+floor(tabwidth*0.5)-x1, Y-Tabset_FontHeight[ref]+y2, Tabset_List[ref,i], -1, 300, 1, 1, Tabset_Rotation[ref]) };
			else {
				draw_text_flatcolour( X+floor(tabwidth*0.5)-x1, Y-Tabset_FontHeight[ref]+y2, Tabset_List[ref,i], c_midgray, 1 ) };
			break;		
		case eButtonState.enabled: default:
			draw_tilebox_cornerless( X+x1-x2, Y-tabheight+y1-1+y2, tabwidth, tabheight, spr_whitebox,Tabset_Colour_Tab[ref],0.7,c[0],c[1],c[2],c[3]);			
			if ( Tabset_Rotation[ref] ) {
				draw_set_color(Tabset_Colour_Text[ref]);	
				draw_text_ext_transformed( X+floor(tabwidth*0.5), Y-Tabset_FontHeight[ref], Tabset_List[ref,i], -1, 300, 1, 1, Tabset_Rotation[ref]) };
			else {
				draw_text_flatcolour( X+floor(tabwidth*0.5), Y-Tabset_FontHeight[ref], Tabset_List[ref,i], Tabset_Colour_Text[ref], 1 ) };
			break;		
		case eButtonState.focus:
			draw_tilebox_cornerless( X+x1-x2*2, Y-tabheight-1, tabwidth+abs(x1), tabheight+abs(y1), spr_whitebox,Tabset_Colour_TabFocus[ref],0.8,c[0],c[1],c[2],c[3]);
			if ( Tabset_Rotation[ref] ) {
				draw_set_color(Tabset_Colour_TextFocus[ref]);	
				draw_text_ext_transformed( X+floor(tabwidth*0.5), Y-Tabset_FontHeight[ref], Tabset_List[ref,i], -1, 300, 1, 1, Tabset_Rotation[ref]) };
			else {
				draw_text_flatcolour( X+floor(tabwidth*0.5), Y-Tabset_FontHeight[ref], Tabset_List[ref,i], Tabset_Colour_TextFocus[ref], 1 ) };
			break;		
		case eButtonState.pressed:
			draw_tilebox_cornerless( X+x1-x2*2, Y-tabheight-1, tabwidth+abs(x1), tabheight+abs(y1), spr_whitebox,Tabset_Colour_Tab[ref],0.8,c[0],c[1],c[2],c[3]);
			if ( Tabset_Rotation[ref] ) {
				draw_set_color(Tabset_Colour_TextFocus[ref]);	
				draw_text_ext_transformed( X+floor(tabwidth*0.5), Y-Tabset_FontHeight[ref], Tabset_List[ref,i], -1, 300, 1, 1, Tabset_Rotation[ref]) };
			else {
				draw_text_flatcolour( X+floor(tabwidth*0.5), Y-Tabset_FontHeight[ref], Tabset_List[ref,i], Tabset_Colour_TextFocus[ref], 1 ) };
			break;		
		case eButtonState.mouseover:
			draw_tilebox_cornerless( X+x1*2-x2*2, Y-tabheight+y1-1, tabwidth+abs(x1), tabheight+abs(y1), spr_whitebox,Tabset_Colour_TabHover[ref],0.8,c[0],c[1],c[2],c[3]);
			if ( Tabset_Rotation[ref] ) {
				draw_set_color(Tabset_Colour_TextHover[ref]);	
				draw_text_ext_transformed( X+floor(tabwidth*0.5)+x1, Y-Tabset_FontHeight[ref]+y1, Tabset_List[ref,i], -1, 300, 1, 1, Tabset_Rotation[ref]) };
			else {
				draw_text_flatcolour( X+floor(tabwidth*0.5)+x1, Y-Tabset_FontHeight[ref]+y1, Tabset_List[ref,i], Tabset_Colour_TextHover[ref], 1 ) };
			break;		
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
	
draw_set_halign(fa_left);
draw_set_valign(fa_top);

//Draw Anchor (for debug)
//draw_sprite_ext(spr_1x1,0,Tabset_X[ref]-1,Tabset_Y[ref]-1,2,2,0,c_red,1);