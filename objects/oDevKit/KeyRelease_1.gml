if keyboard_check_released( KeyBind_VisibilityToggle ) { Hidden = toggle(Hidden) };

if keyboard_check_released( KeyBind_CommandLine ) { CommandLine_Input = get_string_async("oDevKitController.commandline","") };