if Hidden exit;//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>

//Minimisation Anchor
if mouse_in_region([0,0,24,24]) { Minimised = toggle(Minimised) }
if Minimised exit;

//Mode Tabset
if ui_TabSet_leftclick(1) { event_perform(ev_alarm,0) };


switch ( Mode ) {
	
	case "Instances":
	ui_TabSet_leftclick(2);
	
		switch ( SubMode ) {
			
			case "Settings": #region
				
				if ( mouse_in_region([18,26,38,46]) ) {
					if ( instance_exists(oSettingsContainer) ) { instance_destroy(oSettingsContainer) };
					else { instance_create_depth(0,0,0,oSettingsContainer) };
					};
		
				break; #endregion
						
			case "Resolution": #region
				
				if ( mouse_in_region([18,26,38,46]) ) {
					if ( instance_exists(oResolutionController) ) { instance_destroy(oResolutionController) };
					else { instance_create_depth(0,0,0,oResolutionController) };
					};
		
				break; #endregion
				
			case "Focus": #region
				
				if ( mouse_in_region([18,26,38,46]) ) {
					if ( instance_exists(oFocusController) ) { instance_destroy(oFocusController) };
					else { instance_create_depth(0,0,0,oFocusController) };
					};
		
				break; #endregion
				
			};
		break;
		
	};