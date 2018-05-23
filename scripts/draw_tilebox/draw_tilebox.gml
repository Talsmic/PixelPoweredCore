///draw_tilebox(x,y,width,height,[colour],[alpha],[spriteset],[{corner_array}],[{trim_array}]);
/// @arg x				{real}
///	@arg y				{real}
/// @arg width			{real}
/// @arg height			{real}
///	@arg [colour]		{c_code}			(default: draw_get_color())
/// @arg [alpha]		{real|0..1}			(default: draw_get_alpha())
/// @arg [spriteset]	{Sprite_ID}			(default: spr_tilebox_4x4)
/// @arg [corner_array]	{array|booleans}	(default: [1,1,1,1]}
/// @arg [trim_array]	{array|booleans}	(default: [0,1,1,1,1,1,1,1,1,1]}
/*
	>>Returns a region of the ui box dimensions
	>>Draws a ui box of [width],[height] at [x],[y], with optional sharp corners
	Optionally, of [spriteset], [colour] and [alpha]
	
	Spritesets use the image_index format of:
		[1/10][   2   ][3/11]
		[ 4 ][    5    ][ 6 ]
		[7/12][   8   ][9/13]
*/
#region Arguments
if argument_count < 4 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~>
var draw_x =	argument[0]; 
var draw_y =	argument[1];
var width =		argument[2]; 
var height =	argument[3];
var colour =	argument_count > 4 ? argument[4] : draw_get_color();
var alpha =		argument_count > 5 ? argument[5] : draw_get_alpha();
var spriteset =	argument_count > 6 ? argument[6] : spr_tilebox_4x4;
var corner_a =	argument_count > 7 ? fix_array_1d(argument[7],4,4,false) : [1,1,1,1];
var trim_array = argument_count > 8 ? fix_array_1d(argument[8],9,9,false) : [0,1,1,1,1,1,1,1,1,1];
var tw = sprite_get_width(spriteset);
var th = sprite_get_height(spriteset);
#endregion

#region Corners and Clipping
var corner = [1,3,7,9];
corner[eCorner.topL] = corner_a[eCorner.topL] ? 10 : 1;
corner[eCorner.topR] = corner_a[eCorner.topR] ? 11 : 3;
corner[eCorner.botL] = corner_a[eCorner.botL] ? 12 : 7;
corner[eCorner.botR] = corner_a[eCorner.botR] ? 13 : 9;
//When trim_array[0] = true, the function is allowed to change clipping itself
if trim_array[0] != 0 {
	
	if ( corner_a[eCorner.topL] and corner_a[eCorner.topR] ) { trim_array[TOP] = 0 }; //Trim top
	if ( corner_a[eCorner.botL] and corner_a[eCorner.botR] ) { trim_array[BOTTOM] = 0 }; //Trim bottom
	if ( corner_a[eCorner.topL] and corner_a[eCorner.botL] ) { trim_array[LEFT] = 0 }; //Trim left
	if ( corner_a[eCorner.topR] and corner_a[eCorner.botR] ) { trim_array[RIGHT] = 0 }; //Trim right
	
	if ( width <= tw )  { width = tw };
	if ( width <= tw*trim_array[LEFT] + tw*trim_array[RIGHT] ) {
		if ( corner_a[eCorner.topL] and trim_array[LEFT] )	{ trim_array[LEFT] = 0 };
		if ( corner_a[eCorner.botL] and trim_array[LEFT] )	{ trim_array[LEFT] = 0 };
		if ( corner_a[eCorner.topR] and trim_array[RIGHT] ) { trim_array[RIGHT] = 0 };
		if ( corner_a[eCorner.botR] and trim_array[RIGHT] ) { trim_array[RIGHT] = 0 };
		};
		
	if ( height <= th ) { height = th };
	if ( height <= th*trim_array[TOP] + th*trim_array[BOTTOM] ) {
		if ( corner_a[eCorner.topL] and trim_array[TOP] )	 { trim_array[TOP] = 0 };
		if ( corner_a[eCorner.topR] and trim_array[TOP] )	 { trim_array[TOP] = 0 };
		if ( corner_a[eCorner.botL] and trim_array[BOTTOM] ) { trim_array[BOTTOM] = 0 };
		if ( corner_a[eCorner.botR] and trim_array[BOTTOM] ) { trim_array[BOTTOM] = 0 };
		};	
	
	};
#endregion

#region Height and Width
if ( height < th*trim_array[TOP] + th*trim_array[BOTTOM] ) { height = th*trim_array[TOP] + th*trim_array[BOTTOM] };
var bh = height - th*trim_array[TOP] - th*trim_array[BOTTOM];
if ( width < tw*trim_array[LEFT] + tw*trim_array[RIGHT] ) { width = tw*trim_array[LEFT] + tw*trim_array[RIGHT] };
var bw = width - tw*trim_array[TOP] - tw*trim_array[BOTTOM];
#endregion

#region Draw 
var xx = draw_x; 
var yy = draw_y;
//Top Left Corner [Frame 1]
if trim_array[TOP] or trim_array[LEFT]		{ draw_sprite_ext			(spriteset,	corner[eCorner.topL],	xx,	yy,	1,1,0,	colour,	alpha); xx += tw };
//Top Border [Frame 2]
if trim_array[TOP]							{ draw_sprite_stretched_ext	(spriteset,	2,						xx,	yy,	bw,th,	colour,	alpha); xx += bw };
//Top Right Corner [Frame 3]
if trim_array[TOP] or trim_array[RIGHT]		{ draw_sprite_ext			(spriteset,	corner[eCorner.topR],	xx,	yy,	1,1,0,	colour,	alpha) };
//Left Border [Frame 4]
xx = draw_x; 
if trim_array[TOP] yy+= th;
if trim_array[LEFT]							{ draw_sprite_stretched_ext	(spriteset,	4,						xx,	yy,	tw,bh,	colour,	alpha); xx += tw };
//Body [Frame 5]
											{ draw_sprite_stretched_ext	(spriteset,	5,						xx,	yy,	bw,bh,	colour,	alpha); xx += bw };
//Right Border [Frame 6]
if trim_array[RIGHT]						{ draw_sprite_stretched_ext	(spriteset,	6,						xx,	yy,	tw,bh,	colour,	alpha) };
//Bottom Left Corner [Frame 7]
xx = draw_x; 
if trim_array[TOP] yy+= bh;
if trim_array[BOTTOM] or trim_array[LEFT]	{ draw_sprite_ext			(spriteset,	corner[eCorner.botL],	xx,	yy,	1,1,0,	colour,	alpha); xx += tw };
//Bottom Border [Frame 8]
if trim_array[BOTTOM]						{ draw_sprite_stretched_ext	(spriteset,	8,						xx,	yy,	bw,th,	colour,	alpha); xx += bw };
//Bottom Right Corner [Frame 9]
if trim_array[BOTTOM] or trim_array[RIGHT]	{ draw_sprite_ext			(spriteset,	corner[eCorner.botR],	xx,	yy,	1,1,0,	colour,	alpha) };
#endregion

return [draw_x,draw_y,draw_x+width,draw_y+height,width,height];