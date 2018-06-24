///drawSimplebox(x,y,width,height,[colour],[alpha],[{corner_array}],[{trim_array}]);
/// @arg x				{real}
///	@arg y				{real}
/// @arg width			{real}
/// @arg height			{real}
///	@arg [colour]		#c_code#			(default: c_white)
/// @arg [alpha]		{real|0..1}			(default: 1)
/// @arg [corner_array]	{array|booleans}	(default: [0,0,0,0]}
/// @arg [trim_array]	{array|booleans}	(default: [0,1,1,1,1,1,1,1,1,1]}
/*
	<< Returns >> a region of the ui box dimensions
	[[ Draws ]] a ui box of [width],[height] at [x],[y], with optional sharp corners
	Uses the spr_plainbox_4x4 sprite
	Optionally, of [spriteset], [colour] and [alpha]
	
	Spritesets use the image_index format of:
		[1/10][   2   ][3/11]
		[ 4 ][    5    ][ 6 ]
		[7/12][   8   ][9/13]
*/
#region Arguments & Variables
if argument_count < 4 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var draw_x =	argument[0]; 
var draw_y =	argument[1];
var width =		argument[2]; 
var height =	argument[3];
var colour =	argument_count > 4 ? argument[4] : c_black;
var alpha =		argument_count > 5 ? argument[5] : 0.8;
var corner_a =	argument_count > 6 ? argument[6] : [0,0,0,0];
var trim_array = argument_count > 7 ? _validateArray(argument[7], 9, 9, false) : [0,1,1,1,1,1,1,1,1,1];
#endregion

__draw_tilebox(draw_x,draw_y,width,height,colour,alpha,spr_plainbox_4x4,corner_a,trim_array);

return [draw_x,draw_y,draw_x+width,draw_y+height,width,height];