///ui_listbox_keyrelease();
/*FocusCheck*/	if ( !infocus() ) { return };	/*FocusCheck*/
		
var KeyLeft = keyboard_check_released(vk_left);
var KeyRight = keyboard_check_released(vk_right);
var KeyUp = keyboard_check_released(vk_up);
var KeyDown = keyboard_check_released(vk_down);
var KeyPgUp = keyboard_check_released(vk_pageup);
var KeyPgDown = keyboard_check_released(vk_pagedown);
var KeyEnd = keyboard_check_released(vk_end);
var KeyHome = keyboard_check_released(vk_home);
var KeyTab = keyboard_check_released(vk_tab);
var KeyIns = keyboard_check_released(vk_insert);

//Debug CommandLine
if ( KeyIns ) {
	var insertcommand = get_string("Listbox Commandline:","");
	ui_listbox_command( insertcommand );
	};

//Tab
if ( KeyTab and Listbox_TabEnabled ) {		
	if ( keyboard_check(vk_shift) and Listbox_ShiftTabEnabled ) {
		Listbox_ShiftTabArray[0] += 1;
		if ( Listbox_ShiftTabArray[0] >= array_length_1d(Listbox_ShiftTabArray) ) { Listbox_ShiftTabArray[0] = 1 };
		var tabmode = Listbox_ShiftTabArray[Listbox_ShiftTabArray[0]];
		};
	else {
		Listbox_TabArray[0] += 1;
		if ( Listbox_TabArray[0] >= array_length_1d(Listbox_TabArray) ) { Listbox_TabArray[0] = 1 };
		var tabmode = Listbox_TabArray[Listbox_TabArray[0]];
		};
	ui_listbox_command( tabmode );
	};
	
//Move Focus Position
if ( KeyLeft ) {	ui_listbox_command("MoveFocusLeft")	};
if ( KeyRight ) {	ui_listbox_command("MoveFocusRight")	};
if ( KeyUp ) {		ui_listbox_command("MoveFocusUp")	};
if ( KeyDown ) {	ui_listbox_command("MoveFocusDown")	};

//Scroll Window		
if ( KeyPgUp ) { ui_listbox_command("ScrollUp") };
if ( KeyPgDown ) { ui_listbox_command("ScrollDown") };
if ( KeyEnd ) { ui_listbox_command("ScrollBottom") };
if ( KeyHome ) { ui_listbox_command("ScrollTop") };