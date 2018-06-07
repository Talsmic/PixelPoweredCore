///uiScrollBar_Draw(scrollbar_array);
/// @arg scrollbar_array	#scrollbar_array#
/*
	[[ Draws ]]		
*/ 
#region Arguments & Variables
if argument_count < 1 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
//Arguments
var _scrollbar = argument[0];
#endregion

uiScrollBar_DrawCustom(	_scrollbar[aScrollbar.region], 
						_scrollbar[aScrollbar.value], 
						_scrollbar[aScrollbar.max_value], 
						_scrollbar[aScrollbar.dir], 
						_scrollbar[aScrollbar.arrows], 
						_scrollbar[aScrollbar.spriteset], 
						_scrollbar[aScrollbar.colour], 
						_scrollbar[aScrollbar.keys_increase], 
						_scrollbar[aScrollbar.keys_decrease]	);