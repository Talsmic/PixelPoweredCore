/// @desc draw_game_surface();

//Pull Variables
var surface_width = Resolution_PlayableWidth;
var surface_height = Resolution_PlayableHeight;
var scale = Resolution_Magnification;
var ui_width = window_get_width();
var ui_height = window_get_height();
var pad_w = floor( ( ui_width - surface_width * scale ) * 0.5 );
var pad_h = floor( ( ui_height - surface_height * scale ) * 0.5 );

//Draw surface
var surface = surface_create( 2, 2 );

surface_set_target( surface );
	draw_plane_coloured(0,0,2,2,c_darkgray,1);
surface_reset_target();

draw_surface_stretched( surface, 0, 0, ui_width, ui_height );

surface_free( surface );

//Draw Primary Surface

draw_surface_general( application_surface, 0, 0, surface_width, surface_height, pad_w, pad_h, scale, scale, 0, c_white, c_white, c_white, c_white, 1);