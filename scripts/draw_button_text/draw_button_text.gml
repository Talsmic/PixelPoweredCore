///draw_button_text(x,y,text,[colour],[colour_ol],[colour_mo],[alpha],[pop],[outline],[padding],[state]);
/// @arg x				{real}
/// @arg y				{real}
/// @arg text			{string}
/// @arg [colour]		#c_code#		(default: c_shadow)
/// @arg [colour_ol]	#c_code#		(default: c_shadow_dark)
/// @arg [colour_mo]	#c_code#		(default: c_white)
/// @arg [alpha]		{real|0..1}		(default: draw_get_alpha())
/// @arg [pop]			{integer}		(default: 1)
/// @arg [outline]		{integer}		(default: 0)
/// @arg [padding]		{integer}		(default: 0)
/// @arg [state]		#eButtonState#	(default: eButtonState.detect)
/*
	[[ Draws ]] a text button with a user defined region
*/
#region Arguments
if argument_count < 3 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var _x =	argument[0];
var _y =	argument[1];
var _text =		argument[2];
var _colour =	argument_count > 3 ? argument[3] : c_shadow;
var _colour2 =	argument_count > 4 ? argument[4] : c_shadow_dark;
var _colour3 =	argument_count > 5 ? argument[5] : c_white;
var _alpha =		argument_count > 6 ? argument[6] : draw_get_alpha();
var _pop =		argument_count > 7 ? argument[7] : 1;
var _outline =	argument_count > 8 ? argument[8] : 0;
var _padding =	argument_count > 9 ? argument[9] : 0;
var _state =		argument_count > 10 ? argument[10] : eButtonState.detect;
#endregion

//Find Region
var button_region = _textRegion( _x, _y, "_text" );
if _padding { button_region = _alterRegion(button_region,_padding+_outline) };

//State Detection
if ( _state == eButtonState.detect ) { _state = buttonStateInRegion(button_region) };

//Draw
if _state = eButtonState.disabled {
	drawText( _x+1, _y, _text, c_gray2, 0.8 );
	drawText( _x,   _y, _text, c_gray7, 0.8 );
	}
else if _state = eButtonState.pressed {
	drawText( _x+1, _y, _text, _colour2, 0.8 );
	drawText( _x,   _y, _text, _colour, _alpha );
	}
else {
	if _pop { 
		for ( var i=1 ; i<=_pop ; ++i ) {	
			drawText( _x,   _y-i+1, _text, _colour2, _alpha ) 
			drawText( _x+1, _y-i+1, _text, _colour2, _alpha ) 
			};
		};
	drawText( _x, _y-_pop, _text, _colour, _alpha );
	if _state = eButtonState.mouseover { for ( var i=1 ; i<=_pop ; ++i ) { drawText( _x, _y-_pop, _text, _colour3, _alpha*0.5 ) } };
	};