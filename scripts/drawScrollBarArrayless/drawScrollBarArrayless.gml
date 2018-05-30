///drawScrollBarArrayless(scrollbar_region,current_value,max_value,[eDirection],[arrows],[spriteset],[colour]);
/// @arg scrollbar_region	#region#
/// @arg current_value		{integer}
/// @arg max_value			{integer}
/// @arg [eDirection]		#eDirection#	(default: eDirection.down)
/// @arg [arrows]			{boolean}		(default: false)
/// @arg [spriteset]		#sprite_id#		(default: spr_scrollbar)
/// @arg [colour]			#c_code#		(default: draw_get_colour();)
/*
	[[ Draws ]]		
*/ 
#region Arguments & Variables
if argument_count < 3 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
//Arguments
var _region =		_validateRegion(argument[0]);
var _value =		argument[1];
var _max_value =	argument[2];
var _direction =	argument_count > 3 ? argument[3] : eDirection.down;
var _arrows =		argument_count > 4 ? argument[4] : true;
var _spriteset =	argument_count > 5 ? argument[5] : spr_scrollbar;
var _colour =		argument_count > 6 ? argument[6] : draw_get_colour();
//Other Variables
var _knob_w =		sprite_get_width(_spriteset);
var _knob_h =		sprite_get_height(_spriteset);
#endregion

#region Vertical Bar
if ( _direction == eDirection.up or _direction == eDirection.down ) {
	//Find Size and Dimensions
	var _bar_region = _regionBySize(_region[eR.x1]+((_region[eR.w]-_knob_w) div 2), _region[eR.y1], _knob_w, max(_region[eR.h], _knob_h*5));
	if ( _arrows ) { 
		_bar_region[eR.y1] += _knob_h;
		_bar_region[eR.y2] -= _knob_h;
		_bar_region[eR.h] -= _knob_h*2;
		};
	
	//Draw Bar
	drawSprite(				_bar_region[eR.x1], _bar_region[eR.y1],			_spriteset, 1, _colour, 1);
	drawSprite_Stretched(	_bar_region[eR.x1], _bar_region[eR.y1]+_knob_h, _spriteset, 2, _colour, 1, _knob_w, _bar_region[eR.h]-_knob_h*2);
	drawSprite(				_bar_region[eR.x1], _bar_region[eR.y2]-_knob_h, _spriteset, 3, _colour, 1);
	
	//Top is High
	if ( _direction == eDirection.up ) {
		
		var _knob_offset = _value != 0 ? (_value / _max_value) : 0;
		_knob_offset = round(_knob_offset * (_bar_region[eR.h]-_knob_h));
		
		//Draw Arrows
		if ( _arrows ) { 		
			if ( _knob_offset != (_bar_region[eR.h]-_knob_h) ) { buttonImage(_bar_region[eR.x1], _bar_region[eR.y1]-_knob_h-1,  _spriteset, 7, _colour, 1) }
														  else { buttonImage(_bar_region[eR.x1], _bar_region[eR.y1]-_knob_h-1,  _spriteset, 7, _colour, 1, "", [0,0], 0, 0, eButtonState.disabled) };
			if ( _knob_offset != 0 )						   { buttonImage(_bar_region[eR.x1], _bar_region[eR.y2]+1,			_spriteset, 8, _colour, 1) }	
														  else { buttonImage(_bar_region[eR.x1], _bar_region[eR.y2]+1,			_spriteset, 8, _colour, 1, "", [0,0], 0, 0, eButtonState.disabled) };	
			};	
			
		//Draw Knob
		buttonImage(_bar_region[eR.x1], _bar_region[eR.y2]-_knob_offset-_knob_h, _spriteset, 0, _colour, 1);	
		
			
		};
		
	//Bottom is High
	else {
		
		var _knob_offset = _value != 0 ? (_value / _max_value) : 0;
		_knob_offset = round(_knob_offset * (_bar_region[eR.h]-_knob_h));
		
		//Draw Arrows
		if ( _arrows ) { 		
			if ( _knob_offset != 0 )						   { buttonImage(_bar_region[eR.x1], _bar_region[eR.y1]-_knob_h-1,  _spriteset, 7, _colour, 1) }
														  else { buttonImage(_bar_region[eR.x1], _bar_region[eR.y1]-_knob_h-1,  _spriteset, 7, _colour, 1, "", [0,0], 0, 0, eButtonState.disabled) };
			if ( _knob_offset != (_bar_region[eR.h]-_knob_h) ) { buttonImage(_bar_region[eR.x1], _bar_region[eR.y2]+1,			_spriteset, 8, _colour, 1) }	
														  else { buttonImage(_bar_region[eR.x1], _bar_region[eR.y2]+1,			_spriteset, 8, _colour, 1, "", [0,0], 0, 0, eButtonState.disabled) };	
			};	
			
		//Draw Knob
		buttonImage(_bar_region[eR.x1], _bar_region[eR.y1]+_knob_offset, _spriteset, 0, _colour, 1);	
		
			
		};
	
	} #endregion

#region Horizontal Bar
else {
	//Find Size and Dimensions
	var _bar_region = _regionBySize(_region[eR.x1], _region[eR.y1], max(_region[eR.w], _knobsize*3), _knobsize) 
	if ( _arrows ) { 
		_bar_region[eR.x1] += _knobsize div 2;
		_bar_region[eR.x2] -= _knobsize div 2;
		_bar_region[eR.w] -= (_knobsize div 2)*2;
		};
	var _length =		_bar_region[eR.w];
	var _thickness =	_bar_region[eR.h];
	
	
	}; #endregion	