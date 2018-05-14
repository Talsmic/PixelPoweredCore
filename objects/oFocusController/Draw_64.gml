/// @desc Draw Focus Fog

if ( FocusCurrent < 10 and PPC_FOCUS_FocusFog ) {
	var alpha = PPC_FOCUS_FocusFog_Alpha + PPC_FOCUS_FocusFog_AlphaRise * (10-FocusCurrent);
	draw_screenfill(PPC_FOCUS_FocusFog_Colour,alpha);
	};