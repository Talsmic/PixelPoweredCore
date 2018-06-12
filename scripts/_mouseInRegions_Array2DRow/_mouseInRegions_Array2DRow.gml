///_mouseInRegions_Array2DRow(array_of_regions,row,[override_mouse_layer]);
/// @arg array_of_regions		{array|#region#}
/// @arg row					{integer}
/// @arg override_mouse_layer	{boolean}	(default: detect) (false: normal, true: gui mouse]
/*
	<< Returns >> {integer} The first region in the array the mouse is found in
*/
#region Arguments & Variables
var array_of_regions = _validateRegion(argument[0]);
var row = argument[1];
var mouse_layer =	argument_count > 1 ? argument[1] : _useGUIMouse();
var region_array = 0;
#endregion

var m_x = mouse_layer ? global.GUIMouseX : mouse_x;
var m_y = mouse_layer ? global.GUIMouseY : mouse_y;

for ( var i=0; i<array_length_2d(array_of_regions,row); ++i ) {
	region_array = array_of_regions[i,row]
	if is_array(region_array) {
		if point_in_rectangle(m_x, m_y, region_array[aR.x1], region_array[aR.y1], region_array[aR.x2], region_array[aR.y2]) {
			return i;
			};
		};
	};
	
return 0;