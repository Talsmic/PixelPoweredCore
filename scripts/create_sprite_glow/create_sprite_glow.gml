///create_sprite_glow(width,height);
/// @arg width
/// @arg height
var width = argument0;
var height = argument1;

//Create Surface
GlowSurface = surface_create( width, height );
surface_set_target(GlowSurface);
draw_clear_alpha( c_white, 0 );
surface_reset_target();