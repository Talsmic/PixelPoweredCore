/// @desc Draw Focus Fog

if ( FocusFogEnabled ) {
	var _alpha =  _arrayValue(FocusFog_Alpha,  global.FocusLevel, eUpto.cap);
	var _colour = _arrayValue(FocusFog_Colour, global.FocusLevel, eUpto.cap);
	fillScreen(_colour, _alpha);
	};