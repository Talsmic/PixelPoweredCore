draw_plane(x-1,y-1,2,2,c_red,0.8)

draw_sprite_ext(spr_scrollarrow,2,x,y-4,1,1,0,c_fire,1);

set_font(ft_EvoTooltip_6);
_setAlign(fa_center);
draw_text_outline(x,y-20,string(x)+","+string(y),c_fire,c_fire_dark);
_setAlign(fa_left);