///parse_text(text,[default_colour],[punctuation_breaks],[space_breaks]);
/// @arg text					{string}
/// @arg [default_colour]		{c_code}		(default: draw_get_colour())
/// @arg [punctuation_breaks]	{array|strings}	(default: [".",",","!","?","#",":",";"])
/// @arg [space_breaks]			{array|strings}	(default: [" "])
/// @arg [format_breaks]		{array|strings}	(default: ["|"])
/*
	[Edited 24/4/2018]
	Converts a string of text into an array of words with unique colour codes
*/ 
#region Arguments
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~>
var input =			argument[0];
var default_colour = argument_count > 1 ? argument[1] : c_orange;
var punctuation =	argument_count > 2 ? argument[2] : [".",",","!","?","#",":",";"];
var space_breaks =	argument_count > 3 ? argument[3] : [" "];
var format_breaks =	argument_count > 4 ? argument[4] : ["|"];
#endregion

//Clear previous parse
ParsedText = 0;
ParsedText_Colour = 0;
ParsedText_Format = 0;
global.ParsedText = 0; 
global.ParsedText_Colour = 0; 

var parse_reference = 1;
var pos, break_ref, break_pos, punctuation_ref, punctuation_pos, cutsize, i, j;

//Parse Text
do {
	
	#region Check the position of space_breaks (default: [" "])
	break_pos = 0; break_ref = 0;
	for ( i=0 ; i<array_length_1d(space_breaks) ; i++ ) {
		pos[i] = string_pos( space_breaks[i], input );
		if pos[i] > break_pos  { break_pos = pos[i]; break_ref = i };
		};
	#endregion
	
	if ( break_pos ) {
		#region Snip for spaces
		ParsedText[parse_reference] = string_copy(input, 0, break_pos);
		input = string_delete(input, 1, break_pos);
		#endregion
		
		#region Check the position of punctuation (default: [".",",","!","?","#",":",";"])
		punctuation_pos = 0; punctuation_ref = 0;
		for ( i=0 ; i<array_length_1d(punctuation) ; i++ ) {
			pos[i] = string_pos( punctuation[i], ParsedText[parse_reference] );
			if pos[i] > punctuation_pos  { punctuation_pos = pos[i]; punctuation_ref = i };
			} 
		#endregion
		
		#region Snip for punctuation
		if ( punctuation_pos ) {	
			cutsize = string_length(punctuation[punctuation_ref]);
			ParsedText[parse_reference+1] = string_delete(ParsedText[parse_reference], 1, punctuation_pos-1);//string_copy(ParsedText[parse_reference], punctuation_pos, cutsize+1);
			ParsedText[parse_reference] = string_copy(ParsedText[parse_reference], 0, punctuation_pos-1);
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
		
	} until ( input == "" or !break_pos );

	
//Parse Colours
for ( j=0 ; j<array_length_1d(ParsedText) ;  j++ ) {
	
	ParsedText_Colour[j] = -1;
	ParsedText_Format[j] = -1;
	
	#region Check the position of format_breaks (default: ["|"])
	break_pos = 0; break_ref = 0;
	for ( i=0 ; i<array_length_1d(format_breaks) ; i++ ) {
		pos[i] = string_pos( format_breaks[i], ParsedText[j] );
		if pos[i] > break_pos  { break_pos = pos[i]; break_ref = i };
		};
	#endregion
	
	#region Split Formatting
	if ( break_pos ) {		
		punctuation_pos = string_pos( " ", ParsedText[j] );
		ParsedText[j] = string_replace_all( ParsedText[j], " ", "" );
		ParsedText_Format[j] = string_delete( ParsedText[j], 1, break_pos );
		ParsedText[j] = string_copy( ParsedText[j], 0, break_pos-1 );
		if ( punctuation_pos ) { ParsedText[j] += " " }; 	//Add a space if one existed before the split
		};
	#endregion
	
	#region Split Formatting 2 (for if there is a format and a colour)
	break_pos = 0; break_ref = 0;
	for ( i=0 ; i<array_length_1d(format_breaks) ; i++ ) {
		pos[i] = string_pos( format_breaks[i], ParsedText_Format[j] );
		if pos[i] > break_pos  { break_pos = pos[i]; break_ref = i };
		};
	if ( break_pos ) {		
		ParsedText_Colour[j] = ParsedText_Format[j];
		ParsedText_Format[j] = string_delete( ParsedText_Colour[j], 1, break_pos );
		ParsedText_Colour[j] = string_copy( ParsedText_Colour[j], 0, break_pos-1 );
		};
	#endregion
	
	#region Find Formatting and Colours
	switch ParsedText_Format[j] {
		
		case -1: break;
		case "": ParsedText_Format[j] = -1; break;
		
		case "bold": case "b":
			ParsedText_Format[j] = eFontStyle.bold; break;
		case "condensed": case "c":
			ParsedText_Format[j] = eFontStyle.condensed; break;
		case "squished":
			ParsedText_Format[j] = eFontStyle.squished; break;			
			
		default: //Assume it's a colourcode
			ParsedText_Colour[j] = find_colour(ParsedText_Format[j]);
			ParsedText_Format[j] = -1; 
			break;
			
		};
	#endregion
	
	};

//Combine into return
var output = [ParsedText,ParsedText_Colour,ParsedText_Format];


//Save parse and Return
global.ParsedText = ParsedText; 
global.ParsedText_Colour = ParsedText_Colour; 
global.ParsedText_Format = ParsedText_Format; 
return output;