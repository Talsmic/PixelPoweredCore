///drawTilebox(box_region,[spriteset],[colour],[alpha],[{corner_array}],[{trim_array}]);
/// @arg box_region		#region#
/// @arg [spriteset]	{Sprite_ID}			(default: spr_tilebox_4x4)
///	@arg [colour]		#c_code#			(default: draw_get_color())
/// @arg [alpha]		{real|0..1}			(default: draw_get_alpha())
/// @arg [corner_array]	{array|booleans}	(default: [0,0,0,0]}
/// @arg [trim_array]	{array|booleans}	(default: [0,1,1,1,1,1,1,1,1,1]}


draw_tilebox(


/// @arg [a0]		{datatype}		(default: )
/// @arg [a1]		{real}			(default: )
/// @arg [a2]		{integer}		(default: )
/// @arg [a3]		{boolean}		(default: )
/// @arg [a4]		{string}		(default: )
/// @arg [a5]		{array}			(default: )
/// @arg [a6]		{array_2d}		(default: )
/// @arg [a7]		{datatype}		(default: )
/// @arg [a8]		{datatype}		(default: )
/// @arg [a9]		{datatype}		(default: )
/*
	<< Returns >>	{datatype}	desc
	>> Stores <<	[unlisted]{datatype}	desc
	<< Pushes >>	global.[targetvar]{datatype}	desc
	[[ Draws ]]		[desc]
	Function Description
*/ 
#region Arguments
if argument_count < 4 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var a0 =	argument_count > 0 ? argument[0] : 0;
var a1 =	argument_count > 1 ? argument[1] : 0;
var a2 =	argument_count > 2 ? argument[2] : 0;
var a3 =	argument_count > 3 ? argument[3] : 0;
var a4 =	argument_count > 4 ? argument[4] : 0;
var a5 =	argument_count > 5 ? argument[5] : 0;
var a6 =	argument_count > 6 ? argument[6] : 0;
var a7 =	argument_count > 7 ? argument[7] : 0;
var a8 =	argument_count > 8 ? argument[8] : 0;
var a9 =	argument_count > 9 ? argument[9] : 0;
var output;
#endregion