// Inherit the parent event
event_inherited();
back_Flat = false;

Grid_Size = 32; //8, 16, 24 or 32
Grid_Colour = c_white;
Grid_Shading = 0; //0 for light, 1 for dark
Grid_Alpha = 0.5;
Grid_Layer = 0; //0 for Standard, 1 for GUI
Grid_Draw_CoOrds = false;
Grid_SquaresX = -1; //-1 for infinite
Grid_SquaresY = -1; //-1 for infinite

back_StoredBG_Tile[1,UP] =		false;
back_StoredBG_Tile[1,DOWN] =	true;
back_StoredBG_Tile[1,LEFT] =	false;
back_StoredBG_Tile[1,RIGHT] =	true;
back_StoredBG_Tile[1,5] = true; //fill

back_StoredBG_AnchorX[1] = -1;
back_StoredBG_AnchorY[1] = -1;