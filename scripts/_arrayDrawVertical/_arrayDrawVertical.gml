///_arrayDrawVertical(x,y,array,[colour],[alpha],[spacing],[clipwidth],[clip_note]);
/// @arg x			{real}
/// @arg y			{real}
/// @arg array		{array}
/// @arg [colour]	#c_code#		(default: draw_get_colour();)
/// @arg [alpha]	{real|0..1}		(default: draw_get_alpha();)
/// @arg [spacing]	{array|real}	(default: string_height("|"))
/// @arg [clipwidth] {integer}		(default: 0)
/// @arg [clip_note] {string}		(default: "..")
#region Arguments
if argument_count < 3 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var draw_x =	argument[0];
var draw_y =	argument[1];
var array =		argument[2];
var colour =	argument_count > 3 ? argument[3] : draw_get_colour();
var alpha =		argument_count > 4 ? argument[4] : draw_get_alpha();
var spacing =	argument_count > 5 ? argument[5] : string_height("|");
var clipwidth =	argument_count > 6 ? argument[6] : 0;
var clip_note =	argument_count > 7 ? argument[7] : "..";
#endregion

//Draw
for ( var i=0 ; i<array_length_1d(array) ; ++i ) {
	
	array[i] = string(array[i]);
	if ( array[i] == "" ) { continue };
	
	if clipwidth { array[i] = _stringClip(array[i],clipwidth,clip_note); };
	drawText(draw_x,draw_y,string(array[i]),colour,alpha);
	draw_y += spacing;
	
	};
	