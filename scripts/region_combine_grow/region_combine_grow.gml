///region_combine_grow(regionA,regionB);
/// @arg regionA {region}
/// @arg regionB {region}
/*
	>>Returns {region}
	Adds regionB's values to regionA
*/
#region Arguments
var regionA = argument0;
var regionB = argument1;
#endregion

var x1 = regionA[eR.x1] + regionB[eR.x1];
var y1 = regionA[eR.y1] + regionB[eR.y1];
var x2 = regionA[eR.x2] + regionB[eR.x2];
var y2 = regionA[eR.y2] + regionB[eR.y2];

//Recalculate width and height
var w = x2 - x1;
var h = y2 - y1;
	
var output = [x1,y1,x2,y2,w,h];
return output;