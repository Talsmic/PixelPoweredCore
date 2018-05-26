///ui_listbox_command(command);
/// @arg command
var command = argument0;
//Sanitise command
command = string_lettersdigits( command );
command = string_lower( command );
/*
switch ( command ) {
		
	#region Move Focus Point and Scroll
	case "movefocusup":		Listbox_Position -= Listbox_Row_Length;		ui_listbox_command("ScrollSnap");	break;
	case "movefocusdown":	Listbox_Position += Listbox_Row_Length;		ui_listbox_command("ScrollSnap");	break;
	case "movefocusleft":	Listbox_Position -= 1;						ui_listbox_command("ScrollSnap");	break;
	case "movefocusright":	Listbox_Position += 1;						ui_listbox_command("ScrollSnap");	break;
		
	case "scrollup":		Listbox_Row_Starting -= Listbox_ScrollSize; ui_listbox_command("ScrollLoop");	break;
	case "scrolldown":		Listbox_Row_Starting += Listbox_ScrollSize; ui_listbox_command("ScrollLoop");	break;
	case "scrollup1":		Listbox_Row_Starting -= 1; 					ui_listbox_command("ScrollLoop");	break;
	case "scrolldown1":		Listbox_Row_Starting += 1; 					ui_listbox_command("ScrollLoop");	break;
	case "scrolltop":		Listbox_Row_Starting = 1;															break;
	case "scrollbottom":	Listbox_Row_Starting = ceil( Listbox_List_Length / Listbox_Row_Length ) + 1 - Listbox_Column_Length;	break;
			
	case "_togglescrollloop":		Listbox_ScrollLoop = _toggle( Listbox_ScrollLoop );		break;
	case "_toggleids":				Listbox_ShowID = _toggle( Listbox_ShowID );				break;
	
	case "scrollloop":
		var rowcount = ceil( Listbox_List_Length / Listbox_Row_Length ) + 1;
		if ( Listbox_ScrollLoop ) {
			if ( Listbox_Row_Starting < 1 ) { Listbox_Row_Starting = rowcount - Listbox_Column_Length };
			if ( Listbox_Row_Starting > rowcount - Listbox_Column_Length ) { Listbox_Row_Starting = 1 };		
			};
		else {
			if ( Listbox_Row_Starting > rowcount - Listbox_Column_Length ) { Listbox_Row_Starting = rowcount - Listbox_Column_Length };		
			if ( Listbox_Row_Starting < 1 ) { Listbox_Row_Starting = 1 };
			};
		break;
		
	case "scrollsnap":
		if ( Listbox_ScrollLoop ) {
			if ( Listbox_Position < 1 ) { Listbox_Position = Listbox_List_Length };
			if ( Listbox_Position > Listbox_List_Length ) { Listbox_Position = 1 };		
			};
		else {
			if ( Listbox_Position > Listbox_List_Length ) { Listbox_Position = Listbox_List_Length };		
			if ( Listbox_Position < 1 ) { Listbox_Position = 1 };
			};
		//Find Visible Range
		var range_start = Listbox_Row_Starting * Listbox_Row_Length - Listbox_Row_Length + 1;
		var range_end = range_start + Listbox_Row_Length * Listbox_Column_Length - 1;
		//Snap view to Visible Range
		if ( Listbox_Position < range_start )	{ Listbox_Row_Starting = ceil( Listbox_Position / Listbox_Row_Length ) };
		if ( Listbox_Position > range_end )		{ Listbox_Row_Starting += ceil( ( Listbox_Position - range_end ) / Listbox_Row_Length ) };
		break; 
		
	case "listlength":
		switch ( Listbox_Mode ) {
			case "Icons":	Listbox_List_Length = array_length_1d(Listbox_ListIcon)-1;		break;
			case "Words":	Listbox_List_Length = array_length_1d(Listbox_ListWords)-1;		break;
			default:		Listbox_List_Length = 0;										break;
			};
		break; #endregion
	
	#region Change Listbox Mode
	case "modeicons":
		Listbox_Mode = "Icons" 
		Listbox_Row_Length = 4;
		Listbox_Column_Length = 5;
		Listbox_Row_Starting = ceil( Listbox_Position / Listbox_Row_Length );
		Listbox_ScrollSize = 1;
		ui_listbox_command("scrollloop");
		ScrollBeat = beat_create(15,1);
		break;
		
	case "modewords":
		Listbox_Mode = "Words" 
		Listbox_Row_Length = 1;
		Listbox_Column_Length = 16;
		Listbox_Row_Starting = Listbox_Position;
		Listbox_ScrollSize = 5;
		ui_listbox_command("scrollloop");
		ScrollBeat = beat_create(5,1);
		break; #endregion
		
	#region Change List and Object Mode
	case "parentmodeskills":
		Mode = "Skills"
		Listbox_IconType = "DB_Skill";
		Listbox_Position = 1;
		Listbox_ListIcon = db_pull_columnasarray("db_Skills","id");
		Listbox_ListWords = db_pull_columnasarray("db_Skills","name");
		Listbox_ListColour = db_pull_columnasarray("db_Skills","element");
		ui_listbox_command("Mode:Icons");
		break;
	
	case "parentmodecreatures":
		Mode = "Creatures"
		Listbox_IconType = "DB_Creature";
		Listbox_Position = 1;
		Listbox_ListIcon = db_pull_columnasarray("db_Creatures","id");
		Listbox_ListWords = db_pull_columnasarray("db_Creatures","name");
		Listbox_ListColour = db_pull_columnasarray("db_Creatures","element");
		ui_listbox_command("Mode:Words");
		break;
	
	case "parentmodeplayers":
		Mode = "Players"
		Listbox_IconType = "disabled";
		Listbox_Position = 1;
		Listbox_ListIcon = 0;
		Listbox_ListWords = 0;
		Listbox_ListColour = 0;
		Count = 1;
		with ( oPlayer ) {
			other.Listbox_ListIcon[other.Count] = id;
			other.Listbox_ListWords[other.Count] = "["+Player_Tag+"] "+Player_Name;
			other.Listbox_ListColour[other.Count] = Player_Colour;
			other.Count++;
			};
		ui_listbox_command("Mode:Words");
		break;
	
	case "parentmodeplayerstorage":
		Mode = "Storage"
		Listbox_IconType = "Creature";
		Listbox_Position = 1;
		Listbox_ListIcon = 0;
		Listbox_ListWords = 0;
		Listbox_ListColour = 0;
		with ( PlayerID ) {
			for ( var i=1; i<=storage_lastentry(id); i++ ) {
				if ( !Stored_Status[i] ) { 
					other.Listbox_ListIcon[i] = 0;
					other.Listbox_ListWords[i] = " ";
					other.Listbox_ListColour[i] = c_black;					
					//i = StorageSize 
					};
				else {
					other.Listbox_ListIcon[i] = dbpull_creature_icon(Stored_Species[i]);
					other.Listbox_ListWords[i] = Stored_Name[i];
					other.Listbox_ListColour[i] = dbpull_creature_element(Stored_Species[i]);
					};
				};
			};
		Listbox_Mode = "Icons" 
		Listbox_Row_Length = 5;
		Listbox_Column_Length = 5;
		Listbox_Row_Starting = ceil( Listbox_Position / Listbox_Row_Length );
		ui_listbox_command("scrollloop");
		ScrollBeat = beat_create(15,1);
		break; 
		
	case "parentmodeplayerparty":
		Mode = "Party"
		Listbox_IconType = "Creature";
		Listbox_Position = 1;
		Listbox_ListIcon = 0;
		Listbox_ListWords = 0;
		Listbox_ListColour = 0;
		with ( PlayerID ) {
			for ( var i=1; i<=party_lastentry(id); i++ ) {
				if ( !Party_Status[i] ) { 
					other.Listbox_ListIcon[i] = 0;
					other.Listbox_ListWords[i] = " ";
					other.Listbox_ListColour[i] = c_black;										
					//i = PartySize 
					};
				else {
					other.Listbox_ListIcon[i] = dbpull_creature_icon(Party_Species[i]);
					other.Listbox_ListWords[i] = Party_Name[i];
					other.Listbox_ListColour[i] = dbpull_creature_element(Party_Species[i]);
					};
				};
			};
		Listbox_Mode = "Icons" 
		Listbox_Row_Length = 5;
		Listbox_Column_Length = 5;
		Listbox_Row_Starting = ceil( Listbox_Position / Listbox_Row_Length );
		ui_listbox_command("scrollloop");
		ScrollBeat = beat_create(15,1);
		break; 
		#endregion
		
	};