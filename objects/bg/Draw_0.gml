if !DrawNormal { return };

//Find Dimensions
var draw_space_x = camera_get_view_x(view_camera[view_current]);
var draw_space_y = camera_get_view_y(view_camera[view_current]);
draw_space_width = resolution_get_width("Playable");
draw_space_height = resolution_get_height("Playable");
var windowX = 0;
var windowY = 0;
if set_AnchorToView {
	var windowX = camera_get_view_x(view_camera[view_current]);
	var windowY = camera_get_view_y(view_camera[view_current]);
	};

//Draw Flat Colour
if back_Flat { 
	draw_plane(draw_space_x,draw_space_y,draw_space_width,draw_space_height,back_Flat_Colour,back_Flat_Alpha);
	};

for ( bgID=1; bgID<=back_StoredBGs; bgID++ ) {
	
	//Find Dimensions
	var width = sprite_get_width(back_StoredBG_Sprite[bgID])*back_StoredBG_ScaleX[bgID];
	var height = sprite_get_height(back_StoredBG_Sprite[bgID])*back_StoredBG_ScaleY[bgID];

	//Find Anchors
	var anchorX = x;
	var anchorY = y;
	switch ( back_StoredBG_AnchorX[bgID] ) {
		case fa_left: 		if set_AnchorToView { anchorX = draw_space_x } 
									 else { anchorX = 0 };										break;
		case fa_center:		if set_AnchorToView { anchorX = (draw_space_width - width) div 2 } 
									 else { anchorX = (room_width - width) div 2 };		break;
		case fa_right: 		if set_AnchorToView { anchorX = draw_space_width - width } 
									 else { anchorX = room_width - width };						break;		
		};	
	switch ( back_StoredBG_AnchorY[bgID] ) {
		case fa_top: 		if set_AnchorToView { anchorY = draw_space_y } 
									 else { anchorY = 0 };										break;
		case fa_center:		if set_AnchorToView { anchorY = (draw_space_height - height) div 2 } 
									 else { anchorY = (room_height - height) div 2 };	break;
		case fa_bottom: 	if set_AnchorToView { anchorY = draw_space_height - height } 
									 else { anchorY = room_height - height };					break;
		};
	if DrawAnchor { draw_plane(anchorX-1,anchorY-1,2,2,c_red,0.8) };

	//Draw Center
	DrawX = windowX+anchorX; DrawIDX = 0;
	DrawY = windowY+anchorY; DrawIDY = 0;
	event_user(1);

	//Tile
	var draw_y = height;
	var draw_x = width;
	
	//TILE UP
	if back_StoredBG_Tile[bgID,UP] {
		for ( var i=1; draw_y+height>0; i++ ) {
			draw_y = anchorY - height * i
			DrawX = windowX+anchorX; DrawIDX = 0;
			DrawY = windowY+draw_y; DrawIDY = i;
			event_user(1);
			draw_x = width;
			if ( back_StoredBG_Tile[bgID,LEFT] and back_StoredBG_Tile[bgID,5] ) {
				for ( var j=1; draw_x+width>0; j++ ) {
					draw_x = anchorX - width * j;
					DrawX = windowX+draw_x; DrawIDX = -j;
					event_user(1);
					};
				};
			draw_x = width;
			if ( back_StoredBG_Tile[bgID,RIGHT] and back_StoredBG_Tile[bgID,5] ) {
				for ( var j=1; draw_x<draw_space_width; j++ ) {
					draw_x = anchorX + width * j
					DrawX = windowX+draw_x; DrawIDX = j;
					event_user(1);
					};
				};
			};
		};
		
	//TILE DOWN
	draw_y = height;
	draw_x = width;
	if back_StoredBG_Tile[bgID,DOWN] {
		for ( var i=1; draw_y<draw_space_y+draw_space_height; i++ ) {
			draw_y = anchorY + height * i
			DrawX = windowX+anchorX; DrawIDX = 0;
			DrawY = windowY+draw_y; DrawIDY = -i;
			event_user(1);
			draw_x = width;
			if ( back_StoredBG_Tile[bgID,LEFT] and back_StoredBG_Tile[bgID,5] ) {
				for ( var j=1; draw_x+width>0; j++ ) {
					draw_x = anchorX - width * j;
					DrawX = windowX+draw_x; DrawIDX = -j;
					event_user(1);
					};
				};
			draw_x = width;	
			if ( back_StoredBG_Tile[bgID,RIGHT] and back_StoredBG_Tile[bgID,5] ) {
				for ( var j=1; draw_x<draw_space_x+draw_space_width; j++ ) {
					draw_x = anchorX + width * j
					DrawX = windowX+draw_x; DrawIDX = j;
					event_user(1);
					};
				};
			};
		};
		
	//TILE LEFT
	if back_StoredBG_Tile[bgID,LEFT] {
		draw_x = width;
		for ( var j=1; draw_x+width>0; j++ ) {
			draw_x = anchorX - width * j;
			DrawX = windowX+draw_x; DrawIDX = -j;
			DrawY = windowY+anchorY; DrawIDY = 0;
			event_user(1);
			};
		};
		
	//TILE RIGHT
	if back_StoredBG_Tile[bgID,RIGHT] {
		draw_x = width;
		for ( var j=1; draw_x<draw_space_x+draw_space_width; j++ ) {
			draw_x = anchorX + width * j
			DrawX = windowX+draw_x; DrawIDX = j;
			DrawY = windowY+anchorY; DrawIDY = 0;
			event_user(1);
			};
		};
		
	};