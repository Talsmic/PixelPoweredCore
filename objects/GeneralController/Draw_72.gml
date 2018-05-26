//Reset Alignments
if ( set_GlobalAlignment_Track ) {
	if ( set_GlobalAlignment_Carryover ) { _setAlign( global.AlignX, global.AlignY ) }; 
	else								 { _setAlign() };	
	};
	
//Reset Fonts
if ( set_GlobalAlignment_Track ) {
	if ( set_GlobalAlignment_Carryover ) { set_font( global.Font ) }; 
	else								 { set_font( set_GlobalFont_DefaultFont ) };	
	};
	