/// @desc Updates (Every Update Window)
alarm[0] = RefreshRate;

x = sprite_xoffset;
y = sprite_yoffset;

//Update Grid Size
repeat GrowthRate {
	if ( Grid_Width < (global.DisplayRegion[aR.w] div sprite_width) + 1 ) {
		Column[Grid_Width] = clamp(Column[Grid_Width-1]+irandom_range(-5, 5), MinColumnLength, MaxColumnLength);
		Grid_Width++;
		};
	if ( Grid_Height < (global.DisplayRegion[aR.h] div sprite_height) + 1 ) {
		Row[Grid_Height] = clamp(Row[Grid_Height-1]+irandom_range(-5, 5), MinRowLength, MaxRowLength);
		Grid_Height++;
		};
	};

//Adjust Column Lengths
for ( var col=0 ; col<Grid_Width ; ++col ) {
	var _target = irandom_range(MinColumnLength, MaxColumnLength);
	if ( _target > Column[col] ) { Column[col]++ };
	if ( _target < Column[col] ) { Column[col]-- };
	};
	
//Adjust Row Lengths
for ( var row=0 ; row<Grid_Height ; ++row ) {
	var _target = irandom_range(MinRowLength, MaxRowLength);
	if ( _target > Row[row] ) { Row[row]++ };
	if ( _target < Row[row] ) { Row[row]-- };
	};
	
//Calculate Alpha Grid Top to Bottom
AlphaGrid[Grid_Width, Grid_Height] = 0;
for ( row=0 ; row<Grid_Width ; ++row ) {
	for ( col=0 ; col<Grid_Height ; ++col ) {
		AlphaGrid[row, col] = Alpha_Background;
		};
	};

#region Alignment Lines
var _alpha = image_alpha;

switch ( RoomAlignX ) {
	case fa_left: 		StartCol = 0;						break;	
	case fa_center:		StartCol = (Grid_Width div 2) - 1;	break;	
	case fa_right: 		StartCol = Grid_Width - 1;			break;	
	};	
	
switch ( RoomAlignY ) {
	case fa_top: 		StartRow = 0;							break;	
	case fa_center:		StartRow = (Grid_Height div 2) - 1;		break;	
	case fa_bottom: 	StartRow = Grid_Height - 1;				break;	
	};	
	
switch ( ViewAlignX ) {
	case fa_left: 		StartCol = 0;						break;	
	case fa_center:		StartCol = (Grid_Width div 2) - 1;	break;	
	case fa_right: 		StartCol = Grid_Width - 1;			break;	
	};	
	
switch ( ViewAlignY ) {
	case fa_top: 		StartRow = 0;							break;	
	case fa_center:		StartRow = (Grid_Height div 2) - 1;		break;	
	case fa_bottom: 	StartRow = Grid_Height - 1;				break;	
	};	
	
#endregion
	
#region Up
if TileUp { 
	if ( RoomAlignY == fa_top or RoomAlignY == fa_bottom or ViewAlignY == fa_top or ViewAlignY == fa_bottom ) { StartRow = Grid_Height - 1 };
	
	for ( col=0 ; col<Grid_Width ; ++col ) {		
		_alpha = image_alpha;
		for ( row=0 ; row<Column[col] and StartRow-row>0 ; ++row ) {
			if ( AlphaChange_TowardPeak > 0 and _alpha > AlphaChange_TowardPeak * (Column[col] - row) ) { _alpha = AlphaChange_TowardPeak * (Column[col] - row) };
			if ( _alpha < Alpha_Background ) { _alpha = Alpha_Background-Alpha_BackgroundChange*row };
			AlphaGrid[col, StartRow-row] = _alpha > AlphaGrid[col, StartRow-row] ? _alpha : AlphaGrid[col, StartRow-row];
			_alpha -= AlphaChange_PerTile;
			};
		};
		
	}; #endregion

#region Down
if TileDown { 
	if ( RoomAlignY == fa_top or RoomAlignY == fa_bottom or ViewAlignY == fa_top or ViewAlignY == fa_bottom ) { StartRow = 0 };
		
	for ( col=0 ; col<Grid_Width ; ++col ) {		
		_alpha = image_alpha;
		for ( row=0 ; row<Column[col] and StartRow+row<Grid_Height ; ++row ) {
			if ( AlphaChange_TowardPeak > 0 and _alpha > AlphaChange_TowardPeak * (Column[col] - row) ) { _alpha = AlphaChange_TowardPeak * (Column[col] - row) };
			if ( _alpha < Alpha_Background ) { _alpha = Alpha_Background-Alpha_BackgroundChange*row };
			AlphaGrid[col, StartRow+row] = _alpha > AlphaGrid[col, StartRow+row] ? _alpha : AlphaGrid[col, StartRow+row];
			_alpha -= AlphaChange_PerTile;
			};
		};
		
	}; #endregion
	
#region Left
if TileLeft { 
	if ( RoomAlignX == fa_left or RoomAlignX == fa_right or ViewAlignX == fa_left or ViewAlignX == fa_right ) { StartCol = Grid_Width - 1 };
			
	for ( row=0 ; row<Grid_Height ; ++row ) {	
		_alpha = image_alpha;
		for ( col=0 ; col<Row[row] and StartCol-col>0 ; ++col ) {
			if ( AlphaChange_TowardPeak > 0 and _alpha > AlphaChange_TowardPeak * (Row[row] - col) ) { _alpha = AlphaChange_TowardPeak * (Row[row] - col) };
			if ( _alpha < Alpha_Background ) { _alpha = Alpha_Background-Alpha_BackgroundChange*col };
			AlphaGrid[StartCol-col, row] = _alpha > AlphaGrid[StartCol-col, row] ? _alpha :AlphaGrid[StartCol-col, row];
			_alpha -= AlphaChange_PerTile;
			};
		};
		
	}; #endregion
	
#region Right
if TileRight { 
	if ( RoomAlignX == fa_left or RoomAlignX == fa_right or ViewAlignX == fa_left or ViewAlignX == fa_right ) { StartCol = 0 };
			
	for ( row=0 ; row<Grid_Height ; ++row ) {	
		_alpha = image_alpha;
		for ( col=0 ; col<Row[row] and StartCol+col<Grid_Width ; ++col ) {
			if ( AlphaChange_TowardPeak > 0 and _alpha > AlphaChange_TowardPeak * (Row[row] - col) ) { _alpha = AlphaChange_TowardPeak * (Row[row] - col) };
			if ( _alpha < Alpha_Background ) { _alpha = Alpha_Background-Alpha_BackgroundChange*col };
			AlphaGrid[StartCol+col, row] = _alpha > AlphaGrid[StartCol+col, row] ? _alpha :AlphaGrid[StartCol+col, row];
			_alpha -= AlphaChange_PerTile;
			};
		};
		
	}; #endregion
