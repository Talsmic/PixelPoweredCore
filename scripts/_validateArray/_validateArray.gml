///_validateArray(input,[min_length],[max_length],[default_input],[fill_event]);
/// @arg input					{any}
/// @arg [min_length]			{integer}	(default: 1)
/// @arg [max_length]			{integer}	(default: -1)
/// @arg [default_input]		{array}		(default: [0])
/// @arg [fill_event]			{string}	(default eUpto.loop)
/*
	<< Returns >>	{array_1d}
	Forces the input to return as an array of the correct length
	Useful for when you need an array of X values but are happy to default the later values if they aren't provided
*/ 
#region Arguments & Variables
if argument_count < 1 { show_debug_message("_argArray requires an input"); exit };//[!Break!]~~~~~~>
var _input =			is_array(argument[0]) ? argument[0] : [argument[0]];
var _min_length =		argument_count > 1 ? argument[1] : 1;
var _max_length =		argument_count > 2 ? argument[2] : 100;
var _default =			argument_count > 3 ? (is_array(argument[3]) ? argument[3] : [argument[3]]) : [0];
var fill_event =		argument_count > 4 ? argument[4] : eUpto.loop;
var _input_length =		array_length_1d(_input);
var _default_length =	array_length_1d(_default);
var _fill = 0;
var output = [0];
#endregion

if ( _input_length >= _min_length and _input_length <= _max_length ) return _input;//Array is already perfect[!Break!]

//Add [input]'s values to [output]
for ( var i=0 ; i<_input_length ; ++i ) {
	
	if ( _max_length > 1 and i >= _max_length ) break;
	output[i] = _input[i];
	_fill = _upto(_fill, _default_length-1, 1, fill_event);
	
	};

//Add filler
for ( i=i ; i<=_min_length-1 ; ++i ) {
	
	output[i] = _default[_fill];
	_fill = _upto(_fill, _default_length-1, 1, fill_event);
	
	};

return output;