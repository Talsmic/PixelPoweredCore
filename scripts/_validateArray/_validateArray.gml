///_validateArray(input,[min_length],[max_length],[default_input],[fill_event]);
/// @arg input					{any}
/// @arg [min_length]			{integer}	(default: 1)
/// @arg [max_length]			{integer}	(default: 100)
/// @arg [default_input]		{array}		(default: [0])
/// @arg [fill_event]			{string}	(default "loop")
/*
	<< Returns >>	{array_1d}
	Forces the input to return as an array of the correct length
	Useful for when you need an array of X values but are happy to default the later values if they aren't provided
*/ 
#region Arguments
if argument_count < 1 { show_debug_message("_argArray requires an input"); exit };//[!Break!]~~~~~~>
var input =				is_array(argument[0]) ? argument[0] : [argument[0]];
var min_length =		argument_count > 1 ? argument[1] : 1;
var max_length =		argument_count > 2 ? argument[2] : 100;
var default_input =		argument_count > 3 ? argument[3] : [0];
var fill_event =		argument_count > 4 ? argument[4] : "loop";
var input_length =		array_length_1d(input);
var default_length =	array_length_1d(default_input);
var fill = 0;
var output = [0];
#endregion

if ( input_length >= min_length and input_length <= max_length ) return input;//Array is already perfect[!Break!]

//Add [input]'s values to [output]
for ( var i=0 ; i<input_length ; i++ ) {
	
	if ( max_length > 1 and i >= max_length ) break;
	output[i] = input[i];
	fill = _upto(fill, default_length-1, 1, fill_event);
	
	};

//Add filler
for ( i=i ; i<=min_length-1 ; i++ ) {
	
	output[i] = default_input[fill];
	fill = _upto(fill, default_length-1, 1, fill_event);
	
	};

return output;

/*[Notes]=======================================================================
	-	If [input] was an array of the correct size, [input] returns unchanged.
	-	If [input] was a 2d array, only column 0 is returned.
	-	If [input] was an array of the wrong length, [input] is extended or 
		shortened, adding [filler] to the end, or removing the end values.
	-	If [input] was not an array, output[0] is the original varuable and 
		[filler] is	added to the end of the array to reach the required length.
	-	[filler] can be an array itself, it will add it's individual values from 
		the point [input] is empty and loop if it runs out of runway