///_arrayDrawGrid(x,y,array,[colour],[alpha],[x_spacing],[y_spacing],[clipwidth],[clip_note]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg array			{array}
/// @arg [colour]		#c_code#		(default: draw_get_colour();)
/// @arg [alpha]		{real|0..1}		(default: draw_get_alpha();)
/// @arg [x_spacing]	{array|real}	(default: 50)
/// @arg [y_spacing]	{array|real}	(default: string_height("|"))
/// @arg [clipwidth]	{integer}		(default: 45)
/// @arg [clip_note]	{string}		(default: "..")
#region Arguments & Variables
if argument_count < 3 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var _x =				argument[0];
var _y =				argument[1];
var _array =			argument[2];
var _colour_array =		argument_count > 3 ? _asArray(argument[3]) : [draw_get_colour()];
var _alpha_array =		argument_count > 4 ? _asArray(argument[4]) : [draw_get_alpha()];
var _spacing_arrayX =	argument_count > 5 ? _asArray(argument[5]) : [50];
var _spacing_arrayY =	argument_count > 6 ? _asArray(argument[6]) : [string_height("|")];
var _clipwidth_array =	argument_count > 7 ? _validateArray(argument[7], array_length_1d(_spacing_arrayX)-1, -1, _spacing_arrayX) : _spacing_arrayX;
var _clip_note =		argument_count > 8 ? argument[8] : "..";
#endregion	

//Draw
for ( var i=0 ; i<array_height_2d(_array) ; ++i ) {
	
	_arrayDrawVertical(_x, _y, _arrayColumnAsArray(_array, i), _colour_array, _alpha_array, _spacing_arrayY, _arrayValue(_clipwidth_array, i), _clip_note);
	_x += _arrayValue(_spacing_arrayX, i);
	
	};
	