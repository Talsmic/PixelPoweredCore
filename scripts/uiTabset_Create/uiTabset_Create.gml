///uiTabset_Create(x,y,tabs,[attach_side],[flow_direction],[tab_rotation],[font],[spriteset]);
/// @arg x					{real}		
/// @arg y					{real}		
/// @arg tabs				{array|arrays}
/// @arg [attach_side]		#eDirection#	(default: BOTTOM)
/// @arg [flow_direction]	#eDirection#	(default: LEFT)
/// @arg [tab_rotation]		#eAngle#		(default: ANGLE_UP)
/// @arg [font]				#font_id#		(default: ft_Pixis07_Bold)
/// @arg [spriteset]		#sprite_id#		(default: spr_plainbox_4x4)

#region Special Enumerator: #aTabset# #aTab# (for Array IDs)
enum aTab {
	name, offset_x, offset_y, width, height, enabled, hidden
	};
	
enum aTabset {
	active_tab,
	anchor_x, anchor_y, anchor_side, 
	tab_count, tab_flow_direction, tab_rotation, tab_font, tab_spriteset,
	tab_colour, tab_colour_hover, tab_colour_focus,
	tab_alpha, tab_alpha_hover, tab_alpha_focus,
	tab_textcolour, tab_textcolour_hover, tab_textcolour_focus,
	key_cycleup, key_cycledown,
	tab1, tab2, tab3, tab4, tab5,
	tab6, tab7, tab8, tab9, tab10
	};
#endregion	
	
#region Arguments & Variables
//Arguments
if argument_count < 4 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
//Arguments
var _x =		argument[0];
var _y =		argument[1];
var _tabs =		_asArray(argument[2]);
//Variables
var _tabset;
#endregion

_tabset[aTabset.active_tab] =			1;
_tabset[aTabset.anchor_x] =				_x;
_tabset[aTabset.anchor_y] =				_y;
_tabset[aTabset.anchor_side] =			argument_count > 3 ? argument[3] : BOTTOM;

_tabset[aTabset.tab_count] =			_tabs[0];
_tabset[aTabset.tab_flow_direction] =	argument_count > 4 ? argument[4] : LEFT;
_tabset[aTabset.tab_rotation] =			argument_count > 5 ? argument[5] : ANGLE_UP;
_tabset[aTabset.tab_font] =				argument_count > 6 ? argument[6] : ft_Pixis07_Bold;
_tabset[aTabset.tab_spriteset] =		argument_count > 7 ? argument[7] : spr_plainbox_4x4;

_tabset[aTabset.tab_colour] =			c_black;
_tabset[aTabset.tab_colour_hover] =		c_gray3;
_tabset[aTabset.tab_colour_focus] =		c_black;

_tabset[aTabset.tab_alpha] =			1;
_tabset[aTabset.tab_alpha_hover] =		1;
_tabset[aTabset.tab_alpha_focus] =		1;

_tabset[aTabset.tab_textcolour] =		c_gray9;
_tabset[aTabset.tab_textcolour_hover] =	c_orange;
_tabset[aTabset.tab_textcolour_focus] =	c_white;

_tabset[aTabset.key_cycleup] =			0;
_tabset[aTabset.key_cycledown] =		0;

#region Create Tab Arrays
var _width_min =  sprite_get_width( _tabset[aTabset.tab_spriteset])*2;
var _width_max =  sprite_get_width( _tabset[aTabset.tab_spriteset])*2 + 200;
var _height_min = 2;
var _height_max = 52;
var _default_tab = ["Tab",	0,			0,			_stringWidth("Tab", _tabset[aTabset.tab_font])+8,	_stringHeight("Tab", _tabset[aTabset.tab_font])+2,	1,			0];
				// [name,	offset_x,	offset_y,	width,												height,												enabled,	hidden];
var _tab;
for ( var i=1 ; i<10 ; ++i ) {
	    if ( array_length_1d(_tabs) > i ) { _tab[i] = _validateArray(_tabs[i], 7, 7, _default_tab) } else { _tab[i] = _default_tab };
		_tab[aTab.width]  = clamp(_stringWidth(_tab[aTab.name],  _tabset[aTabset.tab_font])+8, _width_min,  _width_max);
		_tab[aTab.height] = clamp(_stringHeight(_tab[aTab.name], _tabset[aTabset.tab_font])+8, _height_min, _height_max);
	};
#endregion
	
_tabset[aTabset.tab1] =					_tabs > 0 ? _tab[1] : [-1];	
_tabset[aTabset.tab2] =					_tabs > 1 ? _tab[2] : [-1];	
_tabset[aTabset.tab3] =					_tabs > 2 ? _tab[3] : [-1];	
_tabset[aTabset.tab4] =					_tabs > 3 ? _tab[4] : [-1];	
_tabset[aTabset.tab5] =					_tabs > 4 ? _tab[5] : [-1];	
_tabset[aTabset.tab6] =					_tabs > 5 ? _tab[6] : [-1];	
_tabset[aTabset.tab7] =					_tabs > 6 ? _tab[7] : [-1];	
_tabset[aTabset.tab8] =					_tabs > 7 ? _tab[8] : [-1];	
_tabset[aTabset.tab9] =					_tabs > 8 ? _tab[9] : [-1];	
_tabset[aTabset.tab10] =				_tabs > 9 ? _tab[10] : [-1];	

return _tabset;