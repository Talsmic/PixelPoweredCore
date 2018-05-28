/// @desc Updates (Every Update Window)
alarm[0] = global.UpdateWindow;
setdepth(eFocusLayer.GUI);

/*
//Update Mode from tabs
switch ( Pointer_Tabset[1] ) {
	
	case 1:
		Mode = "Global";
		break;
		
	case 2:
		Mode = "Room";
		break;
	
	case 3:
		Mode = "Instances";
		switch ( Pointer_Tabset[2] ) {
			case 1:		SubMode = "Settings";			break;
			case 2:		SubMode = "Resolution";			break;
			case 3:		SubMode = "Focus";				break;
			};
		break;
		
	};

//Update Slaves
switch ( Mode ) {
	
	case "Global":
		InstanceHook.Hidden = true;
		break;
		
	case "Room":
		InstanceHook.Hidden = true;
		break;
	
	case "Instances":
		InstanceHook.Hidden = false;
		InstanceHook.Pointer_InstanceID = id;
		break;
		
	};