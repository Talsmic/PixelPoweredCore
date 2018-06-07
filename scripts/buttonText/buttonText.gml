///buttonText(x,y,text,[colour],[colour_ol],[colour_mo],[alpha],[pop],[outline],[padding],[state]);
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
#region Arguments & Variables
if argument_count < 3 { show_debug_message("ArgError"); exit };//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~>
var draw_x =	argument[0];
var draw_y =	argument[1];
var text =		argument[2];
var colour =	argument_count > 3 ? argument[3] : c_shadow;
var colour_ol =	argument_count > 4 ? argument[4] : c_shadow_dark;
var colour_mo =	argument_count > 5 ? argument[5] : c_white;
var alpha =		argument_count > 6 ? argument[6] : draw_get_alpha();
var pop =		argument_count > 7 ? argument[7] : 1;
var outline =	argument_count > 8 ? argument[8] : 0;
var padding =	argument_count > 9 ? argument[9] : 0;
var state =		argument_count > 10 ? argument[10] : eButtonState.detect;
#endregion

//Find Region
var button_region = _textRegion( draw_x, draw_y, "text" );
if padding { button_region = _alterRegion(button_region,padding+outline) };

//State Detection
if ( state == eButtonState.detect ) { state = buttonStateInRegion(button_region) };

//Draw
if state = eButtonState.disabled {
	drawText( draw_x+1, draw_y, text, c_gray2, 0.8 );
	drawText( draw_x, draw_y, text, c_gray7, 0.8 );
	}
else if state = eButtonState.pressed {
	drawText( draw_x+1, draw_y, text, colour_ol, 0.8 );
	drawText( draw_x, draw_y, text, colour, alpha );
	}
else {
	if pop { 
		for ( var i=1 ; i<=pop ; ++i ) {	
			drawText( draw_x, draw_y-i+1, text, colour_ol, alpha ) 
			drawText( draw_x+1, draw_y-i+1, text, colour_ol, alpha ) 
			};
		};
	drawText( draw_x, draw_y-pop, text, colour, alpha );
	if state = eButtonState.mouseover { for ( var i=1 ; i<=pop ; ++i ) { drawText( draw_x, draw_y-pop, text, colour_mo, alpha*0.5 ) } };
	};