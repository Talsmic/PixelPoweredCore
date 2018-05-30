///uiBox_Create([key_array],[value_array]);
/// @arg [key_array]		{array}		
/// @arg [value_array]		{array}			
/*
	<< Returns >>	#ds_map#
	!Always make sure [key|value_array] goes ["KeyNameA", valueA, ["KeyNameB", valueB, ..]!
*/ 
#region Arguments & Variables
//Arguments
var _add_values =	argument_count > 0 ? true : false;
var _array =	argument_count > 0 ? _validateArray(argument[0]) : 0;
var _output;
#endregion
_dsMapCreate()
//Create dsMap
_output = ds_map_create();

_output[? "Padding"] =				[4,4,4,4];
_output[? "Box_Spriteset"] =		spr_plainbox_4x4;
_output[? "Box_Colour"] =			c_black;
_output[? "Box_Alpha"] =			0.8;
_output[? "Box_Tile_Array"] =		[1,2,3,4,5,6,7,8,9];
_output[? "Box_Stretch_Array"] =	[0,1,0,1,1,1,0,1,0];
_output[? "Box_Offset"] =			[0,0];

_output[? "Heading_Draw"] =			false;
_output[? "Heading_Text"] =			"uiBox";
_output[? "Heading_Font"] =			ft_EvoTooltip_6_Bold;
_output[? "Heading_Colour"] =		c_orange;
_output[? "Heading_Alpha"] =		1;
_output[? "Heading_Offset"] =		[0,0];
_output[? "Heading_Padding"] =		2;

_output[? "Body_Draw"] =			true;
_output[? "Body_Font"] =			ft_EvoTooltip_6;
_output[? "Body_Colour"] =			[c_gray13, c_gray12];
_output[? "Body_Alpha"] =			1;
_output[? "Body_Offset"] =			[0,0];

_output[? "Column_Width"] =			[100];
_output[? "Column_Spacing"] =		1;
_output[? "Column_Colour"] =		[c_gray13, c_gray12];
_output[? "Column_Header"] =		false;
_output[? "Column_HeaderSize"] =	12;
_output[? "Column_HeaderColour"] =	c_gray5;
_output[? "Column_HeaderColour2"] =	c_orange;
_output[? "Column_Alpha"] =			0.4;

_output[? "Row_Height"] =			[11];
_output[? "Row_Spacing"] =			1;
_output[? "Row_Colour"] =			[c_gray13, c_gray12];
_output[? "Row_Header"] =			false;
_output[? "Row_HeaderSize"] =		100;
_output[? "Row_HeaderColour"] =		c_gray5;
_output[? "Row_HeaderColour2"] =	c_orange;
_output[? "Row_Alpha"] =			0.4;

//Add values
if ( _add_values ) {
	_dsMapAddValues(_output, _array);
	};

//Return the dsMap
return _output

//For pulling this data into a script:
#region Pull from UI dsMap

#region Box Data
//var ui_box_padding =			_dsMapValue(_ui_settings,"Padding",				[4,4,4,4]);
//var ui_box_spriteset =			_dsMapValue(_ui_settings,"Box_Spriteset",		spr_plainbox_4x4);
//var ui_box_colour =				_dsMapValue(_ui_settings,"Box_Colour",			c_black);
//var ui_box_alpha =				_dsMapValue(_ui_settings,"Box_Alpha",			0.8);
//var ui_box_tile_array =			_dsMapValue(_ui_settings,"Box_Tile_Array",		[1,2,3,4,5,6,7,8,9]);
//var ui_box_stretch_array =		_dsMapValue(_ui_settings,"Box_Stretch_Array",	[0,1,0,1,1,1,0,1,0]);
//var ui_box_offset =				_dsMapValue(_ui_settings,"Box_Offset",			[0,0]);

