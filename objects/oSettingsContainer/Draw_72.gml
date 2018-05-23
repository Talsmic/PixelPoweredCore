
//Reset Alignments
if ( Settings_AlignTrack ) {
	if ( Settings_AlignTrack_Carryover ) { set_align( global.AlignX, global.AlignY ) }; 
	else								 { set_align() };	
	};
	
//Reset Fonts
if ( Settings_AlignTrack ) {
	if ( Settings_AlignTrack_Carryover ) { set_font( global.Font ) }; 
	else								 { set_font( Settings_FontTrack_default ) };	
	};
	