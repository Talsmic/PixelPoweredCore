if !DrawNormal { return };

//Find Dimensions
var draw_space_x = camera_get_view_x(view_camera[view_current]);
var draw_space_y = camera_get_view_y(view_camera[view_current]);
draw_space_width = _resolutionGetWidth();
draw_space_height = _resolutionGetHeight();
var windowX = 0;
var windowY = 0;
if ( set_AnchorToView ) {
	var windowX = camera_get_view_x(view_camera[view_current]);
	var windowY = camera_get_view_y(view_camera[view_current]);
	};

//Draw Flat Colour
if ( back_Flat ) { 
	drawPlane(draw_space_x,draw_space_y,draw_space_width,draw_space_height,back_Flat_Colour,back_Flat_Alpha);
	};

for ( bgID=1; bgID<=back_StoredBGs; ++bgID ) {
	
	//Find Dimensions
	var width = sprite_get_width(back_StoredBG_Sprite[bgID])*back_StoredBG_ScaleX[bgID];
	var height = sprite_get_height(back_StoredBG_Sprite[bgID])*back_StoredBG_ScaleY[bgID];
	
	//Tile
	var draw_y = height;
	var draw_x = width;
	
	ShiftingTiles_Columns = ceil(draw_space_width/width)+1;
	
	//TILE UP
	for ( var col=0; col<array_length_1d(ShiftingTiles_ColumnHeight); ++col ) {
		for ( var row=0; row<ShiftingTiles_ColumnHeight[col]; ++row ) {
			draw_x = -3 + width * col;
			draw_y = -3 + draw_space_height - height * row;
			DrawX = windowX+draw_x; DrawIDX = row;
			DrawY = windowY+draw_y; DrawIDY = col;
			back_StoredBG_Alpha[bgID] = (ShiftingTiles_ColumnHeight[col]-row)*ShiftingTiles_AlphaFalloff;
			if ( back_StoredBG_Alpha[bgID] > (ShiftingTiles_MaxRows-row)*ShiftingTiles_AlphaClimb ) {
				back_StoredBG_Alpha[bgID] = (ShiftingTiles_MaxRows-row)*ShiftingTiles_AlphaClimb };
			event_user(1);
			};
		if ( ShiftingTiles_Backgrounding ) {
			var rowheight = ceil(draw_space_height/height)+1;
			for ( var row=ShiftingTiles_ColumnHeight[col]; row<rowheight; ++row ) {
				draw_x = -3 + width * col;
				draw_y = -3 + draw_space_height - height * row;
				DrawX = windowX+draw_x; DrawIDX = row;
				DrawY = windowY+draw_y; DrawIDY = col;
				back_StoredBG_Alpha[bgID] = 0.02;
				event_user(1);
				};	
			};
		};
		
	};