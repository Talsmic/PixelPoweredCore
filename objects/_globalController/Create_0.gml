_class_Controller();

//	Global Alignment Tracking
//	Resets the global.Align variables at the start of each draw step
GlobalTracking_Alignment			= true;
GlobalTracking_Alignment_Carryover	= false;

//	Global Font Tracking
//	Resets the global.Font variables at the start of each draw step
GlobalTracking_Font					= true;
GlobalTracking_Font_Carryover		= true;
GlobalTracking_Font_DefaultFont		= ft_Pixis07;

//	Global Beats
GlobalTracking_Beats				= true;
//	A global syncronised beat
global.GameBeat = _beatArray(0, 1, 0.05, 1);
//	A global beat that resets every time a "Scroll Key" is hit
global.ScrollBeat = _beatArray(0, 1, 1, 15);
ScrollKeys	= [	vk_left, 
				vk_up, 
				vk_down, 
				vk_right, 
				vk_pageup, 
				vk_pagedown, 
				vk_end, 
				vk_home			];