// Inherit the parent event
event_inherited();

Grid_Height =		32;
Grid_Width =		60;

MinColumnLength =	2//8;
MaxColumnLength =	10//26;
MinRowLength =		2//8;
MaxRowLength =		10//26;

StartRow = 0;
StartCol = 0;
RefreshRate = 3;
GrowthRate = 13;

for ( var i=0 ; i<Grid_Width ; ++i ) {
	Column[i] = irandom_range(MinColumnLength, round(MaxColumnLength*0.75));
	};
	
for ( var i=0 ; i<Grid_Height ; ++i ) {
	Row[i] = irandom_range(MinColumnLength, round(MaxColumnLength*0.75));
	};
	
AlphaChange_PerTile = 0.04;
AlphaChange_TowardPeak = 0.25;
Alpha_Background = 0.05

AlphaGrid[Grid_Width, Grid_Height] = 0;
//Backgrounding = true;

alarm[0] = 1; //Turn On Periodic Updates