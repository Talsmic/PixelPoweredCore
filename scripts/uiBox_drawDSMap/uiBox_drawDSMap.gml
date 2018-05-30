///uiBox_drawDSMap(x,y,ds_map,[ui_settings],[rows],[starting_row]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg ds_map			#ds_map#		
/// @arg [ui_settings]	#ds_map#		
/// @arg [rows]			{integer}	(default: -1)
/// @arg [starting_row]	{integer}	(default: 0)
#region Arguments & Variables
if argument_count < 3 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
//Arguments
var _draw_x =		argument[0];
var _draw_y =		argument[1];
var _dsmap =		argument[2];
var _ui_settings =	argument_count > 3 ? argument[3] : -1;
var _rows =			argument_count > 4 ? argument[4] : -1;
var _starting_row =	argument_count > 5 ? argument[5] : 0;
//Other Variables
var _max_height = _resolutionGetHeight() - _draw_y;
var _max_width = _resolutionGetWidth() - _draw_x;
#endregion

#region Pull from UI dsMap

#region Box Data
var ui_box_padding =			_dsMapValue(_ui_settings,"Padding",				[4,4,4,4]);
var ui_box_spriteset =			_dsMapValue(_ui_settings,"Box_Spriteset",		spr_plainbox_4x4);
var ui_box_colour =				_dsMapValue(_ui_settings,"Box_Colour",			c_black);
var ui_box_alpha =				_dsMapValue(_ui_settings,"Box_Alpha",			0.8);
var ui_box_tile_array =			_dsMapValue(_ui_settings,"Box_Tile_Array",		[1,2,3,4,5,6,7,8,9]);
var ui_box_stretch_array =		_dsMapValue(_ui_settings,"Box_Stretch_Array",	[0,1,0,1,1,1,0,1,0]);
var ui_box_offset =				_dsMapValue(_ui_settings,"Box_Offset",			[0,0]);

ui_box_padding =				_validateArray(ui_box_padding,4,4,ui_box_padding);
ui_box_tile_array =				_validateArray(ui_box_tile_array,9,9,ui_box_tile_array);
ui_box_stretch_array =			_validateArray(ui_box_stretch_array,9,9,ui_box_stretch_array);
ui_box_offset =					_validateArray(ui_box_offset,2,2,ui_box_offset);
#endregion

var ui_heading_draw =			_dsMapValue(_ui_settings,"Heading_Draw",		true);
#region Header Data
if ( ui_heading_draw ) {
	
var ui_heading_text =			_dsMapValue(_ui_settings,"Heading_Text",		"dsMap["+string(_dsmap)+"] Contents:");
var ui_heading_font =			_dsMapValue(_ui_settings,"Heading_Font",		ft_EvoTooltip_6_Bold);
var ui_heading_colour =			_dsMapValue(_ui_settings,"Heading_Colour",		c_orange);
var ui_heading_alpha =			_dsMapValue(_ui_settings,"Heading_Alpha",		1);
var ui_heading_offset =			_dsMapValue(_ui_settings,"Heading_Offset",		[0,0]);
var ui_heading_padding =		_dsMapValue(_ui_settings,"Heading_Padding",		2);

ui_heading_offset =				_validateArray(ui_heading_offset,2,2,ui_heading_offset);
};
#endregion
	
var ui_body_draw =				_dsMapValue(_ui_settings,"Body_Draw",			true);
#region Body Data
if ( ui_body_draw ) { 
	
var ui_body_font =				_dsMapValue(_ui_settings,"Body_Font",			ft_EvoTooltip_6);
var ui_body_colour =			_dsMapValue(_ui_settings,"Body_Colour",			[c_gray13]);
var ui_body_alpha =				_dsMapValue(_ui_settings,"Body_Alpha",			1);
var ui_body_offset =			_dsMapValue(_ui_settings,"Body_Offset",			[0,0]);

ui_body_colour =				_validateArray(ui_body_colour);
ui_body_offset =				_validateArray(ui_body_offset,2,2,ui_body_offset);
};
#endregion

#region Column Data
var ui_column_width =			_dsMapValue(_ui_settings,"Column_Width",		[100]);
var ui_column_spacing =			_dsMapValue(_ui_settings,"Column_Spacing",		1);
var ui_column_colour =			_dsMapValue(_ui_settings,"Column_Colour",		[c_gray13,c_gray12]);
var ui_column_header =			_dsMapValue(_ui_settings,"Column_Header",		false);
var ui_column_header_colour =	_dsMapValue(_ui_settings,"Column_HeaderColour",	c_gray5);
var ui_column_header_colour2 =	_dsMapValue(_ui_settings,"Column_HeaderColour2",c_orange);
var ui_column_header_height =	_dsMapValue(_ui_settings,"Column_HeaderSize",	12);
var ui_column_alpha =			_dsMapValue(_ui_settings,"Column_Alpha",		0.4);

