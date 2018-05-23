///draw_text_outline(x,y,string,[colour],[ol_colour],[alpha],[thickness],[shadowed_thickness],[shadow_alpha],[shadow_tint]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg text			{string}
/// @arg [colour]		{c_code}			(default: draw_get_colour())
/// @arg [colour_ol]	{c_code}			(default: colour_ol)
/// @arg [alpha]		{real|0..1}			(default: draw_get_alpha())
/// @arg [thickness]	{integer or array}	(default: 1) (add 0.5 for thickened corners)
/// @arg [thickness2]	{integer or array}	(default: 0) (add 0.5 for thickened corners)
/// @arg [shadow_alpha]	{real|0..1}			(default: 0.2)
/// @arg [shadow_tint]	{c_code}			(default: c_black)
/*
	>>Draws text with an outline
*/
#region Arguments
if argument_count < 3 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~>
var draw_x =		argument[0];
var draw_y =		argument[1];
var text =			argument[2];
var colour =		argument_count > 3 ? argument[3] : draw_get_color();
var colour_ol =		argument_count > 4 ? argument[4] : c_black;
var alpha =			argument_count > 5 ? argument[5] : draw_get_alpha();
var thickness =		argument_count > 6 ? fix_array_1d(argument[6],4,4,0,0) : [1,1,1,1];
var thickness2 =	argument_count > 7 ? fix_array_1d(argument[7],4,4,0,0) : [0,0,0,0];
var shadow_alpha =	argument_count > 8 ? argument[8] : 0.2;
var shadow_tint =	argument_count > 9 ? argument[9] : c_black;
var thickA, thickB, thick2A, thick2B;
for ( var t=0 ; t<4 ; t++ ) {
	thickness2[t] = thickness2[t] > thickness[t] ? thickness2[t] : thickness[t] ;
	thickA[t] = floor(thickness[t]);
	thickB[t] = frac(thickness[t]);
	thickB[t] = thickA[t] > 0 ? thickA[t]+(thickB[t]*2)-1 : 0;
	thick2A[t] = floor(thickness2[t]);
	thick2B[t] = frac(thickness2[t]);
	thick2B[t] = thick2A[t] > 0 ? thick2A[t]+(thick2B[t]*2)-1 : 0;	
	};
var shadow_colour = merge_colour(colour_ol, shadow_tint, shadow_alpha);
#endregion

var text_region = region_bytext(draw_x,draw_y,text);
text_region = region_adjust(text_region,thick2A);
var stored_align = [global.AlignX,global.AlignY];
set_align();

//Create Surface
var text_surface = surface_create(text_region[eR.w], text_region[eR.h]);
var surfacedraw_x = thick2A[0];
var surfacedraw_y = thick2A[1];

//Draw to Surface
surface_set_target(text_surface) {
	
	draw_clear_alpha(c_white, 0);	
	var i, j;
	//Shaded Outline
	if ( comparearrays_hasgreater_1d(thickness2,thickness) ) {
		for ( i=-thick2A[0] ; i<=thick2A[2] ; i++ ) {
			for ( j=-thick2B[1] ; j<=thick2B[3] ; j++ ) {
				draw_text_flatcolour(surfacedraw_x+i,surfacedraw_y+j,text,shadow_colour,1);
				};
			};
		for ( j=-thick2A[1] ; j<=thick2A[3] ; j++ ) {
			for ( i=-thick2B[0] ; i<=thick2B[2] ; i++ ) {
				draw_text_flatcolour(surfacedraw_x+i,surfacedraw_y+j,text,shadow_colour,1);
				};
			};
		};
		
	//Outline
	for ( i=-thickA[0] ; i<=thickA[2] ; i++ ) {
		for ( j=-thickB[1] ; j<=thickB[3] ; j++ ) {
			draw_text_flatcolour(surfacedraw_x+i,surfacedraw_y+j,text,colour_ol,1);
			};
		};
	for ( j=-thickA[1] ; j<=thickA[3] ; j++ ) {
		for ( i=-thickB[0] ; i<=thickB[2] ; i++ ) {
			draw_text_flatcolour(surfacedraw_x+i,surfacedraw_y+j,text,colour_ol,1);
			};
		};
		
	//Normal Text
	draw_text_flatcolour(surfacedraw_x,surfacedraw_y,text,colour,1);
	
} surface_reset_target();
//Draw Surface
set_align(stored_align[0],stored_align[1]);
switch ( global.AlignX ) { 
	case fa_center: draw_x -= string_width(text) div 2; break; 
	case fa_right:  draw_x -= string_width(text); break; 
	};
switch ( global.AlignY ) { 
	case fa_center: draw_y -= string_height(text) div 2; break; 
	case fa_right:  draw_y -= string_height(text); break; 
	};
draw_surface_ext(text_surface,draw_x-thickA[0],draw_y-thickA[1],1,1,0,c_white,alpha);
surface_free(text_surface);