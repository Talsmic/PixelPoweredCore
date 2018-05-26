///_spriteRegion(x,y,sprite_id,[padding]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg sprite_id		#sprite_id#
/// @arg [padding]		{integer} [+width, +height]
/*
	<< Returns >> #region#
	This will correct for alignment.
*/
#region Arguments
if argument_count < 3 { show_debug_message("_textRegion requires inputs"); exit };//[!Break!]~~~>
var x1 =			argument[0];
var y1 =			argument[1];
var sprite_id =		argument[2];
var padding =		argument_count > 3 ? _validateArray(argument[3],2,2,argument[3]) : [0, 0];
#endregion

var w = sprite_get_width(sprite_id);
var h = sprite_get_height(sprite_id);
var x2 = x1 + w + padding[0];
var y2 = x1 + h + padding[1];
	
var output = [x1, y1, x2, y2, w, h];

return _alignRegion(output, [fa_left, fa_top, 0, 0], [x1+sprite_get_xoffset(sprite_id), y1+sprite_get_xoffset(sprite_id)]);