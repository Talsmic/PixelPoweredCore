///uiScrollBar_DrawCustom(scrollbar_region,current_value,max_value,[direction],[arrows],[spriteset],[colour],[keys_increase],[keys_decrease],[flip]);
/// @arg scrollbar_region	#region#
/// @arg current_value		{integer}
/// @arg max_value			{integer}
/// @arg [Direction]		#direction#		(default: RIGHT)
/// @arg [arrows]			{boolean}		(default: false)
/// @arg [spriteset]		#sprite_id#		(default: spr_scrollbar)
/// @arg [colour]			#c_code#		(default: draw_get_colour())
/// @arg [keys_increase]	{array}			(default: [vk_down, ord("S")])
/// @arg [keys_decrease]	{array}			(default: [vk_up, ord("W")])
/// @arg [arrows]			{boolean}		(default: false)
/*
	[[ Draws ]]		
*/ 
#region Arguments & Variables
if argument_count < 3 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
//Arguments
var _region =			_validateRegion(argument[0]);
var _value =			argument[1];
var _max_value =		argument[2];
var _direction =		argument_count > 3 ? argument[3] : RIGHT;
var _arrows =			argument_count > 4 ? argument[4] : true;
var _spriteset =		argument_count > 5 ? argument[5] : spr_scrollbar;
var _colour =			argument_count > 6 ? argument[6] : draw_get_colour();
var _keys_increase =	argument_count > 7 ? _validateArray(argument[7]) : ( _direction == TOP or _direction == BOTTOM ? [vk_right, ord("D")] : [vk_down, ord("S")] );
var _keys_decrease =	argument_count > 8 ? _validateArray(argument[8]) : ( _direction == TOP or _direction == BOTTOM ? [vk_left, ord("A")]  : [vk_up, ord("W")] );
var _bar_flipped =		argument_count > 9 ? argument[9] : false;
//Other Variables
var _knob_w =		sprite_get_width(_spriteset);
var _knob_h =		sprite_get_height(_spriteset);
var _keys_knob = -1;
if ( is_array(_keys_increase) ) { _keys_knob = _arrayAppend(_keys_knob, _keys_increase) };
if ( is_array(_keys_decrease) ) { _keys_knob = _arrayAppend(_keys_knob, _keys_decrease) };
#endregion

#region Find Region

switch ( _direction ) {
	
	default:
	case RIGHT:
		var _bar_region = _regionBySize( _region[aR.x2]-_knob_w, _region[aR.y1], _knob_w, max(_region[aR.h], _knob_h*5)	);
		var _bar_orientation = VERTICAL;
		break;
		
	case LEFT:
		var _bar_region = _regionBySize( _region[aR.x1], _region[aR.y1], _knob_w, max(_region[aR.h], _knob_h*5)	);
		var _bar_orientation = VERTICAL;
		break;
		
	case TOP:
		var _bar_region = _regionBySize( _region[aR.x1], _region[aR.y1], max(_region[aR.w], _knob_w*5), _knob_h	);
		var _bar_orientation = HORIZONTAL;
		break;
	
	case BOTTOM:
		var _bar_region = _regionBySize( _region[aR.x1], _region[aR.y2]-_knob_h, max(_region[aR.w], _knob_w*5), _knob_h	);
		var _bar_orientation = HORIZONTAL;
		break;
		
};
debug_region(_region);

#endregion

#region Vertical Bar
if ( _bar_orientation == VERTICAL ) {
	
	//Adjust for arrows
	if ( _arrows ) { 
		_bar_region[aR.y1] += _knob_h;
		_bar_region[aR.y2] -= _knob_h;
		_bar_region[aR.h] -= _knob_h*2;
		};		
	
	//Draw Bar
	drawSprite(				_bar_region[aR.x1], _bar_region[aR.y1],			_spriteset, 1, _colour, 1);
	drawSprite_Stretched(	_bar_region[aR.x1], _bar_region[aR.y1]+_knob_h, _spriteset, 2, _colour, 1, _knob_w, _bar_region[aR.h]-_knob_h*2);
	drawSprite(				_bar_region[aR.x1], _bar_region[aR.y2]-_knob_h, _spriteset, 3, _colour, 1);
	
	//Top is High
	if ( _bar_flipped ) {
		
		var _knob_offset = _value != 0 ? (_value / _max_value) : 0;
		_knob_offset = round(_knob_offset * (_bar_region[aR.h]-_knob_h));
		
		//Draw Arrows
		if ( _arrows ) { 		
			if ( _knob_offset != (_bar_region[aR.h]-_knob_h) ) { buttonImage(_bar_region[aR.x1], _bar_region[aR.y1]-_knob_h-1,  _spriteset, 7, _colour, 1, "", [0,0], 1, 0, eButtonState.detect, _keys_increase) }
														  else { buttonImage(_bar_region[aR.x1], _bar_region[aR.y1]-_knob_h-1,  _spriteset, 7, _colour, 1, "", [0,0], 1, 0, eButtonState.disabled) };
			if ( _knob_offset != 0 )						   { buttonImage(_bar_region[aR.x1], _bar_region[aR.y2]+1,			_spriteset, 8, _colour, 1, "", [0,0], 1, 0, eButtonState.detect, _keys_decrease) }	
														  else { buttonImage(_bar_region[aR.x1], _bar_region[aR.y2]+1,			_spriteset, 8, _colour, 1, "", [0,0], 1, 0, eButtonState.disabled) };	
			};	
			
		//Draw Knob
		buttonImage(_bar_region[aR.x1], _bar_region[aR.y2]-_knob_offset-_knob_h, _spriteset, 0, _colour, 1, "", [0,0], 1, 0, eButtonState.detect, _keys_knob);			
			
		};
		
	//Bottom is High
	else {
		
		var _knob_offset = _value != 0 ? (_value / _max_value) : 0;
		_knob_offset = round(_knob_offset * (_bar_region[aR.h]-_knob_h));
		
		//Draw Arrows
		if ( _arrows ) { 		
			if ( _knob_offset != 0 )						   { buttonImage(_bar_region[aR.x1], _bar_region[aR.y1]-_knob_h-1,  _spriteset, 7, _colour, 1, "", [0,0], 1, 0, eButtonState.detect, _keys_decrease) }
														  else { buttonImage(_bar_region[aR.x1], _bar_region[aR.y1]-_knob_h-1,  _spriteset, 7, _colour, 1, "", [0,0], 1, 0, eButtonState.disabled) };
			if ( _knob_offset != (_bar_region[aR.h]-_knob_h) ) { buttonImage(_bar_region[aR.x1], _bar_region[aR.y2]+1,			_spriteset, 8, _colour, 1, "", [0,0], 1, 0, eButtonState.detect, _keys_increase) }	
														  else { buttonImage(_bar_region[aR.x1], _bar_region[aR.y2]+1,			_spriteset, 8, _colour, 1, "", [0,0], 1, 0, eButtonState.disabled) };	
			};	
			
		//Draw Knob
		buttonImage(_bar_region[aR.x1], _bar_region[aR.y1]+_knob_offset, _spriteset, 0, _colour, 1, "", [0,0], 1, 0, eButtonState.detect, _keys_knob);			
			
		};
	
	} #endregion

