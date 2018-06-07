///start_sprite_glow(sprite_id,[padding]);
/// @arg sprite_id	#sprite_id#		
/// @arg [padding]	{integer} OR {array}	(default: 5)
#region Arguments & Variables
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var sprite_id =	argument[0];
var padding =	argument_count > 1 ? _validateArray(argument[1],4,4,0,0) : [1,1,1,1];
#endregion

GlowRegion = _spriteRegion(0,0,sprite_id);
GlowRegion = _alterRegion(GlowRegion,padding);
GlowPadding = padding;

//Create Surface
GlowSurface = surface_create(GlowRegion[aR.w], GlowRegion[aR.h]);
var surfacedraw_x = padding[0];
var surfacedraw_y = padding[1];

//Draw to Surface
surface_set_target(GlowSurface) {
	
	//Clean Surface
	draw_clear_alpha(c_white, 0);	
	
} surface_reset_target();

