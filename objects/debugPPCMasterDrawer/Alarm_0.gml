/// @desc Update Arguments

for ( var i=1; i<array_length_1d(FunctionName); ++i ) {
	//Find Arguments
	var arguments = function_findarguments(FunctionName[i]);
	var true_arguments = [0];
	//For each found argument, pull it from stored values
	for ( var j=1; j<array_height_2d(arguments); ++j ) {
		true_arguments[j] = masterdrawer_get_storedargument(FunctionArgumentReference[i,j],arguments[j,1],arguments[j,2]); 
		};
	//Save argument array
	FunctionArguments[i] = true_arguments;
	};
	
alarm[0] = 60;
