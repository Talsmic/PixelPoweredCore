///array_to_skillstring(array);
/// @arg array
var array = argument0;
var skillstring = "";

for ( var i=1 ; i<array_length_1d(array); i++ ) {
	if ( i > 1 ) { skillstring += "|" };
    skillstring += string(array[i]);
	};
	
return skillstring;