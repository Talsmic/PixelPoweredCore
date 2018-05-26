///ppdk_vars_Global
/*
==[Datatypes]=======================================================================================
===[General]===========[Specifc Variants]===========================================================
	{any}			|	
	{array}			|	
	{array_2d}		|
	{boolean}		|
	{integer}		|	angle {integer|0..360}
	{real}			|	alpha {real|0..1}
	{string}		|
===[Special Arrays]====[Usage]======================================================================
	#region#		|	  [x1, y1, x2, y2, (w)idth, (h)eight];						|	++[
					|		A special array type that defines a certain rectangle.
					|		You can use the eR enum to refer to the correct section in a 
					|		region_array (eg. region_array[eR.h] will give the region's height)
	#align#			|	  [align_x, align_y] 
					|	++[, offset_x, offsey_y]
					|		A special array type that defines x and y alignment.
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
	global.Align_X 					|		|	{integer} Contains the horizontal alignment
	global.Align_Y 					|		|	{integer} Contains the horizontal alignment
	global.Align_Xo 				|		|	{real}	
	global.Align_Yo					|		|	{real}		
	global.GUI_MouseX
	global.GUI_MouseY
	global.UpdateWindow
	global.GameBeat
	global.ScrollBeat
	global.Font
	global.BaseFont
