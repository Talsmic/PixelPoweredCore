/// @desc Low Priority Updates
alarm[9] = 60;

//Cap Minimum window size
if ( MinWidth )  { window_set_min_width( MinWidth * MinScaling ) };
if ( MinHeight ) { window_set_min_height( MinHeight * MinScaling ) };

//Set the window colour
window_set_colour( MarginColour );