#region Horizontal Bar
else {
	
	//Adjust for arrows
	if ( _arrows ) { 
		_bar_region[aR.x1] += _knob_w;
		_bar_region[aR.x2] -= _knob_w;
		_bar_region[aR.w] -= _knob_w*2;
		};			
	
	//Draw Bar
	drawSprite(				_bar_region[aR.x1], _bar_region[aR.y1],			_spriteset, 4, _colour, 1);
	drawSprite_Stretched(	_bar_region[aR.x1]+_knob_w, _bar_region[aR.y1], _spriteset, 5, _colour, 1, _bar_region[aR.w]-_knob_w*2, _knob_h);
	drawSprite(				_bar_region[aR.x2]-_knob_w, _bar_region[aR.y1], _spriteset, 6, _colour, 1);
	
	//Top is High
	if ( _bar_flipped ) {
		
		var _knob_offset = _value != 0 ? (_value / _max_value) : 0;
		_knob_offset = round(_knob_offset * (_bar_region[aR.w]-_knob_h));
		
		//Draw Arrows
		if ( _arrows ) { 		
			if ( _knob_offset != (_bar_region[aR.w]-_knob_h) ) { buttonImage(_bar_region[aR.x1]-_knob_w-1, _bar_region[aR.y1],  _spriteset, 9,  _colour, 1, "", [0,0], 1, 0, eButtonState.detect, _keys_increase) }
														  else { buttonImage(_bar_region[aR.x1]-_knob_w-1, _bar_region[aR.y1],  _spriteset, 9,  _colour, 1, "", [0,0], 1, 0, eButtonState.disabled) };
			if ( _knob_offset != 0 )						   { buttonImage(_bar_region[aR.x2]+1, _bar_region[aR.y1],			_spriteset, 10, _colour, 1, "", [0,0], 1, 0, eButtonState.detect, _keys_decrease) }	
														  else { buttonImage(_bar_region[aR.x2]+1, _bar_region[aR.y1],			_spriteset, 10, _colour, 1, "", [0,0], 1, 0, eButtonState.disabled) };	
			};	
			
		//Draw Knob
		buttonImage(_bar_region[aR.x2]-_knob_offset-_knob_h, _bar_region[aR.y1], _spriteset, 0, _colour, 1, "", [0,0], 1, 0, eButtonState.detect, _keys_knob);			
			
		};
		
	//Bottom is High
	else {
		
		var _knob_offset = _value != 0 ? (_value / _max_value) : 0;
		_knob_offset = round(_knob_offset * (_bar_region[aR.w]-_knob_h));
		
		//Draw Arrows
		if ( _arrows ) { 		
			if ( _knob_offset != 0 )						   { buttonImage(_bar_region[aR.x1]-_knob_w-1, _bar_region[aR.y1],  _spriteset, 9,  _colour, 1, "", [0,0], 1, 0, eButtonState.detect, _keys_decrease) }
														  else { buttonImage(_bar_region[aR.x1]-_knob_w-1, _bar_region[aR.y1],  _spriteset, 9,  _colour, 1, "", [0,0], 1, 0, eButtonState.disabled) };
			if ( _knob_offset != (_bar_region[aR.w]-_knob_h) ) { buttonImage(_bar_region[aR.x2]+1, _bar_region[aR.y1],			_spriteset, 10, _colour, 1, "", [0,0], 1, 0, eButtonState.detect, _keys_increase) }	
														  else { buttonImage(_bar_region[aR.x2]+1, _bar_region[aR.y1],			_spriteset, 10, _colour, 1, "", [0,0], 1, 0, eButtonState.disabled) };	
			};	
			
		//Draw Knob
		buttonImage(_bar_region[aR.x1]+_knob_offset, _bar_region[aR.y1], _spriteset, 0, _colour, 1, "", [0,0], 1, 0, eButtonState.detect, _keys_knob);			
			
		};
		
	}; #endregion	