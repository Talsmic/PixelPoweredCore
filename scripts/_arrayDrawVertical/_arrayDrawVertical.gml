///_arrayDrawVertical(x,y,array,[colour],[alpha],[spacing],[clipwidth],[clip_note]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg array			{array}
/// @arg [colour]		#c_code#		(default: draw_get_colour();)
/// @arg [alpha]		{real|0..1}		(default: draw_get_alpha();)
/// @arg [spacing]		{array|real}	(default: string_height("|"))
/// @arg [clipwidth]	{integer}		(default: 0)
/// @arg [clip_note]	{string}		(default: "..")
#region Arguments & Variables
if argument_count < 3 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var _x =				argument[0];
var _y =				argument[1];
var _array =			argument[2];
var _colour_array =		argument_count > 3 ? _asArray(argument[3]) : [draw_get_colour()];
var _alpha_array =		argument_count > 4 ? _asArray(argument[4]) : [draw_get_alpha()];
var _spacing_array =	argument_count > 5 ? _asArray(argument[5]) : [string_height("|")];
var _clipwidth_array =	argument_count > 6 ? _asArray(argument[6]) : [-1];
var _clip_note =		argument_count > 7 ? argument[7] : "..";
#endregion

//Draw
for ( var i=0 ; i<array_length_1d(_array) ; ++i ) {
	
	_array[i] = string(_array[i]);
	if ( _array[i] == "" ) { continue };
		
	if _arrayValue(_clipwidth_array, i) { _array[i] = _stringClip(_array[i], _arrayValue(_clipwidth_array, i), _clip_note) };
	drawText(_x, _y, _array[i], _arrayValue(_colour_array, i), _arrayValue(_alpha_array, i));
	_y += _arrayValue(_spacing_array, i);
	
	};
	