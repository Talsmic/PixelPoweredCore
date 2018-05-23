/// @desc Input Argument
if ( InputArgument >= 0 ) {
	var arguments = function_findarguments(FunctionName[TabPage-1]);
	var oldvalue = masterdrawer_get_storedargument(FunctionArgumentReference[TabPage-1,InputArgument],arguments[TabPage-1,1],arguments[TabPage-1,2]);
	get_string(string(arguments[TabPage-1,0]),oldvalue);
	};