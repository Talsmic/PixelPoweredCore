///_stringClip(input,max_length,[clip_note]);
/// @arg input			{string}
/// @arg max_length		{integer}
/// @arg [clip_note]	{string}	(default: "-")
/*
	<< Returns >> {string}: Clipped [input]
*/
#region Arguments
if argument_count < 2 { show_debug_message("ArgError"); return argument[0] };//[!Break!]
var input =  string(argument[0]);
var max_length =	argument[1] > 10 ? argument[1] : 10;
var clip_note =		argument_count > 2 ? argument[2] : "-";
var output = input;
#endregion

if ( max_length < string_width(clip_note) ) { return clip_note };//[!Break!]~~~>

if ( string_width(input) > max_length ) { 
	output += clip_note;
	while ( string_width(output) > max_length ) {
		output = string_delete(output,string_length(output)-string_length(clip_note),1+string_length(clip_note))+clip_note;
		};		
	};
	
return output;