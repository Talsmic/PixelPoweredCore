///draw_screenfill([colour],[alpha]);
/// @arg {c_code}	[colour]
/// @arg {real}		[alpha]
/*
	[PPC][Common Function][Drawing]
*/
if ( argument_count > 0 ) { var colour = argument[0] };
					 else { var colour = draw_get_color() };
if ( argument_count > 1 ) { var alpha = argument[1] };
					 else { var alpha = draw_get_alpha() };

draw_sprite_tiled_ext(spr_1x1,0,0,0,1,1,colour,alpha);