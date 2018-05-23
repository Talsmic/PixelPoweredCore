///fix_region({region_array});
/// @arg region_array	{region}	
/*
	>>Returns {region}
*/
#region Arguments
if		is_array(argument0)  { var region_array = argument0 }
else if is_string(argument0) { var region_array = parse_array1d(argument0,"|") }
else if is_real(argument0)   { var region_array = [argument0] }
else						 { var region_array = [x,y] };
#endregion

//Fill missing values
switch array_length_1d(region_array) { 
	case 0: region_array[eR.x1] = x;					//x1, default to calling object's x
	case 1: region_array[eR.y1] = y;					//y1, default to calling object's y
	case 2: region_array[eR.x2] = region_array[eR.x1]+10;  	//x2, default to x1+10
	case 3: region_array[eR.y2] = region_array[eR.y1]+10;	//y2, default to y1+10
	};
	
//Make sure x1 and y1 are actually the smallest x and y
if ( region_array[eR.x1] > region_array[eR.x2] ) { 
	var temp = region_array[eR.x1];
	region_array[eR.x1] = region_array[eR.x2];	
	region_array[eR.x2] = temp;	
	};
if ( region_array[eR.y1] > region_array[eR.y2] ) { 
	var temp = region_array[eR.y1];
	region_array[eR.y1] = region_array[eR.y2];	
	region_array[eR.y2] = temp;	
	};
	
//Recalculate width and height
region_array[eR.w] = region_array[eR.x2] - region_array[eR.x1];
region_array[eR.h] = region_array[eR.y2] - region_array[eR.y1];

//Return fixed region [x1,y1,x2,y2,width,height]
return region_array;