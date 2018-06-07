///parseText(text,[punctuation_breaks],[space_breaks]);
/// @arg text					{string}
/// @arg [punctuation_breaks]	{array|strings}	(default: [".",",","!","?","#",":",";"])
/// @arg [space_breaks]			{array|strings}	(default: [" "])
/// @arg [format_breaks]		{array|strings}	(default: ["|"])
/*
	[Edited 24/4/2018]
	Converts a string of text into an array of words with unique colour codes
*/ 
#region Arguments & Variables
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var input =			argument[0];
var punctuation =	argument_count > 1 ? argument[1] : [".",",","!","?","#",":",";"];
var space_breaks =	argument_count > 2 ? argument[2] : [" "];
var format_breaks =	argument_count > 3 ? argument[3] : ["|"];
#endregion

//Clear previous parse
ParsedText = 0;
ParsedText_Colour = 0;
ParsedText_Format = 0;
global.ParsedText = 0; 
global.ParsedText_Colour = 0; 

var parse_reference = 1;
//var pos, break_ref, break_pos, punctuation_ref, punctuation_pos, cutsize, i, j;
var space_pos, punctuation_pos, format_pos, j, i, c, found_formatting;

#region Parse Text
do {
	
	//Check the position of space_breaks (default: [" "])
	space_pos = _arrayValue(_stringPosFromArray(input, space_breaks));
	
	if ( space_pos ) {
		//Snip @spaces
		ParsedText[parse_reference] = string_copy(input, 0, space_pos);
		input = string_delete(input, 1, space_pos);
		
		// Check the position of punctuation (default: [".",",","!","?","#",":",";"])
		punctuation_pos = _arrayValue(_stringPosFromArray(input, punctuation));
		
		//Snip @punctuation
		if ( punctuation_pos ) {	
			ParsedText[parse_reference+1] = string_delete(ParsedText[parse_reference], 1, punctuation_pos);
			ParsedText[parse_reference] = string_copy(ParsedText[parse_reference], 0, punctuation_pos);
			parse_reference++;
			};
		
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
		
	} until ( input == "" or !space_pos );
#endregion
	
#region Parse Formatting and Colours
for ( j=0 ; j<array_length_1d(ParsedText) ;  ++j ) {
	
	ParsedText_Colour[j] = -1;	
	ParsedText_Format[j] = -1;
	found_formatting = 0;
	c= 0;
	
	#region Split Formatting (default: ["|"])
	do {
		
		format_pos = _arrayValue(_stringPosFromArray(input, format_breaks));		
		if ( format_pos ) {		
			space_pos = string_pos( " ", ParsedText[j] );
			ParsedText[j] = string_replace_all( ParsedText[j], " ", "" );
			found_formatting[c] = string_delete( ParsedText[j], 1, format_pos );
			ParsedText[j] = string_copy( ParsedText[j], 0, format_pos-1 );
			if ( punctuation_pos ) { ParsedText[j] += " " }; 	//Add a space if one existed before the split
			};		
		c++;
			
		} until ( ParsedText[j] == "" or !format_pos );
	#endregion
	
	#region Convert Formatting and Colours
	for ( i=c ; i>0 ; ++i ) {
		
		switch found_formatting[i] {		
			case -1: case "": break;
		
			case "bold": case "b":
				ParsedText_Format[j] = eFontStyle.bold; break;
			case "condensed": case "c":
				ParsedText_Format[j] = eFontStyle.condensed; break;
			case "squished":
				ParsedText_Format[j] = eFontStyle.squished; break;			
			
			default: //Assume it's a colourcode
				ParsedText_Colour[j] = findColour(found_formatting[i]);
				break;			
			};
			
		};
	#endregion
	
	};
#endregion

//Save parse and Return
global.ParsedText = ParsedText; 
global.ParsedText_Colour = ParsedText_Colour; 
global.ParsedText_Format = ParsedText_Format; 
return [ParsedText, ParsedText_Colour, ParsedText_Format];