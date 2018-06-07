///_stringPosFromArray(input_string,substring_array);
/// @arg input_string		{string}
/// @arg substring_array	{array} OR {string}
/*
	<< Returns >>	{array} [pos, pos_id, pos_string, pos_length, pos_count];
	Returns an array of information about the location of a substring in the target array
	The substring that "wins" is the one with the lowest pos and in a tie, the earliest in the array
		pos			{integer} Position of the substring
		pos_id		{integer} Which substring from the array
		pos_string	{string}  The substring
		pos_length	{integer} the length of the substring
		pos_count	{integer} how many substrings found a position	
*/ 
#region Arguments & Variables
var input_string =		argument0;
var substring_array =	_validateArray(argument1);
#endregion

var pos = 0;
var pos_count = 0;
var pos_id, pos_string, pos_length, check_pos, i;

for ( i=0 ; i<array_length_1d(substring_array) ; ++i ) {
	
	check_pos = string_pos( substring_array[i], input_string );
	
	if ( check_pos > pos )  { //Is this the biggest pos yet?
		pos = check_pos;
		pos_id = i; 
		pos_string = substring_array[i];
		pos_length = string_length(substring_array[i]);
		};
	if ( check_pos ) { pos_count++ };
	
	};
	
//Return
if ( pos ) { return [pos, pos_id, pos_string, pos_length, pos_count] } else { return [0, 0, "", 0, 0] };