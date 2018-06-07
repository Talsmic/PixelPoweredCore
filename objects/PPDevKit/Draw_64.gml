if Hidden exit;//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>

//Draw Titlebar and Anchor
if Minimised {
	drawBlackbox(-4,-4,22,10);
	draw_sprite(spr_scrollarrow,4,8,5);
	exit;
	}
else {
	drawPlane(0,0,_resolutionGetWidth(),12,c_black,0.8)
	_setFont(ft_Pixis07_Bold);
	drawText(2,2,"PixelPowered DevKit",c_orange,1);
	drawBlackbox(-4,12,22,12,[1,1,0,0]);
	draw_sprite(spr_scrollarrow,0,8,17);
	};

	
uiTabset_Draw(1);


switch ( Mode ) {
	
	case "Instances":
		uiTabset_Draw(2);
		switch ( SubMode ) {
			
			case "Settings": break;
				draw_sprite(ico_container,0,18,26);
				drawText(38,26,"OptionsContainer",c_orange,1);
				if ( instance_exists( OptionsContainer ) ) {
					drawText(42,35,"ENABLED",c_nature,1);
					drawSimplebox(28,38,100,20);
					}
				else {
					drawText(42,35,"DISABLED",c_fire,1);					
					};
		
				break; 
						
			//case "Resolution": 
				draw_sprite(ico_controller,0,18,26);
				drawText(38,26,"ResolutionController",c_orange,1);
				if ( instance_exists( ResolutionController ) ) {
					drawText(42,35,"ENABLED",c_nature,1);
					drawSimplebox(28,38,100,20);
					}
				else {
					drawText(42,35,"DISABLED",c_fire,1);					
					};
		
				break; 
				
			//case "Focus": 
				draw_sprite(ico_controller,0,18,26);
				drawText(38,26,"FocusController",c_orange,1);
				if ( instance_exists( FocusController ) ) {
					drawText(42,35,"ENABLED",c_nature,1);
					drawSimplebox(28,38,100,20);
					}
				else {
					drawText(42,35,"DISABLED",c_fire,1);					
					};
		
				break; 
						
			};
		break;
		
	};