///drawto_sprite_glow_ext(sprite_index,image_index,x,y,size,alpha,xscale,yscale,rotation);
/// @arg sprite_index
/// @arg image_index
/// @arg x
/// @arg y
/// @arg size
/// @arg alpha
/// @arg xscale
/// @arg yscale
/// @arg rotation
var spr = argument0;
var img = argument1;
var X = argument2;
var Y = argument3;
var size = argument4;
var alpha = argument5;
var Xs = argument6;
var Ys = argument7;
var r = argument8;
var w = sprite_get_width(spr);
var h = sprite_get_height(spr);
var c = c_white;

//Target Surface
surface_set_target(GlowSurface);
//Turn on Fog
gpu_set_fog(true, c_white, 0, 0);

//Draw to Surface
draw_sprite_general(spr,img,0,0,w,h,X,Y,Xs,Ys,r,c,c,c,c,alpha); //Center
for ( var i=1 ; i<=size ; i++ ) {
	draw_sprite_general(spr,img,0,0,w,h,X,Y-i,Xs,Ys,r,c,c,c,c,alpha); //Up
	draw_sprite_general(spr,img,0,0,w,h,X,Y+i,Xs,Ys,r,c,c,c,c,alpha); //Down
	draw_sprite_general(spr,img,0,0,w,h,X-i,Y,Xs,Ys,r,c,c,c,c,alpha); //Left
	draw_sprite_general(spr,img,0,0,w,h,X+i,Y,Xs,Ys,r,c,c,c,c,alpha); //Right
	};
for ( var i=1 ; i<size ; i++ ) {
	draw_sprite_general(spr,img,0,0,w,h,X-i,Y-i,Xs,Ys,r,c,c,c,c,alpha); //LeftUp
	draw_sprite_general(spr,img,0,0,w,h,X-i,Y+i,Xs,Ys,r,c,c,c,c,alpha); //LeftDown
	draw_sprite_general(spr,img,0,0,w,h,X+i,Y-i,Xs,Ys,r,c,c,c,c,alpha); //RightUp
	draw_sprite_general(spr,img,0,0,w,h,X+i,Y+i,Xs,Ys,r,c,c,c,c,alpha); //RightDown
	};

//Turn of Fog and Reset Target
gpu_set_fog(false, c_white, 0, 0);
surface_reset_target();