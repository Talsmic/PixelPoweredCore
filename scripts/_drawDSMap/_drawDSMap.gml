///_drawDSMap(x,y,ds_map,[colour],[alpha],[rows],[starting_row],[column_width],[row_height],[spacing]);
/// @arg x					{real}
/// @arg y					{real}
/// @arg ds_map				#ds_map#	
/// @arg [colour]			#c_code# OR {array}		(default: draw_get_colour())
/// @arg [alpha]			{real|0..1}				(default: draw_get_alpha())
/// @arg [rows]				{integer}				(default: -1)
/// @arg [starting_row]		{integer}				(default: 0)
/// @arg [column_width]		{integer} OR {array}	(default: [100])
/// @arg [row_height]		{integer} OR {array}	(default: [string_height("|")])
/// @arg [spacing]			{integer} OR {array}	(default: [1,1])
/*
	<< Returns >>	
*/
#region Arguments & Variables
if argument_count < 3 { show_debug_message("ArgError _drawDSMap"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
//Arguments
var _x =			argument[0];
var _y =			argument[1];
var _dsmap =		argument[2];
var _colour =		argument_count > 3 ? _asArray(argument[3]) : [draw_get_color()];
var _alpha =		argument_count > 4 ? argument[4] : draw_get_alpha();
var _rows =			argument_count > 5 ? argument[5] : -1;
var _starting_row =	argument_count > 6 ? argument[6] : 0;
var _column_width =	argument_count > 7 ? _asArray(argument[7]) : [100];
var _row_height =	argument_count > 8 ? _asArray(argument[8]) : [string_height("|")+1];
var _spacing =		argument_count > 9 ? _arrayOfLength(argument[9], 2) : [1,1];
//Other Variables
var _mapsize =		ds_map_size(_dsmap);
if ( _mapsize < _rows ) { _rows = _mapsize; _starting_row = 0 };
var saved_align = [global.AlignX, global.AlignY, global.AlignXo, global.AlignYo];
#endregion

var _next = ds_map_find_first( _dsmap );
var _count = 0;
var _colour_count = 0;

repeat ( _starting_row-1 ) {
	_next = ds_map_find_next( _dsmap, _next );
	_count++;
	_colour_count+=2;
	};

var _string, _h, _w, _c;

while ( !is_undefined( _next ) ) {
	
	//Key Placement
	_x = argument[0];
	_h = _arrayValue(_row_height,_count);
	_w = _arrayValue(_column_width,0);
	_c = _arrayValue(_colour,_colour_count);
	_y += (_h div 2) + (_h mod 2);
	_setAlign(fa_left, fa_middle);	
	//Find Key
	_string = _stringClip(string(_next), _w-4,"..");
	//Draw Key
	drawText(_x+2, _y-1, _string, _c, _alpha);
	
	//Value Placement
	_x += _w + _spacing[0];	
	_w = _arrayValue(_column_width,1);	
	_x += _w;
	_c = _arrayValue(_colour,_colour_count+1)
	_setAlign(fa_right, fa_middle);	
	//Find Value
	_string = _stringClip(string(_dsmap[? _next]),_w-4,"..");
	//Draw Value
	drawText(_x-2, _y-1, _string, _c, _alpha);
	_y += (_h div 2) + _spacing[1];
	
	//Move on to next value
	_next = ds_map_find_next( _dsmap, _next );	
	_count++;
	_colour_count+=2;
	
	//End at last row
	if ( _count >= _rows + _starting_row ) { break };
	
	};
	
_setAlign(saved_align);