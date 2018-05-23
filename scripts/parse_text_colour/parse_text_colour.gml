///parse_text_colour(text,[default_colour],[punctuation_breaks],[space_breaks]);
/// @arg text					{string}
/// @arg [default_colour]		{c_code}		(default: draw_get_colour())
/// @arg [punctuation_breaks]	{array|strings}	(default: [".",",","!","?","#",":",";"])
/// @arg [space_breaks]			{array|strings}	(default: [" "])
/// @arg [colour_breaks]		{array|strings}	(default: ["|"])
/*
	[Edited 24/4/2018]
	Converts a string of text into an array of words with unique colour codes
*/ 
#region Arguments
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~>
var input =			argument[0];
var default_colour = argument_count > 1 ? argument[1] : c_orange;
var punctuation =	argument_count > 2 ? argument[2] : [".",",","!","?","#",":",";"];
var breaks =		argument_count > 3 ? argument[3] : [" "];
var colour_breaks =	argument_count > 4 ? argument[4] : ["|"];
#endregion

//Clear previous parse
ParsedText = 0;
ParsedText_Colour = 0;
global.ParsedText = 0; 
global.ParsedText_Colour = 0; 

var parse_reference = 1;
var posA, stored_posA, breaks_ref, posB, stored_posB, punctuation_ref, cutsize, i, j;

//Parse Text
do {
	
	#region Check the position of breaks (default: [" "])
	stored_posA = 0; breaks_ref = 0;
	for ( i=0 ; i<array_length_1d(breaks) ; i++ ) {
		posA[i] = string_pos( breaks[i], input );
		if posA[i] > stored_posA  { stored_posA = posA[i]; breaks_ref = i };
		};
	#endregion
	
	if ( stored_posA ) {
		#region Snip at posA
		ParsedText[parse_reference] = string_copy(input, 0, stored_posA);
		input = string_delete(input, 1, stored_posA);
		#endregion
		
		#region Check the position of punctuation (default: [".",",","!","?","#",":",";"])
		stored_posB = 0; punctuation_ref = 0;
		for ( i=0 ; i<array_length_1d(punctuation) ; i++ ) {
			posB[i] = string_pos( punctuation[i], ParsedText[parse_reference] );
			if posB[i] > stored_posB  { stored_posB = posB[i]; punctuation_ref = i };
			} 
		#endregion
		
		#region Snip at posB
		if ( stored_posB ) {	
			cutsize = string_length(punctuation[punctuation_ref]);
			ParsedText[parse_reference+1] = string_copy(ParsedText[parse_reference], stored_posB, cutsize);
			ParsedText[parse_reference] = string_copy(ParsedText[parse_reference], 0, stored_posB);
			parse_reference++;
			};
		#endregion
		
		//Increase count and loop
		parse_reference++;
		continue;
		}
	else {
		ParsedText[parse_reference] = input;
		output[parse_reference] = input;
		parse_reference++;
		break; 
		};
		
	} until ( input == "" or !stored_posA );

	
//Parse Colours
for ( j=0 ; j<array_length_1d(ParsedText) ;  j++ ) {
	
	ParsedText_Colour[j] = default_colour;
	
	#region Check the position of colour breaks (default: ["|"])
	stored_posA = 0; breaks_ref = 0;
	posB[0] = string_pos( " ", ParsedText[j] );
	for ( i=0 ; i<array_length_1d(colour_breaks) ; i++ ) {
		posA[i] = string_pos( colour_breaks[i], ParsedText[j] );
		if posA[i] > stored_posA  { stored_posA = posA[i]; breaks_ref = i };
		};
	#endregion
	
	#region Split Colour
	if ( stored_posA ) {		
		ParsedText[j] = string_replace_all( ParsedText[j], " ", "" );
		ParsedText_Colour[j] = string_delete( ParsedText[j], 1, stored_posA );
		ParsedText[j] = string_copy( ParsedText[j], 0, stored_posA-1 );
		ParsedText_Colour[j] = find_colour(ParsedText_Colour[j]);	
		if ( posB[0] ) { ParsedText[j] += " " }; 	//Add a space if one existed before the split
		};
	#endregion
		
	};

//Save parse and Return
global.ParsedText = ParsedText; 
global.ParsedText_Colour = ParsedText_Colour; 
return ParsedText_Colour;