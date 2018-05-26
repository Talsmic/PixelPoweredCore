///_textRegion(x,y,text,[align_array],[padding]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg text			{string}
/// @arg [align_array]	#align#			(default: [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo]);
/// @arg [padding]		{integer} [+width, +height]
/*
	<< Returns >> #region#
	!!Remember to set the correct font before using this!!
	This will correct for alignment.
*/
#region Arguments
if argument_count < 3 { show_debug_message("_textRegion requires inputs"); exit };//[!Break!]~~~>
var x1 =			argument[0];
var y1 =			argument[1];
var text =			argument[2];
var align_array =	argument_count > 3 ? _storeAlign(argument[3]) : [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo];
var padding =		argument_count > 4 ? _validateArray(argument[4],2,2,argument[4]) : [0, 0];
#endregion

var w = string_width(text);
var h = string_height(text);
var x2 = x1 + w + padding[0];
var y2 = x1 + h + padding[1];
	
var output = [x1, y1, x2, y2, w, h];

return _alignRegion(output, align_array, [x1, y1]);