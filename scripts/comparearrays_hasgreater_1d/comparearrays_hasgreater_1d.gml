///comparearrays_hasgreater_1d(arrayA,arrayB,[compare_empties],[required_quantity],[required_quality]);
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

//Find Array Length
var array_lengthA = array_length_1d(arrayA);
var array_lengthB = array_length_1d(arrayB);
var array_length =	array_lengthA > array_lengthB ? array_lengthA : array_lengthB;
	
//Cycle through a length
for ( var i=0 ; i<array_length ; i++ ) {
		
	//If you have two values, compare them
	if ( i < array_lengthA and i < array_lengthB ) {
		if compare_quality {
			if ( arrayA[i] >= arrayB[i] + required_quantity ) { 
				if compare_quantity { output++ } else { return true };
				};
			}
		else {
			if ( arrayA[i] > arrayB[i] ) { 
				if compare_quantity { output++ } else { return true };
				};
			};
		}
	//If you have no second value, compare against zero
	else if ( compare_empties and i < array_lengthA and i < array_lengthB ) {
		if compare_quality {
			if ( arrayA[i] >= 0 + required_quantity ) { 
				if compare_quantity { output++ } else { return true };
				};
			}
		else {
			if ( arrayA[i] > 0 ) { 
				if compare_quantity { output++ } else { return true };
				};
			}
		};
				
	};	

//Return
if compare_quantity {
	if output >= compare_quantity { return true } else { return false };
	}
else { 
	if output > 0 { return true } else { return false };
	};