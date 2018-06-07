///_arrayCompare_NotEquals(arrayA,arrayB,[compare_empties],[required_quantity]);
/// @arg arrayA					{array}		
/// @arg arrayB					{array}	
/// @arg [compare_empties]		{boolean}	(default: true)
/// @arg [required_quantity]	{integer}	
/*
	<< Returns >>	{boolean}
*/ 
#region Arguments & Variables & Variables
if argument_count < 2 { show_debug_message("_arrayCompare requires 2 arrays"); return false };//[!Break!]
//Arguments
var _arrayA =			_validateArray(argument[0]);
var _arrayB =			_validateArray(argument[1]);
var _compare_empties =	argument_count > 2 ? argument[2] : false;
var compare_quantity =	argument_count > 3 ? true : false;
if ( compare_quantity ) { var required_quantity = argument[3] };
//Other Variables
var output = 0;
//Array Height
var _array_heightA = array_height_2d(_arrayA);
var _array_heightB = array_height_2d(_arrayB);
var _array_height =	_array_heightA < _array_heightB ? _array_heightA : _array_heightB;
var _arrayA_2d = _array_heightA > 1 ? true : false;
var _arrayB_2d = _array_heightB > 1 ? true : false;
#endregion

//1D Comparison
if ( !_arrayA_2d or !_arrayB_2d ) {
	
	if ( _arrayA_2d ) { _arrayA = _arrayColumnAsArray(_arrayA, 0) };
	if ( _arrayB_2d ) { _arrayA = _arrayColumnAsArray(_arrayB, 0) };
	
	//Find Array Length
	var _array_lengthA = array_length_1d(_arrayA);
	var _array_lengthB = array_length_1d(_arrayB);
	var _array_length =	_array_lengthA > _array_lengthB ? _array_lengthA : _array_lengthB;
	
	//Cycle through a length
	for ( var i=0 ; i<_array_length ; ++i ) {
		
		//If you have two values, compare them
		if ( i < _array_lengthA and i < _array_lengthB ) {
			if ( _arrayA[i] != _arrayB[i] )	{ if ( compare_quantity ) { output++ } else { return true }	};
			}
		//If you have no second value, compare against zero
		else if ( _compare_empties and i < _array_lengthA ) {
			if ( _arrayA[i] != 0 )			{ if ( compare_quantity ) { output++ } else { return true }	};
			}
		else if ( _compare_empties and i < _array_lengthB ) {
			if ( _arrayB[i] != 0 )			{ if ( compare_quantity ) { output++ } else { return true }	};
			};
				
		};	
	
	}
	
//2D Comparison
else {	
	for ( var j=0 ; j<_array_height ; ++j ) {
	
		//Find Array Length
		var _array_lengthA = array_length_2d(_arrayA, j);
		var _array_lengthB = array_length_2d(_arrayB, j);
		var _array_length =	_array_lengthA > _array_lengthB ? _array_lengthA : _array_lengthB;
	
		//Cycle through a length
		for ( var i=0 ; i<_array_length ; ++i ) {
		
			//If you have two values, compare them
			if ( i < _array_lengthA and i < _array_lengthB ) {
				if ( _arrayA[j, i] != _arrayB[j, i] ) { if ( compare_quantity ) { output++ } else { return true }	};
				}
			//If you have no second value, compare against zero
			else if ( _compare_empties and i < _array_lengthA ) {
				if ( _arrayA[j, i] != 0 )			  { if ( compare_quantity ) { output++ } else { return true }	};
				}
			else if ( _compare_empties and i < _array_lengthB ) {
				if ( _arrayB[j, i] != 0 )			  { if ( compare_quantity ) { output++ } else { return true }	};
				};
				
			};				
			
		};
	};

//Return
if ( compare_quantity )	{ if output >= compare_quantity { return true } else { return false } }
else					{ if output > 0					{ return true } else { return false } };