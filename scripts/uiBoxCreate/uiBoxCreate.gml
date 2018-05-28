///uiBoxCreate([key_array],[value_array]);
/// @arg [key_array]		{array}		
/// @arg [value_array]		{array}			
/*
	<< Returns >>	#ds_map#
*/ 
#region Arguments & Variables
//Arguments
var _add_values =	argument_count > 0 ? true : false;
var _key_array =	argument_count > 0 ? _validateArray(argument[0]) : 0;
var _value_array =	argument_count > 1 ? _validateArray(argument[1]) : [0];
var _output;
#endregion

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
_output[? "Heading_Name"] =			"uiBox";
_output[? "Heading_Font"] =			ft_EvoTooltip_6_Bold;
_output[? "Heading_Colour"] =		c_orange;
_output[? "Heading_Alpha"] =		1;
_output[? "Heading_Offset"] =		[4,4];
_output[? "Heading_Padding"] =		2;
_output[? "Body_Draw"] =			true;
_output[? "Body_Font"] =			ft_EvoTooltip_6_Bold;
_output[? "Body_Colour"] =			[c_gray13,c_gray12,c_gray11,c_gray12];
_output[? "Body_Alpha"] =			1;
_output[? "Body_Offset"] =			[4,4];

//Add values
if ( _add_values ) {
	for ( var i=0 ; i < array_length_1d(_key_array) ; i++) {
	    _output[? _key_array[i]] = _arrayValue(_value_array, i, "loop");
		};
	};

//Return the dsMap
return _output