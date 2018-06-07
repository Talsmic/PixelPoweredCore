//	Global Alignment Tracking
//	Resets the global.Align variables at the start of each draw step
if ( GlobalTracking_Alignment ) {
	
	if ( GlobalTracking_Alignment_Carryover ) { _setAlign( global.AlignX, global.AlignY ) }; 
										else  { _setAlign() };	
	
	};
	
//	Global Font Tracking
//	Resets the global.Font variables at the start of each draw step
if ( GlobalTracking_Font ) {
	
	if ( GlobalTracking_Font_Carryover ) { _setFont( global.Font ) }; 
									else { _setFont( GlobalTracking_Font_DefaultFont ) };	
	
	};
	