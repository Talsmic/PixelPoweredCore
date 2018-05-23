///ui_TabSet_create([TabSetID],[tabs],[x],[y],[attach_side],[flow_direction],[tab_rotation],[tab_size]);
/// @arg [TabSetID]			{integer}	(default: 0)
/// @arg [tabs]				{array}		(default: 1)
/// @arg [x]				{real}		(default: id.x)
/// @arg [y]				{real}		(default: id.y)
/// @arg [attach_side]		{Direction}	(default: BOTTOM)
/// @arg [flow_direction]	{Direction}	(default: LEFT)
/// @arg [tab_rotation]		{Angle}		(default: ANGLE_UP)
/// @arg [tab_size[w|h|sep]] {array}	(default: [10,11,1]) [min_width,height,seperation]
#region Arguments
var ref =						argument_count > 0 ? argument[0] : 0;
var tabs =						argument_count > 1 ? argument[1] : 1;
TabSet_X[ref] =					argument_count > 2 ? argument[2] : x;
TabSet_Y[ref] =					argument_count > 3 ? argument[3] : y;
TabSet_AttachToSide[ref] =		argument_count > 4 ? argument[4] : BOTTOM;
TabSet_TabFlowDirection[ref] =	argument_count > 5 ? argument[5] : LEFT;
TabSet_Rotation[ref] =			argument_count > 6 ? argument[6] : ANGLE_UP;
var tab_array =					argument_count > 7 ? fix_array_1d(argument[7], 3, 3, [40,11,1]) : [40,11,1];
var tab_width_min =				tab_array[0];
TabSet_TabHeight[ref] =			tab_array[1];
TabSet_TabSpace[ref] =			tab_array[2];
#endregion

Pointer_Tabset[ref] = 1;

TabSet_Font[ref] = ft_EvoTooltip_6_Bold;
TabSet_CycleKey = vk_tab;

TabSet_DrawAnchor[ref] = false;
Tabset_Tileset[ref] = spr_plainbox_4v4;
TabSet_Colour_Tab[ref] =	   c_black;
TabSet_Colour_TabHover[ref] =  c_gray2;
TabSet_Colour_TabFocus[ref] =  c_black;
TabSet_Colour_Text[ref] =	   c_gray9;
TabSet_Colour_TextHover[ref] = c_orange;
TabSet_Colour_TextFocus[ref] = c_white;

var tabcount = notas_array(tabs);

set_font(ft_EvoTooltip_6_Bold);
for ( var i=1; i<=tabcount; i++ ) {
	TabSet_Tab_Name[ref, i] = is_array(tabs) ? tabs[i] : "Tab"+string(i);
	TabSet_Tab_Width[ref, i] = string_width(TabSet_Tab_Name[ref, i]) + 6;
	if (TabSet_Tab_Width[ref, i] < tab_width_min) { TabSet_Tab_Width[ref, i] = tab_width_min };
	TabSet_Tab_Enabled[ref, i] = true;
	};
	
return ref;