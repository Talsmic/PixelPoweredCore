///region_bysprite(x,y,sprite_id);
/// @arg x			{real}
/// @arg y			{real}
/// @arg sprite_id	{SpriteID}
/*
	>>Returns {region}
*/
#region Arguments
var x0 = argument0;
var y0 = argument1;
var sprite_id = argument2;
#endregion

var w = sprite_get_width(sprite_id);
var h = sprite_get_height(sprite_id);
var x_off = sprite_get_xoffset(sprite_id);
var y_off = sprite_get_yoffset(sprite_id);

var x1 = x0 - x_off;
var y1 = y0 - y_off;
var x2 = x0 + w - x_off;
var y2 = y0 + w - y_off;

var output = [x1,y1,x2,y2,w,h];
return output;