if Hidden exit;//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>

//Draw Titlebar and Anchor
if Minimised {
	draw_blackbox(-4,-4,22,10);
	draw_sprite(spr_scrollarrow,4,8,5);
	exit;
	}
else {
	draw_plane(0,0,resolution_get_width(),12,c_black,0.8)
	set_font(ft_EvoTooltip_6_Bold);
	draw_text_flatcolour(2,2,"PixelPowered DevKit",c_orange,1);
	draw_blackbox(-4,12,22,12,[1,1,0,0]);
	draw_sprite(spr_scrollarrow,0,8,17);
	};

	
ui_TabSet_draw(1);


switch ( Mode ) {
	
	case "Instances":
		ui_TabSet_draw(2);
		switch ( SubMode ) {
			
			case "Settings": break;
				draw_sprite(ico_container,0,18,26);
				draw_text_flatcolour(38,26,"oSettingsContainer",c_orange,1);
				if ( instance_exists( oSettingsContainer ) ) {
					draw_text_flatcolour(42,35,"ENABLED",c_nature,1);
					draw_simplebox(28,38,100,20);
					}
				else {
					draw_text_flatcolour(42,35,"DISABLED",c_fire,1);					
					};
		
				break; 
						
			//case "Resolution": 
				draw_sprite(ico_controller,0,18,26);
				draw_text_flatcolour(38,26,"oResolutionController",c_orange,1);
				if ( instance_exists( oResolutionController ) ) {
					draw_text_flatcolour(42,35,"ENABLED",c_nature,1);
					draw_simplebox(28,38,100,20);
					}
				else {
					draw_text_flatcolour(42,35,"DISABLED",c_fire,1);					
					};
		
				break; 
				
			//case "Focus": 
				draw_sprite(ico_controller,0,18,26);
				draw_text_flatcolour(38,26,"oFocusController",c_orange,1);
				if ( instance_exists( oFocusController ) ) {
					draw_text_flatcolour(42,35,"ENABLED",c_nature,1);
					draw_simplebox(28,38,100,20);
					}
				else {
					draw_text_flatcolour(42,35,"DISABLED",c_fire,1);					
					};
		
				break; 
						
			};
		break;
		
	};