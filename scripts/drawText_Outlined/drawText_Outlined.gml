///drawText_Outlined(x,y,text,[colour],[ol_colour],[alpha],[thickness],[shadowed_thickness],[shadow_alpha],[shadow_tint]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg text			{string}
/// @arg [colour]		#c_code# OR {array}		(default: draw_get_colour())
/// @arg [colour_ol]	#c_code# OR {array}		(default: colour_ol)
/// @arg [alpha]		{real|0..1}				(default: draw_get_alpha())
/// @arg [thickness]	{integer} OR {array}	(default: 1) (add 0.5 for thickened corners)
/// @arg [thickness2]	{integer} OR {array}	(default: 0) (add 0.5 for thickened corners)
/// @arg [shadow_alpha]	{real|0..1}				(default: 0.2)
/// @arg [shadow_tint]	#c_code#				(default: c_black)
/*
	[[ Draws ]] _text with an outline
*/
#region Arguments & Variables
if argument_count < 3 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var _x =			argument[0];
var _y =			argument[1];
var _text =			argument[2];
var _colourA =		argument_count > 3 ? argument[3] : draw_get_color();
var _colourB =		argument_count > 4 ? argument[4] : c_black;
var _alpha =		argument_count > 5 ? argument[5] : draw_get_alpha();
var _thicknessA =	argument_count > 6 ? _arrayOfLength(argument[6], 4) : [1.5, 1.5, 1.5, 1.5];
var _thicknessB =	argument_count > 7 ? _arrayOfLength(argument[7], 4) : [0, 0, 0, 0];
var _alphaB =		argument_count > 8 ? argument[8] : 0.2;
var _colourC =		argument_count > 9 ? argument[9] : c_black;
var _thickA, _thickB, _shadowA, _shadowB;
for ( var t=0 ; t<4 ; ++t ) {
	_thicknessB[t] = _thicknessB[t] > _thicknessA[t] ? _thicknessB[t] : _thicknessA[t] ;
	_thickA[t] = floor(_thicknessA[t]);
	_thickB[t] = frac(_thicknessA[t]);
	_thickB[t] = _thickA[t] > 0 ? _thickA[t]+(_thickB[t]*2)-1 : 0;
	_shadowA[t] = floor(_thicknessB[t]);
	_shadowB[t] = frac(_thicknessB[t]);
	_shadowB[t] = _shadowA[t] > 0 ? _shadowA[t]+(_shadowB[t]*2)-1 : 0;	
	};
var _colourS = merge_colour(_colourB, _colourC, _alphaB);
#endregion

var _region =	_textRegion(_x, _y, _text);
_region =		_alterRegion(_region, _shadowA);
var saved_align = [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo];
_setAlign();

//Create Surface
var _surface = surface_create(_region[aR.w], _region[aR.h]);
var _surf_x = _shadowA[0];
var _surf_y = _shadowA[1];

#region Draw to Surface
surface_set_target( _surface ) {
	
	draw_clear_alpha(c_white, 0);	
	var i, j;
	//Shaded Outline
	if ( _arrayCompare_Greaters(_thicknessB, _thicknessA) ) {
		draw_set_color(_colourS);
		for ( i=-_shadowA[0] ; i<=_shadowA[2] ; ++i ) {
			for ( j=-_shadowB[1] ; j<=_shadowB[3] ; ++j ) {
				draw_text(_surf_x+i, _surf_y+j, _text);
				};
			};
		for ( j=-_shadowA[1] ; j<=_shadowA[3] ; ++j ) {
			for ( i=-_shadowB[0] ; i<=_shadowB[2] ; ++i ) {
				draw_text(_surf_x+i, _surf_y+j, _text);
				};
			};
		};
		
	//Outline
	draw_set_color(_colourB);
	for ( i=-_thickA[0] ; i<=_thickA[2] ; ++i ) {
		for ( j=-_thickB[1] ; j<=_thickB[3] ; ++j ) {
			draw_text(_surf_x+i, _surf_y+j, _text);
			};
		};
	for ( j=-_thickA[1] ; j<=_thickA[3] ; ++j ) {
		for ( i=-_thickB[0] ; i<=_thickB[2] ; ++i ) {
			draw_text(_surf_x+i, _surf_y+j, _text);
			};
		};
		
	//Normal Text
	draw_text_colour(_surf_x, _surf_y, _text, _colourA, _colourA, _colourA, _colourA, 1);
	
} surface_reset_target(); 
#endregion

//Correct For Alignment
_setAlign(saved_align);
var _draw = _magicDrawPoint(_x, _y, _text, [saved_align[0], saved_align[1], 0, 0]);
_draw[0] -= floor(_thicknessA[0]) > floor(_thicknessB[0]) ? floor(_thicknessA[0]) : floor(_thicknessB[0]);
_draw[1] -= floor(_thicknessA[1]) > floor(_thicknessB[1]) ? floor(_thicknessA[1]) : floor(_thicknessB[1]);

//Draw Surface
draw_surface_ext(_surface, _draw[0], _draw[1], 1, 1, 0, c_white, _alpha);
surface_free(_surface);

//draw_anchor(_x, _y, c_blue)
//debug_region( _region, c_black );
//drawText(_x, _y, _text, c_purple, 0.5)