if Hidden exit;//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>

//Minimisation Anchor
if _mouseInRegion([0,0,24,24]) { Minimised = _toggle(Minimised) }
if Minimised exit;

//Mode Tabset
if uiTabset_LeftClick(1) { event_perform(ev_alarm,0) };


switch ( Mode ) {
	
	case "Instances":
	uiTabset_LeftClick(2);
	
		switch ( SubMode ) {
			
			case "Settings": #region
				
				if ( _mouseInRegion([18,26,38,46]) ) {
					if ( instance_exists(OptionsContainer) ) { instance_destroy(OptionsContainer) };
					else { instance_create_depth(0,0,0,OptionsContainer) };
					};
		
				break; #endregion
						
			case "Resolution": #region
				
				if ( _mouseInRegion([18,26,38,46]) ) {
					if ( instance_exists(ResolutionController) ) { instance_destroy(ResolutionController) };
					else { instance_create_depth(0,0,0,ResolutionController) };
					};
		
				break; #endregion
				
			case "Focus": #region
				
				if ( _mouseInRegion([18,26,38,46]) ) {
					if ( instance_exists(_focusController) ) { instance_destroy(_focusController) };
					else { instance_create_depth(0,0,0,_focusController) };
					};
		
				break; #endregion
				
			};
		break;
		
	};