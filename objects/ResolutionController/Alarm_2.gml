/// @desc Floating Pixel Correction

if ( FloatingPixels_Width or FloatingPixels_Height ) {
	if ( !opt_res_Fullscreen) {
		show_debug_message("Event: Floating Pixel Correction");
		window_set_size(res_CompleteWidth*res_Magnification, res_CompleteHeight*res_Magnification);
		alarm[1] = 1; //prepare the Resolution Correction event 
		};
	};
