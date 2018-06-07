///ppdk_vars_Global
/*
==[Datatypes]=======================================================================================
===[General]===========[Specific Variants]===========================================================
	{any}			|	
	{array}			|	
	{array_2d}		|
	{boolean}		|
	{integer}		|	angle {integer|0..360}			{integer|steps}
	{real}			|	alpha {real|0..1}
	{string}		|
===[Special Arrays]====[Usage]======================================================================
	#region#		|	  [eR.x1, eR.y1, eR.x2, eR.y2, eR.w, eR.height];
					|		A special array type that defines a certain rectangle.
					|		You can use the eR enum to refer to the correct section in a 
					|		region_array (eg. region_array[eR.h] will give the region's height)
	#align#			|	  [align_x, align_y] 
					|	++[, offset_x, offsey_y]
					|		A special array type that defines x and y alignment.
	#beat#			|	  [eBeat.value, eBeat.v_min, eBeat.max, eBeat.increment, eBeat.rate]
===[IDs]===============[Usage]======================================================================
	#sprite_id#		|	ID of a Sprite Resource
	#image_id#		|	image_index of a Sprite Resource
	#font_id#		|	ID of a Font Resource
===[enums]=======[Remember]:[You can get info on any enum by highlighting it and hitting F1]========
	#eButtonState#		
	#eDataType#
	#eDirection#	
	#eFocusLayer#		
	#eFontStyle#	
====================================================================================================
	
===[Global Variable]================[IsArray]==[Contains]===========================================	
	global.AlignX 					|		|	{integer} Contains the horizontal alignment
	global.AlignY 					|		|	{integer} Contains the horizontal alignment
	global.AlignXo 				|		|	{real}	
	global.AlignYo					|		|	{real}		
	global.GUI_MouseX
	global.GUI_MouseY
	global.UpdateWindow
	global.GameBeat					|
	global.ScrollBeat
	global.Font
	global.BaseFont