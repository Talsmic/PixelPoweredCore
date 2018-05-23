///finish_sprite_glow(x,y,[colour],[alpha],[xscale],[yscale],[rotation]);
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
///drawto_sprite_glow_ext(sprite_index,[image_index],[x],[y],[padding],[alpha],[xscale],[yscale],[rotation]);
/// @arg [a0]		{datatype}		(default: )
#region Arguments
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~>
var sprite_id =	argument[0];
var image_id =	argument_count > 1 ? argument[1] : 0;
var draw_x =	argument_count > 2 ? argument[2] : 0;
var draw_y =	argument_count > 3 ? argument[3] : 0;
var padding =	argument_count > 4 ? argument[4] : 0;
var alpha =		argument_count > 5 ? argument[5] : 1;
var x_scale =	argument_count > 6 ? argument[6] : 1;
var y_scale =	argument_count > 7 ? argument[7] : 1;
var rotation =	argument_count > 8 ? argument[8] : 0;
var width = surface_get_width(GlowSurface);
var height = surface_get_height(GlowSurface);
#endregion

//Draw Surface
if ( xscale < 0 ) { X += w };
if ( yscale < 0 ) { Y += h };

draw_surface_ext(GlowSurface,X,Y,xscale,yscale,rotation,colour,alpha);
surface_free(GlowSurface);