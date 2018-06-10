/// @desc Size Check
Event_SizeCheck = false;

if ( _windowWidth() != Check_Width ) {
	_log("Resolution Error[3]: Window Width out by "+string(_windowWidth()-Check_Width)+"px");
	Event_ResizeWindow = true;
	Resize_Width = clamp(Resize_Width-1, MinWidth, Resize_Width); 
	};
			
if ( _windowHeight() != Check_Height ) {
	_log("Resolution Error[3]: Window Height out by "+string(_windowHeight()-Check_Height)+"px");
	Event_ResizeWindow = true;
	Resize_Height = clamp(Resize_Height-1, MinHeight, Resize_Height); 
	};

event_user(0); //Decide next action