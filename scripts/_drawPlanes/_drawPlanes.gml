///_drawPlanes(x,y,x_count,y_count,width,height,[spacing],[colour],[alpha],[outline]);
/// @arg x			{real}
/// @arg y			{real}
/// @arg x_count	{integer|1+}
/// @arg y_count	{integer|1+}
/// @arg width		{real}
/// @arg height		{real}
/// @arg spacing	{integer}
/// @arg [colour]	#c_code#			(default: draw_get_color())
/// @arg [alpha]	{real|0..1}			(default: draw_get_alpha())
/// @arg [outline]	{boolean+}			(default: false) [false, true&thickness]
/*
	[[ Draws ]] 
*/
#region Arguments
if argument_count < 6 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var _x =			argument[0];
var _y =			argument[1];
var _x_count =		argument[2];
var _y_count =		argument[3];
var _width_array =		_validateArray(argument[4]);
var _height_array =		_validateArray(argument[5]);
var _spacing =		argument_count > 6 ? _validateArray(argument[6],2,2,argument[6]) : [1,1];
var _colour_array =	argument_count > 7 ? _validateArray(argument[7]) : draw_get_color();
var _alpha_array =	argument_count > 8 ? _validateArray(argument[8]) : draw_get_alpha();
var _outline =		argument_count > 9 ? argument[9] : false;
var _count =		0;
#endregion

for ( var i=0 ; i<_y_count ; ++i ) {
	
	var _height = _arrayValue(_height_array,i);
    for ( var j=0 ; j<_x_count ; ++j ) {
		var _width = _arrayValue(_width_array,j);
		var _colour = _arrayValue(_colour_array,_count);
		var _alpha = _arrayValue(_alpha_array,_count);
	    //Draw the plane
		if _outline {
			draw_sprite_ext(spr_1x1,0, _x,					_y,						_width,		_outline,	0, _colour, _alpha);
			draw_sprite_ext(spr_1x1,0, _x,					_y+_height-_outline,	_width,		_outline,	0, _colour, _alpha);
			draw_sprite_ext(spr_1x1,0, _x+_width-_outline,	_y,						_outline,	_height,	0, _colour, _alpha);
			draw_sprite_ext(spr_1x1,0, _x,					_y,						_outline,	_height,	0, _colour, _alpha);
			}		
		else {
			draw_sprite_ext(spr_1x1,0, _x, _y, _width, _height, 0, _colour, _alpha);
			};
		_count++;
		_x+= _width + _spacing[0];
		};	
	_y+= _height + _spacing[1];
	_x = argument[0];
	
	};

