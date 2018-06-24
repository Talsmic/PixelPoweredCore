/// @desc Draw Focus Fog

if ( FocusFogEnabled ) {
	var _alpha =  _arrayValueToCap(FocusFog_Alpha,  global.FocusLevel);
	var _colour = _arrayValueToCap(FocusFog_Colour, global.FocusLevel);
	fillScreen(_colour, _alpha);
	};