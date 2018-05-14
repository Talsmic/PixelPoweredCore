/// @desc Resolution Correction

//Correct Resolution
if ( Options_ResolutionSnap ) { ResolutionSnapNextFrame = true };
ppres_adapt_resolution();

alarm[1] = PPRES_RefreshRate;