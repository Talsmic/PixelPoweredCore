///ui_databox_draw(#);
/// @arg #
var ref = argument0;
/*
//Draw Databox
switch ( Databox_Type[ref] ) {
	
	case "DB_Skills": #region
		var effects_string = db_record_get("db_Skills",Databox_Pointer[ref],"effects");
		effects_string = string_replace_all(effects_string,"; ","\n");
		var width = 200;
		var effects_height = string_height_ext(effects_string,9,width-12);
		var height = 79 + effects_height;
		//Draw Box
		draw_blackbox(Databox_X[ref],Databox_Y[ref],width,height);
		//Draw Fields
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+12,width-4,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+38,Databox_Y[ref]+12,width-40,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+33,width-4,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+93,Databox_Y[ref]+33,35,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+163,Databox_Y[ref]+33,35,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+54,width-4,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+128,Databox_Y[ref]+54,70,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+75,width-4,2+effects_height,c_midgray,0.3);
		//Draw Headers
		draw_set_font(ft_EvoTooltip_6);
		draw_set_colour(c_midgray);
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+3,"ID:");
		draw_text(Databox_X[ref]+40,Databox_Y[ref]+3,"Name:");
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+24,"Element:");
		draw_set_font(ft_EvoTooltip_6_Squished);
		draw_text(Databox_X[ref]+95,Databox_Y[ref]+24,"Energy:");
		draw_text(Databox_X[ref]+130,Databox_Y[ref]+24,"Recharge:");
		draw_text(Databox_X[ref]+165,Databox_Y[ref]+24,"Priority:");
		draw_set_font(ft_EvoTooltip_6);
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+45,"Timeline:");		
		draw_text(Databox_X[ref]+130,Databox_Y[ref]+45,"Icon:");
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+66,"Effects:");
		//Draw Data
		draw_set_font(ft_EvoTooltip_6_Bold);
		draw_set_colour(c_lightgray);
		var id_string = "["+string_format(db_record_get("db_Skills",Databox_Pointer[ref],"id"),3,0)+"]";
		id_string = string_replace_all(id_string," ","0");
		draw_text(Databox_X[ref]+6,Databox_Y[ref]+13,id_string);
		draw_text(Databox_X[ref]+42,Databox_Y[ref]+13,db_record_get("db_Skills",Databox_Pointer[ref],"name"));
		draw_text_flatcolour(Databox_X[ref]+6,Databox_Y[ref]+34,db_record_get("db_Skills",Databox_Pointer[ref],"element"),find_colour(db_record_get("db_Skills",Databox_Pointer[ref],"element")),1);
		draw_text_flatcolour(Databox_X[ref]+97,Databox_Y[ref]+34,db_record_get("db_Skills",Databox_Pointer[ref],"cost"),c_water,1);
		draw_text_flatcolour(Databox_X[ref]+132,Databox_Y[ref]+34,db_record_get("db_Skills",Databox_Pointer[ref],"recharge"),c_fire,1);
		draw_text(Databox_X[ref]+167,Databox_Y[ref]+34,db_record_get("db_Skills",Databox_Pointer[ref],"priority"));
		draw_set_font(ft_EvoTooltip_6);
		draw_text(Databox_X[ref]+6,Databox_Y[ref]+55,db_record_get("db_Skills",Databox_Pointer[ref],"timeline"));
		draw_text(Databox_X[ref]+132,Databox_Y[ref]+55,db_record_get("db_Skills",Databox_Pointer[ref],"icon"));
		draw_text_ext(Databox_X[ref]+6,Databox_Y[ref]+76,effects_string,9,width-12);
		//Draw Icon
		draw_icon_dbskill(Databox_X[ref]+width-16,Databox_Y[ref]+60,24,Databox_Pointer[ref],1)
		//Draw Tooltip
		draw_tooltip_skill(Databox_Pointer[ref],Databox_X[ref],Databox_Y[ref]+height+3);
		break; #endregion
		
	case "DB_Creatures": #region
		var width = 164;
		var height = 25;
		//Draw Box
		draw_blackbox(Databox_X[ref],Databox_Y[ref],width,height);
		//Draw Fields
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+12,width-4,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+38,Databox_Y[ref]+12,width-40,11,c_midgray,0.3);
		//Draw Headers
		draw_set_font(ft_EvoTooltip_6);
		draw_set_colour(c_midgray);
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+3,"ID:");
		draw_text(Databox_X[ref]+40,Databox_Y[ref]+3,"Name:");
		//Draw Data
		draw_set_font(ft_EvoTooltip_6_Bold);
		draw_set_colour(c_lightgray);
		var id_string = "["+string_format(db_record_get("db_Creatures",Databox_Pointer[ref],"id"),3,0)+"]";
		id_string = string_replace_all(id_string," ","0");
		draw_text(Databox_X[ref]+6,Databox_Y[ref]+13,id_string);
		draw_text(Databox_X[ref]+42,Databox_Y[ref]+13,dbpull_creature_name(Databox_Pointer[ref]));
		break; #endregion
		
	case "DB_Creatures1": #region Creature Stats 
		var width = 164;
		var att_width = floor((width-4)/5);
		var height = 87;
		//Draw Sprite
		var sprite = dbpull_creature_sprite(Databox_Pointer[ref]);
		if ( sprite ) {
			draw_sprite(spr_shadows,dbpull_creature_shadow(Databox_Pointer[ref]),Databox_X[ref]+width+32,Databox_Y[ref]+height-10);
			draw_sprite(sprite,0,Databox_X[ref]+width+32,Databox_Y[ref]+height-10);
			};
		//Draw Box
		draw_blackbox(Databox_X[ref],Databox_Y[ref],width,height);
		//Draw Fields
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+12,width-4,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+33,width-4,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+48,Databox_Y[ref]+45,24,9,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+109,Databox_Y[ref]+45,24,9,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+65,att_width,20,c_power,0.3);
		draw_plane_coloured(Databox_X[ref]+2+att_width,Databox_Y[ref]+65,att_width,20,c_fortitude,0.3);
		draw_plane_coloured(Databox_X[ref]+2+att_width*2,Databox_Y[ref]+65,att_width,20,c_speed,0.3);
		draw_plane_coloured(Databox_X[ref]+2+att_width*3,Databox_Y[ref]+65,att_width,20,c_recovery,0.3);
		draw_plane_coloured(Databox_X[ref]+2+att_width*4,Databox_Y[ref]+65,att_width,20,c_potency,0.3);
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+76,width-4,9,c_black,0.2);
		//Draw Headers
		draw_set_font(ft_EvoTooltip_6);
		draw_set_colour(c_midgray);
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+3,"Element:");
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+24,"Sprite:");			
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+45,"Shadow:");	
		draw_text(Databox_X[ref]+80,Databox_Y[ref]+45,"Icon:");
		draw_set_font(ft_EvoTooltip_6_Squished);
		draw_set_halign(fa_center);
		draw_text_flatcolour(Databox_X[ref]+2+att_width*0.5,Databox_Y[ref]+55,term("Power"),c_power,1);
		draw_text_flatcolour(Databox_X[ref]+2+att_width*1.5,Databox_Y[ref]+55,term("Fortitude"),c_fortitude,1);
		draw_text_flatcolour(Databox_X[ref]+2+att_width*2.5,Databox_Y[ref]+55,term("Speed"),c_speed,1);
		draw_text_flatcolour(Databox_X[ref]+2+att_width*3.5,Databox_Y[ref]+55,term("Recovery"),c_recovery,1);
		draw_text_flatcolour(Databox_X[ref]+2+att_width*4.5,Databox_Y[ref]+55,term("Potency"),c_potency,1);
		draw_set_halign(fa_left);
		//Draw Data
		draw_set_font(ft_EvoTooltip_6_Bold);
		draw_set_colour(c_lightgray);
		draw_text_flatcolour(Databox_X[ref]+6,Databox_Y[ref]+13,dbpull_creature_element(Databox_Pointer[ref]),dbpull_creature_ecolour(Databox_Pointer[ref]),1);
		draw_set_font(ft_EvoTooltip_6);
		draw_text(Databox_X[ref]+6,Databox_Y[ref]+34,db_record_get("db_Creatures",Databox_Pointer[ref],"sprite"));
		draw_set_halign(fa_right);
		draw_text(Databox_X[ref]+69,Databox_Y[ref]+45,db_record_get("db_Creatures",Databox_Pointer[ref],"shadow"));
		draw_text(Databox_X[ref]+130,Databox_Y[ref]+45,db_record_get("db_Creatures",Databox_Pointer[ref],"icon"));
		draw_set_halign(fa_center);
		draw_set_colour(c_white);
		draw_set_font(ft_EvoTooltip_6_Bold);
		draw_text(Databox_X[ref]+2+att_width*0.5,Databox_Y[ref]+66,db_record_get("db_Creatures",Databox_Pointer[ref],"base_power"));
		draw_text(Databox_X[ref]+2+att_width*1.5,Databox_Y[ref]+66,db_record_get("db_Creatures",Databox_Pointer[ref],"base_fortitude"));
		draw_text(Databox_X[ref]+2+att_width*2.5,Databox_Y[ref]+66,db_record_get("db_Creatures",Databox_Pointer[ref],"base_speed"));
		draw_text(Databox_X[ref]+2+att_width*3.5,Databox_Y[ref]+66,db_record_get("db_Creatures",Databox_Pointer[ref],"base_recovery"));
		draw_text(Databox_X[ref]+2+att_width*4.5,Databox_Y[ref]+66,db_record_get("db_Creatures",Databox_Pointer[ref],"base_potency"));
		draw_set_font(ft_EvoTooltip_6);
		draw_set_colour(c_lightgray);
		draw_text(Databox_X[ref]+2+att_width*0.5,Databox_Y[ref]+76,"+"+string(db_record_get("db_Creatures",Databox_Pointer[ref],"power_growth")));
		draw_text(Databox_X[ref]+2+att_width*1.5,Databox_Y[ref]+76,"+"+string(db_record_get("db_Creatures",Databox_Pointer[ref],"fortitude_growth")));
		draw_text(Databox_X[ref]+2+att_width*2.5,Databox_Y[ref]+76,"+"+string(db_record_get("db_Creatures",Databox_Pointer[ref],"speed_growth")));
		draw_text(Databox_X[ref]+2+att_width*3.5,Databox_Y[ref]+76,"+"+string(db_record_get("db_Creatures",Databox_Pointer[ref],"recovery_growth")));
		draw_text(Databox_X[ref]+2+att_width*4.5,Databox_Y[ref]+76,"+"+string(db_record_get("db_Creatures",Databox_Pointer[ref],"potency_growth")));
		draw_set_halign(fa_left);
		//Draw Icon
		draw_icon_dbcreature(Databox_X[ref]+width-16,Databox_Y[ref]+39,24,Databox_Pointer[ref],1);
		break; #endregion
		
	case "DB_Creatures3": #region Creature Skills
		var skillset = dbpull_creature_skillset(Databox_Pointer[ref]);
		var skillset_core = dbpull_creature_skillset_core(Databox_Pointer[ref]);
		var width = 246;
		var height = 59 + ceil( ( array_height_2d(skillset) - 1 ) / 8 ) * 31;
		var stored_tooltip = 0;
		//Draw Box
		draw_blackbox(Databox_X[ref],Databox_Y[ref],width,height);
		//Draw Fields
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+12,width-4,33,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+55,width-4,height-57,c_midgray,0.3);
		//Draw Headers
		draw_set_font(ft_EvoTooltip_6);
		draw_set_colour(c_midgray);
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+3,"Core Skills:");
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+46,"Skills:");
		//Draw Core Skills
		var X = Databox_X[ref]+18; var Y = Databox_Y[ref]+29;
		for ( var i=1 ; i<array_height_2d(skillset_core) ; i++ ) {
			draw_icon_dbskill(X,Y,24,skillset_core[i,0],1);
			if ( mouse_in_region_gui( define_region_icon( X,Y,24 ) ) ) { stored_tooltip = skillset_core[i,0] };
			X+= 30;
			};
		//Draw Skills
		X = Databox_X[ref]+18; Y += 43;
		for ( var i=1 ; i<array_height_2d(skillset) ; i++ ) {
			draw_icon_dbskill(X,Y,24,skillset[i,0],1);
			if ( mouse_in_region_gui( define_region_icon( X,Y,24 ) ) ) { stored_tooltip = skillset[i,0] };
			X+= 30;
			if ( X > Databox_X[ref] + width ) {
				X = Databox_X[ref]+18;
				Y += 31;
				};	
			};
		//Draw Tooltip
		if ( stored_tooltip ) { draw_tooltip_skill( stored_tooltip, global.GUI_MouseX+2, global.GUI_MouseY+10 ) };
		break; #endregion
	
	case "PlayerContainer": #region
		var width = 167;
		var height = 46;
		//Draw Box
		draw_blackbox(Databox_X[ref],Databox_Y[ref],width,height);
		//Draw Fields
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+12,width-4,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+33,width-4,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+38,Databox_Y[ref]+33,width-40,11,c_midgray,0.3);
		//Draw Headers
		draw_set_font(ft_EvoTooltip_6);
		draw_set_colour(c_midgray);
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+3,"ID:");
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+24,"Tag:");
		draw_text(Databox_X[ref]+40,Databox_Y[ref]+24,"Name:");
		//Draw Data
		draw_set_font(ft_EvoTooltip_6_Bold);
		draw_set_colour(c_lightgray);
		var id_string = string(Databox_Pointer[ref]);
		draw_text(Databox_X[ref]+6,Databox_Y[ref]+13,id_string);
		draw_text(Databox_X[ref]+6,Databox_Y[ref]+34,"["+Databox_Pointer[ref].Player_Tag+"]");
		draw_text_flatcolour(Databox_X[ref]+42,Databox_Y[ref]+34,Databox_Pointer[ref].Player_Name,Databox_Pointer[ref].Player_Colour,1);
		break; #endregion
		
	case "StorageCreature": #region
		var p = Databox_Pointer[ref];
		var player = Databox_Pointer[1];
		if ( !player.Stored_Status[p] ) { return false };
		var width = 140;
		var height = 109;
		//Draw Box
		draw_blackbox(Databox_X[ref],Databox_Y[ref],width,height);
		//Draw Fields
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+12,width-4,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+38,Databox_Y[ref]+12,width-40,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+33,width-4,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+38,Databox_Y[ref]+33,width-40,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+54,width-4,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+38,Databox_Y[ref]+54,60,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+75,width-4,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+96,width-4,11,c_midgray,0.3);
		//Draw Headers
		draw_set_font(ft_EvoTooltip_6);
		draw_set_colour(c_midgray);
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+3,"ID:");
		draw_text(Databox_X[ref]+40,Databox_Y[ref]+3,"Name:");
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+24,"State:");
		draw_text(Databox_X[ref]+40,Databox_Y[ref]+24,"Species:");
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+45,"Level:");
		draw_text(Databox_X[ref]+40,Databox_Y[ref]+45,"Exp:");
		draw_text(Databox_X[ref]+100,Databox_Y[ref]+45,"Genome:");
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+66,"Skills:");
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+87,"Traits:");
		//Draw Data
		draw_set_font(ft_EvoTooltip_6_Bold);
		draw_set_colour(c_lightgray);
		if ( inparty(player,p) ) {	draw_text(Databox_X[ref]+6,Databox_Y[ref]+13,string(p)+"/"+string(inparty(player,p))) };
			else	   {	draw_text(Databox_X[ref]+6,Databox_Y[ref]+13,p) };
		draw_text(Databox_X[ref]+42,Databox_Y[ref]+13,player.Stored_Name[p]);
		draw_text(Databox_X[ref]+6,Databox_Y[ref]+34,player.Stored_Status[p]);
		draw_text(Databox_X[ref]+16,Databox_Y[ref]+34,player.Stored_Form[p]);
		draw_text(Databox_X[ref]+26,Databox_Y[ref]+34,player.Stored_Quality[p]);
		draw_text(Databox_X[ref]+42,Databox_Y[ref]+34,string(player.Stored_Species[p])+":"+string(db_record_get("db_Creatures",player.Stored_Species[p],"name")));
		draw_text(Databox_X[ref]+6,Databox_Y[ref]+55,player.Stored_Level[p]);
		draw_text(Databox_X[ref]+42,Databox_Y[ref]+55,player.Stored_Exp[p]);
		draw_sprite_ext(spr_genomestar,0,Databox_X[ref]+116,Databox_Y[ref]+58,1,1,0,find_colour(player.Stored_Genome[p]+10),1);
		//draw_text(Databox_X[ref]+102,Databox_Y[ref]+55,player.Stored_Genome[p]);
		draw_set_font(ft_EvoTooltip_6);
		draw_text(Databox_X[ref]+6,Databox_Y[ref]+76,player.Stored_SkillString[p]);
		draw_text(Databox_X[ref]+6,Databox_Y[ref]+97,player.Stored_TraitString[p]);
		break; #endregion
		
	case "PartyCreature": #region
		var p = Databox_Pointer[ref];
		var player = Databox_Pointer[1];
		if ( p > party_lastentry(player) ) { p = party_lastentry(player) };
		if ( !player.Party_Status[p] ) { return false };
		var skill_height = 11 * ceil( array_length_2d(player.Party_Skill,p) / 7 );
		var trait_height = 11 * ceil( array_length_2d(player.Party_Trait,p) / 7 );
		var width = 140;
		var height = 87+skill_height+trait_height;
		//Draw Box
		draw_blackbox(Databox_X[ref],Databox_Y[ref],width,height);
		//Draw Fields
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+12,width-4,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+38,Databox_Y[ref]+12,width-40,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+33,width-4,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+38,Databox_Y[ref]+33,width-40,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+54,width-4,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+38,Databox_Y[ref]+54,60,11,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+75,width-4,skill_height,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+21,Databox_Y[ref]+75,19,skill_height,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+59,Databox_Y[ref]+75,19,skill_height,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+97,Databox_Y[ref]+75,19,skill_height,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+2,Databox_Y[ref]+85+skill_height,width-4,trait_height,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+21,Databox_Y[ref]+85+skill_height,19,trait_height,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+59,Databox_Y[ref]+85+skill_height,19,trait_height,c_midgray,0.3);
		draw_plane_coloured(Databox_X[ref]+97,Databox_Y[ref]+85+skill_height,19,trait_height,c_midgray,0.3);
		//Draw Headers
		draw_set_font(ft_EvoSmallcaps_6);		
		if ( inbattle() )	{ draw_text_flatcolour(Databox_X[ref]+4,Databox_Y[ref]-10,"In Battle",c_fire,1) };
					   else { draw_text_flatcolour(Databox_X[ref]+4,Databox_Y[ref]-10,"Not In Battle",c_nature,1) };
		draw_set_font(ft_EvoTooltip_6);
		draw_set_colour(c_midgray);
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+3,"ID:");
		draw_text(Databox_X[ref]+40,Databox_Y[ref]+3,"Name:");
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+24,"State:");
		draw_text(Databox_X[ref]+40,Databox_Y[ref]+24,"Species:");
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+45,"Level:");
		draw_text(Databox_X[ref]+40,Databox_Y[ref]+45,"Exp:");
		draw_text(Databox_X[ref]+100,Databox_Y[ref]+45,"Genome:");
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+66,"Skills:");
		draw_text(Databox_X[ref]+4,Databox_Y[ref]+76+skill_height,"Traits:");
		//Draw Data
		draw_set_font(ft_EvoTooltip_6_Bold);
		draw_set_colour(c_lightgray);
		draw_text(Databox_X[ref]+6,Databox_Y[ref]+13,string(p)+"/"+string(player.Party_StoredID[p]));
		draw_text(Databox_X[ref]+42,Databox_Y[ref]+13,player.Party_Name[p]);
		draw_text(Databox_X[ref]+6,Databox_Y[ref]+34,player.Party_Status[p]);
		draw_text(Databox_X[ref]+16,Databox_Y[ref]+34,player.Party_Form[p]);
		draw_text(Databox_X[ref]+26,Databox_Y[ref]+34,player.Party_Quality[p]);
		draw_text(Databox_X[ref]+42,Databox_Y[ref]+34,string(player.Party_Species[p])+":"+string(db_record_get("db_Creatures",player.Party_Species[p],"name")));
		draw_text(Databox_X[ref]+6,Databox_Y[ref]+55,player.Party_Level[p]);
		draw_text(Databox_X[ref]+42,Databox_Y[ref]+55,player.Party_Exp[p]);
		draw_sprite_ext(spr_genomestar,0,Databox_X[ref]+116,Databox_Y[ref]+58,1,1,0,find_colour(player.Party_Genome[p]+10),1);
		//draw_text(Databox_X[ref]+102,Databox_Y[ref]+55,player.Party_Genome[p]);
		draw_set_font(ft_EvoTooltip_6);
		draw_set_halign(fa_right);
		draw_text(Databox_X[ref]+width-4,Databox_Y[ref]+66,player.Party_SkillString[p]);
		draw_text(Databox_X[ref]+width-4,Databox_Y[ref]+76+skill_height,player.Party_TraitString[p]);
		draw_set_font(ft_EvoTooltip_6_Condensed);
		var _x = Databox_X[ref]+19; var _y = Databox_Y[ref]+76;
		for ( var i=0 ; i<array_length_2d(player.Party_Skill,p); i++ ) {
			draw_text(_x,_y,player.Party_Skill[p,i]);
			_x += 19;
			if ( _x > Databox_X[ref]+width ) {
				_x = Databox_X[ref]+19; _y += 11;
				};
			};
		_x = Databox_X[ref]+19; _y = Databox_Y[ref]+86+skill_height;
		for ( var i=0 ; i<array_length_2d(player.Party_Trait,p); i++ ) {
			draw_text(_x,_y,player.Party_Trait[p,i]);
			_x += 19;
			if ( _x > Databox_X[ref]+width ) {
				_x = Databox_X[ref]+19; _y += 11;
				};
			};
		draw_set_halign(fa_left);
		break; #endregion
		
	case "PartyCreature:Attributes": #region
		var width = 112;
		var height = 64;
		var stat_spacing = 12;
	
		//Draw Sprite
		draw_sprite(spr_shadows,Databox_Shadow,Databox_X[ref]+width*0.5,Databox_Y[ref]-10,);
		draw_sprite(Databox_Sprite,0,Databox_X[ref]+width*0.5,Databox_Y[ref]-10,);
		//Draw Species
		draw_set_font(ft_EvoTooltip_6_Bold);
		draw_set_halign(fa_right);
		draw_text_flatcolour(Databox_X[ref]+width,Databox_Y[ref]-10,Databox_SpeciesName,c_darkgray,1);
		draw_set_halign(fa_left); 
	
		//Attribute Box
		//Draw Box
		draw_blackbox(Databox_X[ref],Databox_Y[ref],width,height);
		//Draw Attributes
		for ( var i=0 ; i<5 ; i++ ) {
			draw_tilebox_ext(Databox_X[ref]+2,Databox_Y[ref]+5+stat_spacing*i,width-4,8,spr_whitebox,find_colour_dark(i+11),1);
			draw_tilebox_ext(Databox_X[ref]+2,Databox_Y[ref]+3+stat_spacing*i,width-4,8,spr_whitebox,find_colour_light(i+11),1);
			draw_tilebox_ext(Databox_X[ref]+2,Databox_Y[ref]+4+stat_spacing*i,width-4,8,spr_whitebox,find_colour(i+11),1);
			draw_set_font(ft_EvoTooltip_6_Bold);
			draw_text_flatcolour(Databox_X[ref]+8,Databox_Y[ref]+4+stat_spacing*i,term(find_attribute_name(i+1)),find_colour_dark(i+11),1);
			draw_text_flatcolour(Databox_X[ref]+8,Databox_Y[ref]+3+stat_spacing*i,term(find_attribute_name(i+1)),c_white,1);
			draw_set_halign(fa_right);
			draw_text_flatcolour(Databox_X[ref]+width-8,Databox_Y[ref]+4+stat_spacing*i,Databox_Attributes[i+1],find_colour_dark(i+11),1);
			draw_text_flatcolour(Databox_X[ref]+width-8,Databox_Y[ref]+3+stat_spacing*i,Databox_Attributes[i+1],c_white,1);
			draw_set_halign(fa_left); 
			};
		//Draw Genome Star
		draw_sprite_ext(spr_genomestar,0,Databox_X[ref]+8,Databox_Y[ref]-9,1,1,0,find_colour(Player.Party_Genome[Party_Member]+10),1);
		break; #endregion
		
	case "PartyCreature:Status": #region
		var width = 216;
		var height1 = 48;
		var height2 = 49;
		var height3 = 48;
		//Draw Box
		draw_blackbox_sharp(Databox_X[ref],Databox_Y[ref],width,height1-1,0,0,1,1);
		draw_blackbox_sharp(Databox_X[ref],Databox_Y[ref]+height1,width,height2-1,1,1,1,1);
		draw_blackbox_sharp(Databox_X[ref],Databox_Y[ref]+height1+height2,width,height3,1,1,0,0);
		draw_plane_coloured(Databox_X[ref]+1,Databox_Y[ref]+height1-1,width-2,1,c_darkgray,0.8);
		draw_plane_coloured(Databox_X[ref]+1,Databox_Y[ref]+height1+height2-1,width-2,1,c_darkgray,0.8);
		//Headers
		draw_set_color(c_white);
		draw_text_flatcolour(Databox_X[ref]+3,Databox_Y[ref]+height1-1,term("Skills"),c_midgray,1);
		draw_text_flatcolour(Databox_X[ref]+3,Databox_Y[ref]+height1-2,term("Skills"),c_white,1);
		draw_text_flatcolour(Databox_X[ref]+3,Databox_Y[ref]+height1+height2-1,term("Passives"),c_midgray,1);
		draw_text_flatcolour(Databox_X[ref]+3,Databox_Y[ref]+height1+height2-2,term("Passives"),c_white,1);
		//Info
		draw_text_flatcolour(Databox_X[ref]+4,Databox_Y[ref]+2,term("Element")+":",c_lightgray,1);
		draw_text_flatcolour(Databox_X[ref]+4,Databox_Y[ref]+23,term("Genome")+":",c_lightgray,1);
		draw_plane_coloured(Databox_X[ref]+8,Databox_Y[ref]+12,64,11,c_midgray,0.5);
		draw_plane_coloured(Databox_X[ref]+8,Databox_Y[ref]+33,64,11,c_midgray,0.5);
		draw_set_halign(fa_center);
		draw_text_flatcolour(Databox_X[ref]+40,Databox_Y[ref]+14,Databox_Element,find_colour_dark(Databox_EColour),1);
		draw_text_flatcolour(Databox_X[ref]+40,Databox_Y[ref]+13,Databox_Element,Databox_EColour,1);
		draw_text_flatcolour(Databox_X[ref]+40,Databox_Y[ref]+35,find_genome_name(Player.Party_Genome[Party_Member]),find_colour_dark(Player.Party_Genome[Party_Member]+10),1);
		draw_text_flatcolour(Databox_X[ref]+40,Databox_Y[ref]+34,find_genome_name(Player.Party_Genome[Party_Member]),find_colour(Player.Party_Genome[Party_Member]+10),1);
		draw_set_halign(fa_left);
		//Skills
		break; #endregion
		
		case "PartyCreature:Skills": #region
		var width = 216;
		var height = 40;
		//Draw Box
		draw_blackbox(Databox_X[ref],Databox_Y[ref],width,height);
		break; #endregion
		
		case "PartyCreature:Passives": #region
		var width = 216;
		var height = 145;
		//Draw Box
		draw_blackbox(Databox_X[ref],Databox_Y[ref],width,height);
		break; #endregion
		
	};