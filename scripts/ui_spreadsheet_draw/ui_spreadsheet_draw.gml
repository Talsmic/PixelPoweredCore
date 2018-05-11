///ui_spreadsheet_draw(mode,x,y);
/// @arg mode
/// @arg x
/// @arg y
var mode = argument0;
var X = argument1;
var Y = argument2;
		
draw_set_font(ft_EvoSmallcaps_6);
//Find Correct Data
switch ( mode ) {
	
	case "StorageContents": #region
		draw_text_flatcolour(X+4,Y,"Storage Contents for "+Player_Name,c_orange,1);
		var rowcount = storage_firstemptyslot(id)-1;
		var columns = [		"id",
							"Status", 
							"Species", 
							"Name", 
							"Level", 
							"Exp", 
							"Genome", 
							"SkillString",
							];
		var col_width = [ 16, 32, 32, 56, 24, 24, 32, 64 ];
		var data;
		for ( var i=1 ; i<rowcount+1 ; i++ ) {
			data[1,i] = i;
			data[2,i] = Stored_Status[i];
			data[3,i] = Stored_Species[i];
			data[4,i] = Stored_Name[i];
			data[5,i] = Stored_Level[i];
			data[6,i] = Stored_Exp[i];
			data[7,i] = Stored_Genome[i];
			data[8,i] = Stored_SkillString[i];			
			};
		break; #endregion
		
	};
	
//Draw Box
var width = 4;
for ( var i=0 ; i<array_length_1d(col_width) ; i++ ) {
	width += col_width[i];
	};	
var height = rowcount*11+15;
draw_blackbox(X,Y+10,width,height);
//Draw Rows
for ( var i=1 ; i<rowcount ; i+=2 ) {
	draw_plane_coloured(X+2,Y+i*11+12,width-4,11,c_midgray,0.3);
	};	
//Draw Columns
var XX = X+2
for ( var i=1 ; i<array_length_1d(col_width) ; i+=2 ) {
	XX += col_width[i-1];
	draw_plane_coloured(XX,Y+23,col_width[i],height-15,c_white,0.05);
	XX += col_width[i];
	};	
//Draw Headers
draw_set_font(ft_EvoTooltip_6_Squished);
draw_set_colour(c_orange);
var XX = X+4
for ( var i=0 ; i<array_length_1d(columns) ; i++ ) {
	draw_text(XX,Y+13,columns[i]);
	XX += col_width[i];
	};	
//Draw Values
draw_set_font(ft_EvoTooltip_6);
draw_set_colour(c_lightgray);
var XX = X+4
for ( var i=1 ; i<array_height_2d( data ) ; i++ ) {
	for ( var j=1 ; j<array_length_2d( data, i ) ; j++ ) {
		draw_text( XX,Y+13+j*11,data[i,j] );
		};
	XX += col_width[i-1];
	};	