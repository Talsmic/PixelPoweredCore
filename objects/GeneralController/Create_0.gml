event_inherited();

set_GlobalAlignment_Track		= true;
set_GlobalAlignment_Carryover	= true;
set_GlobalFont_Track			= true;
set_GlobalFont_Carryover		= true;
set_GlobalFont_DefaultFont		= true;
set_GlobalBeats					= true;
set_ScrollKeys					= [vk_left, vk_up, vk_down, vk_right, vk_pageup, vk_pagedown, vk_end, vk_home]

//Intialise global beats
global.GameBeat = _beatArray(0, 1, 0.05, 1);
global.ScrollBeat = _beatArray(0, 1, 1, 15);