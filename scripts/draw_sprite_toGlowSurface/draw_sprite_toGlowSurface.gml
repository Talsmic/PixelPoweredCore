///draw_sprite_toGlowSurface(sprite_id,[image_id],[thickness],[alpha],[xscale],[yscale],[rotation],[x],[y],);
/// @arg sprite_id		{sprite_id}		
/// @arg [image_id]		{integer}			(default: 0)
/// @arg [thickness]	{intger or array}	(default: 1)
/// @arg [alpha]		{real|0..1}			(default: 1)
/// @arg [x_scale]		{real}				(default: 1)
/// @arg [y_scale]		{real}				(default: 1)
/// @arg [rotation]		{integer|0..360}	(default: 0)
/// @arg [x]			{real}				(default: SEE NOTES)
/// @arg [y]			{real}				(default: SEE NOTES)
#region Arguments
/* 
!Important notes on arguments for this function!
	
The arguments for this function may not be required for your desired final
result. Most effects should be applied in finish_sprite_glow();	

If you're not sure, only provide up to thickness
*/
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~>
var sprite_id =	argument[0];
var image_id =	argument_count > 1 ? argument[1] : 0;
var thickness =	argument_count > 2 ? fix_array_1d(argument[2],4,4,0,0) : [1,1,1,1];
var alpha =		argument_count > 3 ? argument[3] : 1;
var x_scale =	argument_count > 4 ? argument[4] : 1;
var y_scale =	argument_count > 5 ? argument[5] : 1;
var rotation =	argument_count > 6 ? argument[6] : 0;
var draw_x =	argument_count > 7 ? argument[7] : 0;	
var draw_y =	argument_count > 8 ? argument[8] : 0;
var width = sprite_get_width(sprite_id);
var height = sprite_get_height(sprite_id);
#endregion

//Target Surface
var surfacedraw_x = draw_x + GlowPadding[0] - thickness[0];
var surfacedraw_y = draw_y + GlowPadding[1] - thickness[1];
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
			draw_sprite_general(sprite_id,image_id,0,0,width,height,surfacedraw_x+i,surfacedraw_y+j,x_scale,y_scale,rotation,c_white,c_white,c_white,c_white,alpha);
			};
		};
		
	//Turn of Fog and Reset Target
	gpu_set_fog(false, c_white, 0, 0);
	
} surface_reset_target();
