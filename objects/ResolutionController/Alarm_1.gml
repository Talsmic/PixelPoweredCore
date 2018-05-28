/// @desc Resolution Correction

//Correct Resolution
resolutionAdapt();

//Refresh next step if required
if ( NextEvent_SnapResolution or NextEvent_ResolutionCenter ) {
	alarm[1] = 1;
	return;
	};

//Resume normal refresh rate, if enabled
if ( RES_RefreshRate > 0 ) {
	alarm[1] = RES_RefreshRate;
	return;
	};
	