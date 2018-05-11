///draw_sprite_glow(x,y,colour,alpha,xscale,yscale,rotation);
/// @arg x
/// @arg y
/// @arg colour
/// @arg alpha
/// @arg xscale
/// @arg yscale
/// @arg rotation
var X = argument0;
var Y = argument1;
var colour = argument2;
var alpha = argument3;
var xscale = argument4;
var yscale = argument5;
var rotation = argument6;
var w = surface_get_width(GlowSurface);
var h = surface_get_height(GlowSurface);
var c = c_white;

//Draw Surface
if ( xscale < 0 ) { X += w };
if ( yscale < 0 ) { Y += h };
draw_surface_ext(GlowSurface,X,Y,xscale,yscale,rotation,colour,alpha);
surface_free(GlowSurface);