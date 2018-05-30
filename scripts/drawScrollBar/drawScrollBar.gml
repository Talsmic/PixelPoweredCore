///drawScrollBar(scrollbar_array);
/// @arg scrollbar_array	#scrollbar_array#
/*
	[[ Draws ]]		
*/ 
#region Arguments & Variables
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
//Arguments
var _scrollbar = argument[0];
#endregion

drawScrollBarArrayless(_scrollbar[eScrollbar.region], _scrollbar[eScrollbar.value], _scrollbar[eScrollbar.max_value], _scrollbar[eScrollbar.dir], _scrollbar[eScrollbar.arrows], _scrollbar[eScrollbar.spriteset], _scrollbar[eScrollbar.colour]);