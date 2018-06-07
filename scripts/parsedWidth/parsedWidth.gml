///parsedWidth([text_array],[format_array],[max_width],[line_breaks]);
/// @arg [text_array]		{array|strings}	(default: global.ParsedText)
/// @arg [format_array]		{array|c_codes}	(default: global.ParsedText_Format)
/// @arg [max_width]		{integer}		(default: -1)
/// @arg [line_breaks]		{array|strings}	(default: ["#"])
#region Arguments & Variables
var text_array =	argument_count > 0 ? _validateArray(argument[0]) : _validateArray(global.ParsedText);
var format_array =	argument_count > 1 ? _validateArray(argument[1]) : _validateArray(global.ParsedText_Format);
var max_width =		argument_count > 2 ? argument[2] : -1;
var line_breaks =	argument_count > 3 ? argument[3] : ["#"];
#endregion

var posA, stored_posA, breaks_ref, i, j, draw_format, width_check;
var width = 0;
var x_position = 0;

//Draw Loop
for ( i=1 ; i<array_length_1d(text_array) ; ++i ) {
	
	draw_format = _arrayValue(format_array,i);
	
	#region Check the position of line breaks (default: ["#"])
	stored_posA = 0; breaks_ref = 0;
	for ( j=0 ; j<array_length_1d(line_breaks) ; ++j ) {
		posA[j] = string_pos( line_breaks[j], text_array[j] );
		if posA[j] > stored_posA  { stored_posA = posA[j]; breaks_ref = j };
		};
	#endregion
	
	#region Natural Linebreaks
	if ( x_position + string_width(string_replace_all(text_array[i]," ", "" )) > max_width and max_width > 0 ) {
		if ( width == x_position ) {
			width -= string_width(" ") 
			};
		x_position = 0; //Reset x
		};
	#endregion
		
	#region Forced Linebreaks
	if ( stored_posA ) {
		x_position = 0; //Reset x
		continue;
		};
	#endregion
	
	//Text Size
	if ( draw_format != -1 ) { _setFontStyle(draw_format) };	
	x_position += string_width(text_array[i]); //Increase x
	if ( draw_format != -1 ) { _setFontStyle() };	
	
	width = width > x_position ? width : x_position;
	
	};

//Return Width
return width;