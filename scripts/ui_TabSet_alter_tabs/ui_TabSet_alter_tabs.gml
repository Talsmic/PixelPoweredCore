///ui_TabSet_alter_tabs([TabSetID],[tabs],[tab_size]);
/// @arg [TabSetID]			{integer}	(default: 0)
/// @arg [tabs]				{array}		(default: 1)
/// @arg [tab_size]			{array}		(default: [10,11,1]) [height,min_width,space]
#region Arguments
var ref =	argument_count > 0 ? argument[0] : 0;
var tabs =	argument_count > 1 ? argument[1] : 1;
var tab_size =	argument_count > 2 ? argument[1] : 3;
var tab_width_min = 40;
TabSet_TabHeight[ref] = 11;
TabSet_TabSpace[ref] = 1;
if argument_count > 2 {  
	var tab_size = argument[2];
	if !is_array(tab_size) { TabSet_TabHeight[ref] = tab_size };
	else {
		switch (array_length_1d(tab_size)) { 
			case 3: TabSet_TabSpace[ref] = tab_size[2];
			case 2: tab_width_min = tab_size[1];
			case 1: TabSet_TabHeight[ref] = tab_size[0]; 
			};
		};
	}; 
#endregion

if ( is_array(tabs) ) { var tabcount = tabs[0] } else { var tabcount = tabs };

set_font(ft_EvoTooltip_6_Bold);
for ( var i=1; i<=tabcount; i++ ) {
	TabSet_Tab_Name[ref, i] = "Tab"+string(i);
	if ( is_array(tabs) ) { TabSet_Tab_Name[ref, i] = tabs[i] };
	TabSet_Tab_Width[ref, i] = string_width(TabSet_Tab_Name[ref, i]) + 6;
	if ( TabSet_Tab_Width[ref, i] < tab_width_min ) { TabSet_Tab_Width[ref, i] = tab_width_min };
	TabSet_Tab_Enabled[ref, i] = true;
	};
	
return ref;