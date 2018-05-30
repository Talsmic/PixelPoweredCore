/// @desc Draw Focus Fog
/*
if ( Setting_FocusFog and Focus_Current <= Setting_FocusFog_Level ) {
	var alpha = Setting_FocusFog_Alpha + (Setting_FocusFog_AlphaByFocus * (Setting_Focus_Floor-Focus_Current));
	_fillScreen(Setting_FocusFog_Colour,alpha);
	};