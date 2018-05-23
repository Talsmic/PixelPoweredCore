///draw_parsed_text(x,y,[text_array],[colour_array],[alpha],[max_width],[spacing],[line_breaks],[font]);
/// @arg x					{real}
/// @arg y					{real}
/// @arg [text_array]		{array|strings}	(default: global.ParsedText)
/// @arg [colour_array]		{array|c_codes}	(default: global.ParsedText_Colour)
/// @arg [format_array]		{array|c_codes}	(default: global.ParsedText_Format)
/// @arg [default_colour]	{c_code}		(default: draw_get_colour())
/// @arg [alpha]			{real|0..1}		(default: draw_get_alpha())
/// @arg [max_width]		{integer}		(default: -1)
/// @arg [spacing]			{integer}		(default: string_height("|"))
/// @arg [line_breaks]		{array|strings}	(default: ["#"])
/// @arg [default_colour]	{c_code}		(default: draw_get_colour())
/*
	>>Draws the text outputted by a parse_text command, complete with colour codes
	!USE parse_text FIRST!
*/
#region Arguments
if argument_count < 2 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~>
var draw_x =		argument[0];		
var draw_y =		argument[1];		
var text_array =	argument_count > 2 ? as_array(argument[2]) : as_array(global.ParsedText);
var colour_array =	argument_count > 3 ? as_array(argument[3]) : as_array(global.ParsedText_Colour);
var format_array =	argument_count > 4 ? as_array(argument[4]) : as_array(global.ParsedText_Format);
var default_colour =argument_count > 5 ? argument[5] : draw_get_colour();
var alpha =			argument_count > 6 ? argument[6] : draw_get_alpha();
var max_width =		argument_count > 7 ? argument[7] : -1;
var sep =			argument_count > 8 ? argument[8] : string_height("|");
var line_breaks =	argument_count > 9 ? argument[9] : ["#"];
var x_position = draw_x;
var y_position = draw_y;
#endregion

var posA, stored_posA, breaks_ref, cutsize, i, j, draw_colour, draw_format;

//Draw Loop
for ( i=1 ; i<array_length_1d(text_array) ; i++ ) {
	
	draw_colour = from_array_tocap_1d(colour_array,i) > 0 ? from_array_tocap_1d(colour_array,i) : default_colour;
	draw_format = from_array_tocap_1d(format_array,i);
	
	#region Check the position of line breaks (default: [" "])
	stored_posA = 0; breaks_ref = 0;
	for ( j=0 ; j<array_length_1d(line_breaks) ; j++ ) {
		posA[j] = string_pos( line_breaks[j], text_array[j] );
		if posA[j] > stored_posA  { stored_posA = posA[j]; breaks_ref = j };
		};
	#endregion
	
	#region Natural Linebreaks
	if ( x_position + string_width(text_array[i]) > draw_x + max_width and max_width > 0 ) {
		x_position = draw_x; //Reset x
		y_position += sep; //Increase y
		};
	#endregion
		
	#region Forced Linebreaks
	if ( stored_posA ) {
		cutsize = string_length(line_breaks[breaks_ref]);
		text_array[i] = string_delete(text_array[i], stored_posA, cutsize);
		draw_text_flatcolour( x_position, y_position, text_array[i], draw_colour, alpha );
		x_position = draw_x; //Reset x
		y_position += sep+1; //Increase y
		continue;
		};
	#endregion
	
	//Draw Text
	if ( draw_format != -1 ) { set_font_style(draw_format) };	
	draw_text_flatcolour( x_position, y_position, text_array[i], draw_colour, alpha );
	
	x_position += string_width(text_array[i]); 
	if ( draw_format != -1 ) { set_font_style() };
	//Increase x
	
	};
