///region_bytext(x,y,text);
/// @arg x		{real}
/// @arg y		{real}
/// @arg text	{string}
/*
	>>Returns {region}
	!!Remember to set the correct font before using this!!
	This will account for h_align and v_align too.
*/
#region Arguments
var x0 = argument0;
var y0 = argument1;
var text = argument2;
#endregion

var w = string_width(text);
var h = string_height(text);

var x1 = x0 - (w div 2);
var y1 = x0 - (h div 2);
var x2 = x0 + (w div 2) + (w mod 2);
var y2 = x0 + (h div 2) + (h mod 2);
	
switch ( global.AlignX ) {
	default:
	case fa_left:	var x1 = x0; 
					var x2 = x0 + w;						break;
	case fa_center:	var x1 = x0 - (w div 2); 
					var x2 = x0 + (w div 2) + (w mod 2);	break;
	case fa_right:	var x1 = x0 - w; 
					var x2 = x0;							break;
	};

switch ( global.AlignY ) {
	default:
	case fa_top:	var y1 = y0; 
					var y2 = y0 + h;						break;
	case fa_middle:	var y1 = y0 - (h div 2); 
					var y2 = y0 + (h div 2) + (h mod 2);	break;
	case fa_bottom:	var y1 = y0 - h; 
					var y2 = y0;							break;
	};
	
var output = [x1,y1,x2,y2,w,h];

return output;