//ui_box_padding =				_validateArray(ui_box_padding,4,4,ui_box_padding);
//ui_box_tile_array =				_validateArray(ui_box_tile_array,9,9,ui_box_tile_array);
//ui_box_stretch_array =			_validateArray(ui_box_stretch_array,9,9,ui_box_stretch_array);
//ui_box_offset =					_validateArray(ui_box_offset,2,2,ui_box_offset);
#endregion

var ui_heading_draw =			_dsMapValue("Heading_Draw",						false);
#region Header Data
if ( ui_heading_draw ) {
	
//var ui_heading_text =			_dsMapValue("Heading_Text",						"uiBox");
//var ui_heading_font =			_dsMapValue("Heading_Font",						ft_EvoTooltip_6_Bold);
//var ui_heading_colour =			_dsMapValue("Heading_Colour",					c_orange);
//var ui_heading_alpha =			_dsMapValue("Heading_Alpha",					1);
//var ui_heading_offset =			_dsMapValue("Heading_Offset",					[0,0]);
//var ui_heading_padding =		_dsMapValue("Heading_Padding",					2);

//ui_heading_offset =				_validateArray(ui_heading_offset,2,2,ui_heading_offset);
};
#endregion
	
var ui_body_draw =				_dsMapValue(_ui_settings,"Body_Draw",			true);
#region Body Data
if ( ui_body_draw ) { 
	
//var ui_body_font =				_dsMapValue(_ui_settings,"Body_Font",			ft_EvoTooltip_6);
//var ui_body_colour =			_dsMapValue(_ui_settings,"Body_Colour",			[c_gray13]);
//var ui_body_alpha =				_dsMapValue(_ui_settings,"Body_Alpha",			1);
//var ui_body_offset =			_dsMapValue(_ui_settings,"Body_Offset",			[0,0]);

//ui_body_colour =				_validateArray(ui_body_colour);
//ui_body_offset =				_validateArray(ui_body_offset,2,2,ui_body_offset);
};
#endregion

#region Column Data
//var ui_column_width =			_dsMapValue(_ui_settings,"Column_Width",		[100]);
//var ui_column_spacing =			_dsMapValue(_ui_settings,"Column_Spacing",		1);
//var ui_column_colour =			_dsMapValue(_ui_settings,"Column_Colour",		[c_gray13,c_gray12]);
//var ui_column_header =			_dsMapValue(_ui_settings,"Column_Header",		false);
//var ui_column_header_colour =	_dsMapValue(_ui_settings,"Column_HeaderColour",	c_gray5);
//var ui_column_header_colour2 =	_dsMapValue(_ui_settings,"Column_HeaderColour2",c_orange);
//var ui_column_header_height =	_dsMapValue(_ui_settings,"Column_HeaderSize",	12);
//var ui_column_alpha =			_dsMapValue(_ui_settings,"Column_Alpha",		0.4);

//ui_column_width =				_validateArray(ui_column_width);
//ui_column_colour =				_validateArray(ui_column_colour);
#endregion

#region Row Data
//var ui_row_height =				_dsMapValue(_ui_settings,"Row_Height",			[100]);
//var ui_row_spacing =			_dsMapValue(_ui_settings,"Row_Spacing",			1);
//var ui_row_colour =				_dsMapValue(_ui_settings,"Row_Colour",			[c_gray13,c_gray12]);
//var ui_row_header =				_dsMapValue(_ui_settings,"Row_Header",			false);
//var ui_row_header_colour =		_dsMapValue(_ui_settings,"Row_HeaderColour",	c_gray5);
//var ui_row_header_colour2 =		_dsMapValue(_ui_settings,"Row_HeaderColour2",	c_orange);
//var ui_row_header_width =		_dsMapValue(_ui_settings,"Row_HeaderSize",		150);
//var ui_row_alpha =				_dsMapValue(_ui_settings,"Row_Alpha",			0.4);

//ui_row_height =					_validateArray(ui_row_height);
//ui_row_colour =					_validateArray(ui_row_colour);
#endregion

#endregion