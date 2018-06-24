///uiTabset_Create([TabsetID],[tabs],[X],[y],[attach_side],[flow_direction],[tab_rotation],[tab_size]);
/// @arg [TabsetID]			{integer}	(default: 0)
/// @arg [tabs]				{array}		(default: 1)
/// @arg [X]				{real}		(default: id.x)
/// @arg [y]				{real}		(default: id.y)
/// @arg [attach_side]		{Direction}	(default: BOTTOM)
/// @arg [flow_direction]	{Direction}	(default: LEFT)
/// @arg [tab_rotation]		{Angle}		(default: ANGLE_UP)
/// @arg [tab_size[w|h|sep]] {array}	(default: [10,11,1]) [min_width,height,seperation]
#region Arguments
var ref =						argument_count > 0 ? argument[0] : 0;
var tabs =						argument_count > 1 ? argument[1] : 1;
Tabset_X[ref] =					argument_count > 2 ? argument[2] : x;
Tabset_Y[ref] =					argument_count > 3 ? argument[3] : y;
Tabset_AttachToSide[ref] =		argument_count > 4 ? argument[4] : BOTTOM;
Tabset_TabFlowDirection[ref] =	argument_count > 5 ? argument[5] : LEFT;
Tabset_Rotation[ref] =			argument_count > 6 ? argument[6] : ANGLE_UP;
var tab_array =					argument_count > 7 ? _asArrayOf(argument[7], [40,11,1]) : [40,11,1];
var tab_width_min =				tab_array[0];
Tabset_TabHeight[ref] =			tab_array[1];
Tabset_TabSpace[ref] =			tab_array[2];
#endregion

Pointer_Tabset[ref] = 1;

Tabset_Font[ref] = ft_EvoTooltip_6_Bold;
Tabset_CycleKey = vk_tab;

Tabset_DrawAnchor[ref] = false;
Tabset_Tileset[ref] = spr_plainbox_4x4;
Tabset_Colour_Tab[ref] =	   c_black;
Tabset_Colour_TabHover[ref] =  c_gray2;
Tabset_Colour_TabFocus[ref] =  c_black;
Tabset_Colour_Text[ref] =	   c_gray9;
Tabset_Colour_TextHover[ref] = c_orange;
Tabset_Colour_TextFocus[ref] = c_white;

var tabcount = tabs[0];

_setFont(ft_EvoTooltip_6_Bold);
for ( var i=1; i<=tabcount; i++ ) {
	Tabset_Tab_Name[ref, i] = is_array(tabs) ? tabs[i] : "Tab"+string(i);
	Tabset_Tab_Width[ref, i] = string_width(Tabset_Tab_Name[ref, i]) + 6;
	if (Tabset_Tab_Width[ref, i] < tab_width_min) { Tabset_Tab_Width[ref, i] = tab_width_min };
	Tabset_Tab_Enabled[ref, i] = true;
	};
	
return ref;