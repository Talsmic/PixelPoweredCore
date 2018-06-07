///_regionBySize(x,y,width,length);
/// @arg x		{real}
/// @arg y		{real}
/// @arg width	{real}
/// @arg height {real}
/*
	<< Returns >> #region#
*/
#region Arguments & Variables
var x1 = argument0;
var y1 = argument1;
var w =  argument2;
var h =  argument3;
var x2 = x1 + w;
var y2 = y1 + h;
#endregion

var region_array = [x1,y1,x2,y2,w,h];
return region_array;