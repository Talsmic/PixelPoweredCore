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
	#region#		|	  [aR.x1, aR.y1, aR.x2, aR.y2, aR.w, aR.height];
					|		A special array type that defines a certain rectangle.
					|		You can use the aR enum to refer to the correct section in a 
					|		region_array (eg. region_array[aR.h] will give the region's height)
	#align#			|	  [align_x, align_y] 
					|	++[, offset_x, offsey_y]
					|		A special array type that defines x and y alignment.
	#beat#			|	  [aBeat.value, aBeat.v_min, aBeat.max, aBeat.increment, aBeat.rate]
===[IDs]===============[Usage]======================================================================
	#sprite_id#		|	ID of a Sprite Resource
	#image_id#		|	image_index of a Sprite Resource
	#font_id#		|	ID of a Font Resource
===[enums]=======[Remember]:[You can get info on any enum by highlighting it and hitting F1]========
	#eDirection#	
	#eAngle#	
	#eButtonState#		
	#eDataType#
	#eFocusLayer#		
	#eFontStyle#	
	
	#aR# / #aRegion#	Accessors for 
	#aScrollbar#
====================================================================================================
	
===[Global Variable]================[IsArray]==[Contains]===========================================	
	global.AlignX 					|		|	{integer} Contains the horizontal alignment
	global.AlignY 					|		|	{integer} Contains the horizontal alignment
	global.AlignXo 				|		|	{real}	
	global.AlignYo					|		|	{real}		
	global.GUIMouseX
	global.GUIMouseY
	global.UpdateWindow
	global.GamaBeat					|
	global.ScrollBeat
	global.Font
	global.BaseFont
