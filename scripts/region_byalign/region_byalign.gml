///region_byalign(x,y,width,length,[align_x],[align_y]);
/// @arg x			{real}
/// @arg y			{real}
/// @arg width		{real}
/// @arg height		{real}
/// @arg [align_x]	{fa_left OR fa_center or fa_right} (default: global.AlignX)
/// @arg [align_y]	{fa_top OR fa_middle or fa_bottom} (default: global.AlignY)
/*
	>>Returns {region}
*/
#region Arguments
var x0 = argument[0];
var y0 = argument[1];
var w =  argument[2];
var h =  argument[3];
var align_x = argument_count > 4 ? argument[4] : global.AlignX;
var align_y = argument_count > 5 ? argument[5] : global.AlignY;
#endregion
		
switch ( align_x ) {
	default:
	case fa_left:	var x1 = x0; 
					var x2 = x0 + w;						break;
	case fa_center:	var x1 = x0 - (w div 2); 
					var x2 = x0 + (w div 2) + (w mod 2);	break;
	case fa_right:	var x1 = x0 - w; 
					var x2 = x0;							break;
	};

switch ( align_y ) {
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