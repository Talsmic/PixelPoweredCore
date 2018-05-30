/// @desc Draw Grid Cell

//Check Square Counts (-1 infinte)
if ( Grid_SquaresX >= 0 ) {
	if ( DrawIDX > Grid_SquaresX ) { return }
	if ( DrawIDX < -Grid_SquaresX ) { return }
	};
if ( Grid_SquaresY >= 0 ) {
	if ( DrawIDY < -Grid_SquaresY ) { return }
	if ( DrawIDY > Grid_SquaresY ) { return }
	};
//Draw Cell
draw_sprite_ext( back_StoredBG_Sprite[bgID], back_StoredBG_Frame[bgID], DrawX, DrawY, back_StoredBG_ScaleX[bgID], back_StoredBG_ScaleY[bgID], 0, back_StoredBG_Tint[bgID], back_StoredBG_Alpha[bgID]);
//Draw Text
if ( Grid_Draw_CoOrds and Grid_Size > 8 ) {
	_setFont(ft_EvoTooltip_6_Condensed);
	_setAlign(fa_right);
	var text_x = DrawX + (sprite_get_width(back_StoredBG_Sprite[bgID])*back_StoredBG_ScaleX[bgID]) - 1;
	var text_y = DrawY + (sprite_get_height(back_StoredBG_Sprite[bgID])*back_StoredBG_ScaleY[bgID]) - 10;
	drawTextOutlined( text_x, text_y, string(DrawIDX)+","+string(-DrawIDY), back_StoredBG_Tint[bgID]);
	_setAlign(fa_left);
	};