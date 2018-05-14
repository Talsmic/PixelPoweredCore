/// @desc Draw Grid Cell
draw_sprite_ext( BG_Sprite[bgid], BG_Frame[bgid], DrawX, DrawY, BG_ScaleX[bgid], BG_ScaleY[bgid], 0, BG_Tint[bgid], BG_Alpha[bgid]);
if Grid_Draw_CoOrds {
	draw_set_font(ft_EvoTooltip_6_Condensed);
	draw_set_halign(fa_right);
	var text_x = DrawX - 1 + (sprite_get_width(BG_Sprite[bgid])*BG_ScaleX[bgid]);
	var text_y = DrawY - 32 - (sprite_get_height(BG_Sprite[bgid])*BG_ScaleY[bgid]);
	draw_text_flatcolour( text_x, text_y, string(DrawIDX)+","+string(-DrawIDY), BG_Tint[bgid], BG_Alpha[bgid]-0.2);
	draw_set_halign(fa_left);
	};