ui_column_width =				_validateArray(ui_column_width);
ui_column_colour =				_validateArray(ui_column_colour);
#endregion

#region Row Data
var ui_row_height =				_dsMapValue(_ui_settings,"Row_Height",			[11]);
var ui_row_spacing =			_dsMapValue(_ui_settings,"Row_Spacing",			1);
var ui_row_colour =				_dsMapValue(_ui_settings,"Row_Colour",			[c_gray13,c_gray12]);
var ui_row_header =				_dsMapValue(_ui_settings,"Row_Header",			true);
var ui_row_header_colour =		_dsMapValue(_ui_settings,"Row_HeaderColour",	c_gray5);
var ui_row_header_colour2 =		_dsMapValue(_ui_settings,"Row_HeaderColour2",	c_orange);
var ui_row_header_width =		_dsMapValue(_ui_settings,"Row_HeaderSize",		80);
var ui_row_alpha =				_dsMapValue(_ui_settings,"Row_Alpha",			0.4);

ui_row_height =					_validateArray(ui_row_height);
ui_row_colour =					_validateArray(ui_row_colour);
#endregion

var _table_spacing = [ui_column_spacing, ui_row_spacing];

#endregion

#region Find Size
var _width	= ui_box_padding[0] + ui_box_padding[2];
var _height = ui_box_padding[1] + ui_box_padding[3];

//Correct Rows
var _mapsize = ds_map_size(_dsmap);
if ( !_rows ) { _rows = _mapsize };
if ( _starting_row > _mapsize ) { _starting_row = clamp(_mapsize-_rows, 0, _mapsize) };

//Heading Size
if ( ui_heading_draw ) {
	var _width_heading	= ui_box_padding[0] + ui_heading_offset[0] + _stringWidth(ui_heading_text, ui_heading_font) + ui_box_padding[2];
	var _height_heading = _stringHeight(ui_heading_text, ui_heading_font);
	_width	= _width > _width_heading ? _width : _width_heading ;	
	_height += ui_heading_offset[1] + _height_heading + ui_heading_padding;
	};
	
//Body Size
if ( ui_body_draw ) {
	var _width_body	= ui_box_padding[0] + ui_body_offset[0] + ui_row_header_width + ui_column_spacing + ui_column_width[0] + ui_box_padding[2];
	var _height_body = 0;
	//Add Row Heights
	for ( var i=_starting_row ; i<_starting_row+_rows ; ++i ) { 
		//Row Height
		var _check_size = _arrayValue(ui_row_height,i) + ui_row_spacing 
		//Check it's not too big
		if ( _height + _height_body + _check_size > _max_height ) { _rows = i-_starting_row; break };
		//Add to body
		_height_body += _check_size;		
		};
	_height_body -= ui_row_spacing
	//If the body is too large:
	
	
	_width	= _width > _width_body ? _width : _width_body ;	
	_height += ui_body_offset[1] + _height_body;
	};
	
//Box Region
var ui_box_region = [_draw_x+ui_box_offset[0], _draw_y+ui_box_offset[1], _draw_x+ui_box_offset[0]+_width, _draw_y+ui_box_offset[1]+_height, _width, _height];
#endregion

#region Draw
//Box
drawTilebox(ui_box_region, ui_box_spriteset, ui_box_colour, ui_box_alpha, ui_box_tile_array, ui_box_stretch_array);
var _x = _draw_x + ui_box_padding[0];
var _y = _draw_y + ui_box_padding[1];

//Heading
if ( ui_heading_draw ) {
	_x = _draw_x + ui_box_padding[0] + ui_heading_offset[0];
	_y += ui_heading_offset[1];
	_setFont(ui_heading_font);
	//Draw Heading
	drawText(_x, _y, ui_heading_text, ui_heading_colour, ui_heading_alpha);
	_y += _height_heading + ui_heading_padding;
	};
	
//Body (table)
if ( ui_body_draw ) {
	_x = _draw_x + ui_box_padding[0] + ui_body_offset[0];
	_y += ui_body_offset[1];
	_setFont(ui_body_font);
	//Draw Columns
	_drawPlanes(_x, _y, 1, _rows, ui_row_header_width, ui_row_height, _table_spacing, ui_row_header_colour, ui_row_alpha, 0);
	_drawPlanes(_x+_table_spacing[0]+ui_row_header_width, _y, 1, _rows, ui_column_width, ui_row_height, _table_spacing, ui_column_colour, ui_column_alpha, 0);
	//Draw Values
	_drawDSMap(_x, _y, _dsmap, ui_body_colour, ui_body_alpha, _rows, _starting_row, [ui_row_header_width, ui_column_width[0]], ui_row_height, _table_spacing);
	};
#endregion