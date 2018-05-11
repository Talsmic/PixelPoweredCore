///globalcontroller_command(command);
/// @arg command
var command = argument0;
//Sanitise command
command = string_lettersdigits( command );
command = string_lower( command );

switch ( command ) {
	
	//Options
	case "fullscreen":		Options_Fullscreen = toggle(Options_Fullscreen);
							ResolutionSnapNextFrame = true;								break;
	case "scale":			Options_Magnification = get_integer("Screen Scale:",3);
							ResolutionSnap_Magnification = Options_Magnification;
							ResolutionSnapNextFrame = true;								break;
	case "lockedscale":		Options_LockedMagnification = toggle(Options_LockedMagnification);
							ResolutionSnap_Magnification = Options_Magnification;
							ResolutionSnapNextFrame = true;								break;
	case "vsync":			Options_Vsync = toggle(Options_Vsync);						break;
	
	//Debug Drawing
	case "draw":				Draw = toggle(Draw);	break;
	case "drawfocus":			Draw = true; Draw_FocusLevel = toggle(Draw_FocusLevel);	break;
	case "drawframerate":		Draw = true; Draw_FrameRate = toggle(Draw_FrameRate);	break;
	case "drawbeat":			Draw = true; Draw_Beat = toggle(Draw_Beat);				break;
	case "drawmouse":			Draw = true; Draw_Mouse = toggle(Draw_Mouse);			break;
	
	//Resolution
	case "resminx":		Resolution_MinWidth	= get_integer("Minimum Width:",400);		break;
	case "resminy":		Resolution_MinHeight= get_integer("Minimum Height:",200);		break;
	case "guisnap":		Resolution_GUIsnap = toggle(Resolution_GUIsnap);				break;
	case "ressetx":		var input = get_integer("Screen Width:",480);		
						window_set_size(input,window_get_height());						break;
	case "ressety":		var input = get_integer("Screen Height:",270);		
						window_set_size(window_get_width(),input);						break;
	case "magnification":
						ResolutionSnap_Magnification = get_integer("Screen Magnification:",3);		
						ResolutionSnapNextFrame = true;									break;
	
	//Debug Databases
	case "opendatabase":
		if ( !instance_exists(uiDatabaseBrowser) ) {	DatabaseBrowser = instance_create_depth(0,0,5,uiDatabaseBrowser)	};
		else { instance_destroy( DatabaseBrowser ) };
		break;
	case "opendatabaseskills": case "opendatabaseskill":
		if ( !instance_exists(uiDatabaseBrowser) ) {	DatabaseBrowser = instance_create_depth(0,0,5,uiDatabaseBrowser)	};
		else { instance_destroy( DatabaseBrowser ) };
		with ( DatabaseBrowser ) { ui_listbox_command("parentmodeskills") };
		break;
	case "opendatabasecreatures": case "opendatabasecreature":
		if ( !instance_exists(uiDatabaseBrowser) ) {	DatabaseBrowser = instance_create_depth(0,0,5,uiDatabaseBrowser)	};
		else { instance_destroy( DatabaseBrowser ) };
		with ( DatabaseBrowser ) { ui_listbox_command("parentmodecreatures") };
		break;
	case "openplayermanager":
		if ( !instance_exists(uiPlayerBrowser) ) { PlayerBrowser = instance_create_depth(0,0,5,uiPlayerBrowser)	};
		else { instance_destroy( PlayerBrowser ) };
		break;
		
		
	};