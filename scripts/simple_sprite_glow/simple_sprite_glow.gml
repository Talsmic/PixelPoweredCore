///simple_sprite_glow(sprite_id,image_id,x,y,{[thickness]},[colour],[alpha],[xscale],[yscale],[rotation]);
/// @arg sprite_id		#sprite_id#		
/// @arg image_id		#image_id#			
/// @arg x				{real}				
/// @arg y				{real}				
/// @arg {[thickness]}	{integer or array}	(default: 1)
/// @arg [colour]		#c_code#			(default: draw_get_colour())
/// @arg [alpha]		{real|0..1}			(default: draw_get_alpha())
/// @arg [x_scale]		{real}				(default: 1)
/// @arg [y_scale]		{real}				(default: 1)
/// @arg [rotation]		{integer|0..360}	(default: 0)
#region Arguments
if argument_count < 4 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var sprite_id =	argument[0];
var image_id =	argument[1];
var draw_x =	argument[2];	
var draw_y =	argument[3];
var thickness =	argument_count > 4 ? _validateArray(argument[4],4,4,0,0) : [1,1,1,1];
var colour =	argument_count > 5 ? argument[5] : draw_get_color();
var alpha =		argument_count > 6 ? argument[6] : draw_get_alpha();
var x_scale =	argument_count > 7 ? argument[7] : 1;
var y_scale =	argument_count > 8 ? argument[8] : 1;
var rotation =	argument_count > 9 ? argument[9] : 0;
var width = sprite_get_width(sprite_id);
var height = sprite_get_height(sprite_id);
#endregion

GlowRegion = _spriteRegion(draw_x,draw_y,sprite_id);
GlowRegion = _alterRegion(GlowRegion,thickness);

//Create Surface
GlowSurface = surface_create(GlowRegion[eR.w], GlowRegion[eR.h]);
var surfacedraw_x = thickness[0];
var surfacedraw_y = thickness[1];
//Draw to Surface
surface_set_target(GlowSurface) {
	
	//Turn on Fog
	draw_clear_alpha(c_white, 0);	
	gpu_set_fog(true, c_white, 0, 0);
	
	//Draw Glow
	var i, j;
	for ( var i=-thickness[0] ; i<=thickness[2] ; i++ ) {
		for ( var j=-thickness[1] ; j<=thickness[3] ; j++ ) {
			draw_sprite_general(sprite_id,image_id,0,0,width,height,surfacedraw_x+i,surfacedraw_y+j,1,1,0,c_white,c_white,c_white,c_white,1);
			};
		};
		
	//Turn of Fog and Reset Target
	gpu_set_fog(false, c_white, 0, 0);
	
} surface_reset_target();

//Draw Surface
draw_surface_ext(GlowSurface,draw_x-thickness[0]-sprite_get_xoffset(sprite_id),draw_y-thickness[1]-sprite_get_yoffset(sprite_id),1,1,0,colour,alpha);
surface_free(GlowSurface);
