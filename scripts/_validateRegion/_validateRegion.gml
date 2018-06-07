///_validateRegion([input_array],[input_x1],[input_y1],[input_x2],[input_y2],[input_w],[input_h]);
/// @arg [input_array]	{any}	
/// @arg [input_x1]		{any}	
/// @arg [input_y1]		{any}		
/// @arg [input_x2]		{any}	
/// @arg [input_y2]		{any}		
/// @arg [input_w]		{any}	
/// @arg [input_h]		{any}	
/*
	<< Returns >> #region# {array} [aR.x1, aR.y1, aR.x2, aR.y2, aR.w, aR.h]
	This script corrects a region to the format [x1, y1, x2, y2, (w)idth, (h)eight]
	If missing any of the values but you want to give ater ones, provide "".
	While this script will do it's best to create a valid region using the values given to it,
	if you give it nothing, expect [x, y, x+16, y+16, 16, 16]
	Provided individual inputs have priority over the intial array
*/
#region Special Enumerator: #aR# / #aRegion# (for Array IDs)
enum aR { //For Shorthand
	x1, y1, x2, y2, w, h };	
enum aRegion {
	x1, y1, x2, y2, w, h };
#endregion
#region Arguments & Variables
if ( argument_count == 0 ) { show_debug_message("dirty region"); return [x, y, x+16, y+16, 16, 16] };//[!Break!]
var df = 16;
var input_array =    ["","","","","",""];
var i;
#region argument[0]
var input = argument[0]
if ( is_string(input) )  { input = _arrayFromStringList(input) }; //I really hope your string is a list string
	
if ( is_array(input) )  { //You gave an array, plugging it's values into the correct positions	
	var input_array = argument[0]
	
	for ( i=0 ; i<6 ; ++i ) {
		if ( array_length_1d(input_array) <= i ) break;
		input_array[i] = input[i];
		};
	};
else if ( is_real(input) )   {  //You gave a single value, so I assume it's x1, but it might be needed for y as well
	input_array[0] = input; 
	input_array[1] = input; 
	};				
#endregion
for ( i=1 ; i<argument_count ; ++i ) { if ( argument[i] != "" ) { input_array[i-1] = argument[i] } };
#endregion

//Solve Missing Corners
#region Missing x1
if ( input_array[aR.x1] == "" ) { 
	if ( input_array[aR.w] != "" and input_array[aR.x2] != "" ) { input_array[aR.x1] = input_array[aR.x2] - input_array[aR.w] }
	else if ( input_array[aR.x2] != "" ) { input_array[aR.x1] = input_array[aR.x2] - df; show_debug_message("dirty region.x1") };
	else { input_array[aR.x1] = x; show_debug_message("dirty region.x1") };	
	};
#endregion
#region Missing x2
if ( input_array[aR.x2] == "" ) { 
	if ( input_array[aR.w] != "" and input_array[aR.x1] != "" ) { input_array[aR.x2] = input_array[aR.x1] + input_array[aR.w] }
	else { input_array[aR.x2] = input_array[aR.x1] + df; show_debug_message("dirty region.x2") };
	};
#endregion
#region Missing y1
if ( input_array[aR.y1] == "" ) { 
	if ( input_array[aR.h] != "" and input_array[aR.y2] != "" ) { input_array[aR.y1] = input_array[aR.y2] - input_array[aR.h] }
	else if ( input_array[aR.y2] != "" ) { input_array[aR.y1] = input_array[aR.y2] - df; show_debug_message("dirty region.y1") };
	else { input_array[aR.y1] = y; show_debug_message("dirty region.y1") };	
	};
#endregion
#region Missing y2
if ( input_array[aR.y2] == "" ) { 
	if ( input_array[aR.h] != "" and input_array[aR.y1] != "" ) { input_array[aR.y2] = input_array[aR.y1] + input_array[aR.h] }
	else { input_array[aR.y2] = input_array[aR.y1] + df; show_debug_message("dirty region.y2") };
	};
#endregion
	
//Make sure x1 and y1 are actually the smallest x and y
if ( input_array[aR.x1] > input_array[aR.x2] ) { 
	var temp = input_array[aR.x1];
	input_array[aR.x1] = input_array[aR.x2];	
	input_array[aR.x2] = temp;	
	};
if ( input_array[aR.y1] > input_array[aR.y2] ) { 
	var temp = input_array[aR.y1];
	input_array[aR.y1] = input_array[aR.y2];	
	input_array[aR.y2] = temp;	
	};
	
//Recalculate width and height
input_array[aR.w] = input_array[aR.x2] - input_array[aR.x1];
input_array[aR.h] = input_array[aR.y2] - input_array[aR.y1];

//Return fixed region [x1,y1,x2,y2,width,height]
return input_array;