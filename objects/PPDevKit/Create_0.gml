event_inherited();
WindowAnchor_X = fa_left; WindowAnchor_X_pad = 0;
WindowAnchor_Y = fa_top; WindowAnchor_Y_pad = 0;

KeyBind_VisibilityToggle = vk_f12;
KeyBind_CommandLine = vk_f11;

Hidden = false;
Minimised = true;
foc_focus_level = 2;
isFocusSetter = false;

CommandLine_Input = "";

Mode = "Controllers";
SubMode = "Settings"

uiTabset_Create(1,[3,"Global","Room","Instances"],20,12);
	
uiTabset_Create(2,[3,"Settings","Resolution","Focus"],20,32,NONE,DOWN);
	
InstanceHook = instance_create_as_slave(0,0,hookInstance);