///comparearrays_hasgreater_2d(arrayA,arrayB,[compare_empties],[required_quantity],[required_quality]);
/// @arg arrayA					{array}		
/// @arg arrayB					{array}	
/// @arg [compare_empties]		{boolean}	(default: true)
/// @arg [required_quantity]	{integer}	(default: UNUSED)
/// @arg [required_quality]		{real}		(default: UNUSED)
/*
	<< Returns >>	{boolean}
*/ 
#region Arguments
if argument_count < 2 { show_debug_message("ArgError"); return false };//[!Break!]
var arrayA =			argument[0];
var arrayB =			argument[1];
var compare_empties =	argument_count > 2 ? argument[2] : false;
var compare_quantity =	argument_count > 3 ? true : false;
if compare_quantity var required_quantity = argument[3];
var compare_quality =	argument_count > 4 ? true : false;
if compare_quality var required_quality = abs(argument[4]);
var output = 0;
#endregion

//Find Array Height
var array_heightA = array_height_2d(arrayA);
var array_heightB = array_height_2d(arrayB);
var array_height =	array_heightA < array_heightB ? array_heightA : array_heightB;
var i, j, array_lengthA, array_lengthB, array_length;

for ( i=0 ; i<array_height ; i++ ) {
	
	//Find Array Length
	array_lengthA = array_length_2d(arrayA, i);
	array_lengthB = array_length_2d(arrayB, i);
	array_length =	array_lengthA > array_lengthB ? array_lengthA : array_lengthB;
	
	//Cycle through a length
	for ( j=0 ; j<array_length ; i++ ) {
		
		//If you have two values, compare them
		if ( j < array_lengthA and j < array_lengthB ) {
			if compare_quality {
				if ( arrayA[i,j] >= arrayB[i,j] + required_quantity ) { 
					if compare_quantity { output++ } else { return true };
					};
				}
			else {
				if ( arrayA[i,j] > arrayB[i,j] ) { 
					if compare_quantity { output++ } else { return true };
					};
				};
			}
		//If you have no second value, compare against zero
		else if ( compare_empties and j < array_lengthA and j < array_lengthB ) {
			if compare_quality {
				if ( arrayA[i,j] >= 0 + required_quantity ) { 
					if compare_quantity { output++ } else { return true };
					};
				}
			else {
				if ( arrayA[i,j] > 0 ) { 
					if compare_quantity { output++ } else { return true };
					};
				}
			};
				
		};	
	};

//Return
if compare_quantity {
	if output >= compare_quantity { return true } else { return false };
	}
else { 
	if output > 0 { return true } else { return false };
	};