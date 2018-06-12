///_keyboardCommandAsString(command);

switch ( argument0 ) {
	
	case vk_nokey:			return "";
	case vk_anykey:			return "Any";
	case vk_left:			return "Left";
	case vk_right:			return "Right";
	case vk_up:				return "Up";
	case vk_down:			return "Down";
	case vk_enter:			return "Enter";
	case vk_escape:			return "Esc";
	case vk_space:			return "Space";
	case vk_shift:			return "Shift";
	case vk_control:		return "Ctrl";
	case vk_alt:			return "Alt";
	case vk_backspace:		return "Backspace";
	case vk_tab:			return "Tab";
	case vk_home:			return "Home";
	case vk_end:			return "End";
	case vk_delete:			return "Del";
	case vk_insert:			return "Ins";
	case vk_pageup:			return "PgUp";
	case vk_pagedown:		return "PgDn";
	case vk_pause:			return "Pause";
	case vk_printscreen:	return "Print Screen";
	
	case vk_f1:				return "F1";
	case vk_f2:				return "F2";
	case vk_f3:				return "F3";
	case vk_f4:				return "F4";
	case vk_f5:				return "F5";
	case vk_f6:				return "F6";
	case vk_f7:				return "F7";
	case vk_f8:				return "F8";
	case vk_f9:				return "F9";
	case vk_f10:			return "F10";
	case vk_f11:			return "F11";
	case vk_f12:			return "F12";
	
	case vk_numpad0:		return "0";
	case vk_numpad1:		return "1";
	case vk_numpad2:		return "2";
	case vk_numpad3:		return "3";
	case vk_numpad4:		return "4";
	case vk_numpad5:		return "5";
	case vk_numpad6:		return "6";
	case vk_numpad7:		return "7";
	case vk_numpad8:		return "8";
	case vk_numpad9:		return "9";
	
	case vk_multiply:		return "*";
	case vk_divide:			return "/";
	case vk_add	:			return "+";
	case vk_subtract:		return "-";
	case vk_decimal:		return ".";
	
	case vk_lshift:			return "L-Shift";
	case vk_lcontrol:		return "L-Ctrl";
	case vk_lalt:			return "L-Alt";
	case vk_rshift:			return "R-Shift";
	case vk_rcontrol:		return "R-Ctrl";
	case vk_ralt:			return "R-Alt";
	
	default:				return chr( argument0 );
	
	};