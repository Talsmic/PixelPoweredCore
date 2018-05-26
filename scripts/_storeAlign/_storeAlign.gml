///_storeAlign([inputs]);
/// @arg [inputs]	{any}	
/*
	<< Returns >>	#align# {array} [align_x, align_y, offset_x, offsey_y]
	Generates an alignment array with whatever values you put in
*/
if ( argument_count == 0 ) { return [ global.Align_X, global.Align_Y, global.Align_Xo, global.Align_Yo ] };//[!Break!]

var output = _validateArray(argument[0],4,4,[fa_left, fa_right, 0, 0]);

if ( argument_count > 1 ) {	output[1] = argument[1] };
if ( argument_count > 2 ) {	output[2] = argument[2] };
if ( argument_count > 3 ) {	output[3] = argument[3] };
output[0] = clamp(output[0],0,2);
output[1] = clamp(output[1],0,2);

return output;

/*==[Notes]=========================================================================================
	-	Giving no input returns an #align# of:
		[global.Align_X, global.Align_Y, global.Align_Xo, global.Align_Yo]
		Use this to save the current alignment if you want to change it and set it back later