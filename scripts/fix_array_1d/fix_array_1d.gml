///fix_array_1d(input,[min_length],[max_length],[filler],[fillwithvalue]);
/// @arg input				{any}	
/// @arg [min_length]		{integer}	(default: 1)
/// @arg [max_length]		{integer}	(default: 10000)
/// @arg [filler]			{any}		(default: 0)
/// @arg [fillwithvalue]	{integer}	(default: -1)
/*	
	>>Returns	{array}[input]
	Forces the input to return as a 1d array [optionally of [min_length],[max_length]]
	
*/
#region Arguments
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~>
var input =			as_array(argument[0]);
var input_h = array_height_2d(input); var input_l = array_length_1d(input);
var min_length =	argument_count > 1 ? argument[1] : 1;
var max_length =	argument_count > 2 ? argument[2] : 10000;
var filler =		argument_count > 3 ? as_array(argument[3]) : [0];
var fillwithvalue =	argument_count > 4 ? argument[4] : -1; //Set to >0 to fill with an earlier value in the array
var f = 0;
var output = false;
#endregion

if ( input_h == 1 and input_l >= min_length and input_l <= max_length ) { 
	return input;//Array is already perfect[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~~~>
	};

//Add [input]'s values
for ( var i=0 ; i<input_l ; i++ ) {
	if max_length > 1 and i >= max_length break; //break on max_length
	output[i] = input[i]; //Add value to output
	f = upto(f, array_length_1d(filler)-1, true); //increment f
	};

//Add filler
for ( i=i ; i<=min_length-1 ; i++ ) {
	if max_length > 1 and i >= max_length break; //break on max_length
	if fillwithvalue >= 0 { output[i] = output[fillwithvalue] }
	else			 { output[i] = filler[f] }; //Add filler
	f = upto(f, array_length_1d(filler)-1, true); //increment f
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