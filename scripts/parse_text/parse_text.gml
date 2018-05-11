///parse_text(text,default_colour);
/// @arg text		
/// @arg default_colour	
/*
	[Edited 24/4/2018]
	Converts a string of text into an array of words with unique colour codes
*/

var text = argument0;
var default_colour = argument1;

//Clear previous parse
ParsedText = 0;
ParsedText_Colour = 0;
global.ParsedText = 0; 
global.ParsedText_Colour = 0; 

var parse_reference = 1;
var position;

//Parse Text
repeat 500 {
	//Find the next " " [Space]
	position[1] = string_pos(" ",text);
	//Cut
	if ( position[1] ) {
		ParsedText[parse_reference] = string_copy(text, 0, position[1]);
		text = string_delete(text, 1, position[1]);
		//Find any punctuation "." "," "!" "?" (This method should only split punctionation once, conserving clumps (... !?! etc))
		position[2] = string_pos(".",ParsedText[parse_reference]);
		position[3] = string_pos(",",ParsedText[parse_reference]);
		position[4] = string_pos("!",ParsedText[parse_reference]);
		position[5] = string_pos("?",ParsedText[parse_reference]);
		position[6] = string_pos("#",ParsedText[parse_reference]);
		position[7] = string_pos(":",ParsedText[parse_reference]);
		//Cut "."
		if ( position[2] ) {
			ParsedText[parse_reference+1] = string_delete(ParsedText[parse_reference],1,position[2]-1);
			ParsedText[parse_reference] = string_copy(ParsedText[parse_reference],1,position[2]-1);
			parse_reference+=2;
			continue;
			};
		//Cut ","
		if ( position[3] ) {
			ParsedText[parse_reference+1] = string_delete(ParsedText[parse_reference],1,position[3]-1);
			ParsedText[parse_reference] = string_copy(ParsedText[parse_reference],1,position[3]-1);
			parse_reference+=2;
			continue;
			};
		//Cut "!"
		if ( position[4] ) {
			ParsedText[parse_reference+1] = string_delete(ParsedText[parse_reference],1,position[4]-1);
			ParsedText[parse_reference] = string_copy(ParsedText[parse_reference],1,position[4]-1);
			parse_reference+=2;
			continue;
			};
		//Cut "?"
		if ( position[5] ) {
			ParsedText[parse_reference+1] = string_delete(ParsedText[parse_reference],1,position[5]-1);
			ParsedText[parse_reference] = string_copy(ParsedText[parse_reference],1,position[5]-1);
			parse_reference+=2;
			continue;
			};
		//Cut "#"
		if ( position[6] ) {
			ParsedText[parse_reference+1] = string_delete(ParsedText[parse_reference],1,position[6]-1);
			ParsedText[parse_reference] = string_copy(ParsedText[parse_reference],1,position[6]-1);
			parse_reference+=2;
			continue;
			};
		//Cut ":"
		if ( position[7] ) {
			ParsedText[parse_reference+1] = string_delete(ParsedText[parse_reference],1,position[6]-1);
			ParsedText[parse_reference] = string_copy(ParsedText[parse_reference],1,position[6]-1);
			parse_reference+=2;
			continue;
			};
		parse_reference++;
		
		};
	//If no spaces are found, end the parse.
	if ( position[1] == 0 ) { 
		ParsedText[parse_reference] = text;
		parse_reference++;
		break; 
		};
	};
	
//Parse Colours
var i;
for ( i=1 ; i<parse_reference ;  i++ ) {
	ParsedText_Colour[i] = default_colour;
	//Find the next "|" [Colour Break]
	position[1] = string_pos(" ",ParsedText[i]);	
	position[2] = string_pos("|",ParsedText[i]);	
	//If a colour break exists... 
	if ( position[2] ) {
		//Split the string
		ParsedText_Colour[i] = string_delete( ParsedText[i], 1, position[2] );
		ParsedText[i] = string_copy(ParsedText[i],0,position[2]-1);
		//Remove Spaces
		ParsedText_Colour[i] = string_replace_all( ParsedText_Colour[i], " ", "" );
		//Find ColourCode
		ParsedText_Colour[i] = find_colour(ParsedText_Colour[i]);
		//Add a space if one existed before the split
		if ( position[1] ) { ParsedText[i] += " " };
		};
	};
	
//Save parse and Return
global.ParsedText = ParsedText; 
global.ParsedText_Colour = ParsedText_Colour; 
return ParsedText;
