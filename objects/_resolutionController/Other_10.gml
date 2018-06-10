/// @desc Event Priority

if ( Event_SizeCheck ) { 
	alarm[3] = 1;	
	alarm[9]++;		
	exit;
	};

if ( Event_ResizeWindow ) { 
	alarm[2] = 1;	//Queue a Window Resize next step
	alarm[9]++;		//Delay low prioririty updates
	exit;
	};
	
if ( Event_CenterScreen ) { 
	alarm[1] = 1;	//Queue a screen centering next step
	alarm[9]++;		//Delay low prioririty updates
	exit;
	};
	
if ( Event_ResizeResolution ) { 
	alarm[0] = 1;	//Retrigger this event next step
	alarm[9]++;		//Delay low prioririty updates
	exit;
	};
		
alarm[0] = RefreshRate;