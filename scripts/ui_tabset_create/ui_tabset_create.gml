///ui_tabset_create(#,tabs);
/// @arg #
/// @arg tabs
var ref = argument0;
var tabs = argument1;

//A TabSet is a small, special list with a pointer
//Because you may want multiple tabsets in a single object and they are mostly static,
//use reference numbers to differentiate them.

//Databox types:
// "DB_Skill"		Displays the database info of a skill

//Requires the following variables to be pre-established:
Tabset_Pointer[ref] = 1;

Tabset_X[ref] = x;
Tabset_Y[ref] = y;

Tabset_TabWidth[ref] = 40;
Tabset_TabHeight[ref] = 11;
Tabset_Font[ref] = ft_EvoTooltip_6_Bold;
Tabset_FontHeight[ref] = 6;
Tabset_TabSpace[ref] = 1;

Tabset_AttachToSide[ref] = UP;
Tabset_ListDirection[ref] = LEFT;
Tabset_Rotation[ref] = ANGLE_UP;

Tabset_Colour_Tab[ref] = c_black;
Tabset_Colour_TabHover[ref] = c_darkgray;
Tabset_Colour_TabFocus[ref] = c_black;
Tabset_Colour_Text[ref] = c_lightgray;
Tabset_Colour_TextHover[ref] = c_orange;
Tabset_Colour_TextFocus[ref] = c_white;

for ( var i=1 ; i<=tabs ; i++ ) {
	Tabset_List[ref,i] = "Tab"+string(i);
	Tabset_TabEnabled[ref,i] = true;
	};