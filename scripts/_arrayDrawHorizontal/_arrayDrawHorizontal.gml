///_arrayDrawHorizontal(x,y,array,[colour],[alpha],[spacing],[clipwidth],[clip_note]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg array			{array}
/// @arg [colour]		#c_code#		(default: draw_get_colour();)
/// @arg [alpha]		{real|0..1}		(default: draw_get_alpha();)
/// @arg [spacing]		{array|real}	(default: 50)
/// @arg [clipwidth]	{integer}		(default: 45)
/// @arg [clip_note]	{string}		(default: "..")
#region Arguments & Variables
if argument_count < 3 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var _x =				argument[0];
var _y =				argument[1];
var _array =			argument[2];
var _colour_array =		argument_count > 3 ? _validateArray(argument[3]) : [draw_get_colour()];
var _alpha_array =		argument_count > 4 ? _validateArray(argument[4]) : [draw_get_alpha()];
var _spacing_array =	argument_count > 5 ? _validateArray(argument[5]) : [50];
var _clipwidth_array =	argument_count > 6 ? _validateArray(argument[6], array_length_1d(_spacing_array)-1, -1, _spacing_array) : _spacing_array;
var _clip_note =		argument_count > 7 ? argument[7] : "..";
#endregion

//Draw
for ( var i=0 ; i<array_length_1d(_array) ; ++i ) {
	
	_array[i] = string(_array[i]);
	if ( _array[i] == "" ) { continue };
		
	if _arrayValue(_clipwidth_array, i) { _array[i] = _stringClip(_array[i], _arrayValue(_clipwidth_array, i), _clip_note) };
	drawText(_x, _y, _array[i], _arrayValue(_colour_array, i), _arrayValue(_alpha_array, i));
	_x += _arrayValue(_spacing_array, i);
	
	};
	