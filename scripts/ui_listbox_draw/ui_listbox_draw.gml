///ui_listbox_draw();
	/*	
//Find Correct Dimensions
if ( Listbox_Mode == "Icons" and Listbox_IconType == "disabled" ) { ui_listbox_command("Mode:Words") };
ui_listbox_command("ListLength");
switch ( Listbox_Mode ) {
	case "Icons":
		var box_width = Listbox_Row_Length*30+6;
		var box_height = Listbox_Column_Length*31+10;
		break;
	case "Words":
		var box_width = Listbox_Row_Length*Listbox_WordWidth+6;
		var box_height = Listbox_Column_Length*10+10;
		break;
	default:
		var box_width = 50;
		var box_height = 50;
	};

//Define visual range
if ( Listbox_Row_Starting < 1 ) { Listbox_Row_Starting = 1 };
var range_start = Listbox_Row_Starting * Listbox_Row_Length - Listbox_Row_Length + 1;
var range_end = range_start + Listbox_Row_Length * Listbox_Column_Length - 1;
if ( range_end > Listbox_List_Length ) { range_end = Listbox_List_Length };

//Draw Box
drawSimplebox(Listbox_X,Listbox_Y,box_width,box_height);
//Draw Scrollbars
if ( Listbox_List_Length > Listbox_Row_Length * Listbox_Column_Length ) {	
	if ( Listbox_Row_Starting == 1 and !Listbox_ScrollLoop ) {	
		draw_tilebox_scrollbar(Listbox_X,Listbox_Y,box_width,UP,eSkillButtonState.disabled)	};
	else {		
		draw_tilebox_scrollbar(Listbox_X,Listbox_Y,box_width,UP,eSkillButtonState.detect)	};
	if ( Listbox_Row_Starting > ceil( Listbox_List_Length / Listbox_Row_Length ) - Listbox_Column_Length and !Listbox_ScrollLoop ) {	
		draw_tilebox_scrollbar(Listbox_X,Listbox_Y+box_height-4,box_width,DOWN,eSkillButtonState.disabled)	};
	else {	
		draw_tilebox_scrollbar(Listbox_X,Listbox_Y+box_height-4,box_width,DOWN,eSkillButtonState.detect)	};	
	};
	
//Draw List
switch ( Listbox_Mode ) {
	
	case "Icons": #region
		var _x = Listbox_X+18; var _y = Listbox_Y+21; 
		_setFont(ft_Pixis07_Bold);
		_setAlign(fa_right);
		for ( var i=range_start; i<=range_end; ++i ) {
			//Replace missing colours
			if ( array_length_1d(Listbox_ListColour) < i ) { Listbox_ListColour[i] = c_white };			
			//Draw Icon
			var icon_rarity = "B";
			if ( Listbox_IconType = "Skill" ) {
				draw_icon_skill(_x,_y,24,Listbox_ListIcon[i],Listbox_ListColour[i],"B",eSkillButtonState.detect) };
			if ( Listbox_IconType = "DB_Skill" ) {
				draw_icon_dbskill(_x,_y,24,Listbox_ListIcon[i],eSkillButtonState.detect);
				icon_rarity = db_record_get("db_Skills",Listbox_ListIcon[i],"rarity") };
			if ( Listbox_IconType = "Creature" ) {
				draw_icon_creature(_x,_y,24,Listbox_ListIcon[i],Listbox_ListColour[i],eSkillButtonState.detect) };
			if ( Listbox_IconType = "DB_Creature" ) {
				draw_icon_dbcreature(_x,_y,24,Listbox_ListIcon[i],eSkillButtonState.detect) };
			//Draw Focus
			if ( i == Listbox_Position ) { draw_icon_halo(_x,_y,24,c_orange,icon_rarity,eSkillButtonState.detect,0.75) };		
			//Draw ID
			if ( Listbox_ShowID ) { drawText_Outlined(_x+14,_y+6,i,c_gray9,c_gray2) };	
			//Progress Locations
			_x += 30;
			if ( _x > Listbox_X+Listbox_Row_Length*30 ) { _x = Listbox_X+18; _y += 31 };
			};
		_setAlign(fa_left);
		break; #endregion
		
	case "Words": #region
		var _x = Listbox_X+4; var _y = Listbox_Y+6; 
		_setFont(ft_Pixis07_Bold);
		for ( var i=range_start; i<=range_end; ++i ) {
			//Replace missing colours
			if ( array_length_1d(Listbox_ListColour) < i ) { Listbox_ListColour[i] = c_white };		
			//Draw Focus
			if ( i == Listbox_Position ) {	
				drawPlane(_x-4,_y-1,Listbox_WordWidth+6,11,c_gray7,0.3);
				drawPlane(_x-4,_y,Listbox_WordWidth+6,9,c_gray2,1); 
				};
			//Clip strings and Draw List
			var drawstring = Listbox_ListWords[i];
			if ( Listbox_ShowID ) { 	
				if ( string_width(drawstring) > Listbox_WordWidth - 30 ) { drawstring = string_delete(drawstring,14,100)+"...";}; //Clip Extra long words
				drawText(_x,_y,"["+string(i)+"]:",c_gray9,1);
				drawText(_x+30,_y,drawstring,findColour(Listbox_ListColour[i]),1);
				};	
			else { 
				if ( string_width(drawstring) > Listbox_WordWidth ) { drawstring = string_delete(drawstring,18,100)+"...";}; //Clip Extra long words
				drawText(_x,_y,drawstring,findColour(Listbox_ListColour[i]),1);
				};		
			//Progress Locations		
			_x += Listbox_WordWidth;
			if ( _x > Listbox_X+Listbox_Row_Length*Listbox_WordWidth ) { _x = Listbox_X+4; _y += 10 };
			};
		break; #endregion
	
	};