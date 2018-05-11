///draw_textbutton_ext(x,y,string,mode,colour,colour2,colour3,height_padding,width_padding);
/// @arg x			
/// @arg y
/// @arg string		
/// @arg mode
/// @arg colour
/// @arg colour2
/// @arg colour3
/// @arg height_padding
/// @arg width_padding
var X = argument0; 
var Y = argument1; 
var _string = argument2; 
var mode = argument3
var colour = argument4;
var colour2 = argument5;
var colour3 = argument6;
var height_padding = argument7; 
var width_padding = argument8; 
/*
	>Draws a text button with a user defined region
*/

var height = string_height( _string ) - 2;
var width = string_width( _string ) - 2;

//State Detection
if ( infocus() ) {
	if ( mouse_in_region_gui( define_region( X-width_padding,Y-height_padding,width+width_padding,height+height_padding ) ) ) {
		if ( mouse_check_button(mb_left) ) {
			var state = eButtonState.pressed
			}
		else { var state = eButtonState.mouseover };
		}
	else { var state = eButtonState.enabled };
	}
else { var state = eButtonState.disabled };

//Draw
switch ( mode ) {
	case "Flat":
	//=[Flat Buttons]=(Colour=Body, Colour2=Rollover)===========================
		switch ( state ) {	
			case eButtonState.disabled:
				draw_text_flatcolour( X,Y,_string,c_midgray,0.8 );
				break;		
			case eButtonState.enabled: default:
				draw_text_flatcolour( X,Y,_string,colour,1 );
				break;		
			case eButtonState.pressed:
				draw_text_flatcolour( X,Y,_string,colour2,1 );
				break;		
			case eButtonState.mouseover:
				draw_text_flatcolour( X,Y,_string,colour2,1 );
				break;			
			};
		break;
	case "Padded": default:
	//=[Padded Buttons]=(Colour=Body, Colour2=Rollover, Colour3=Padding)========
		switch ( state ) {	
			case eButtonState.disabled:
				draw_text_flatcolour( X+1,Y+1,_string,c_darkgray,0.8 );
				draw_text_flatcolour( X,Y+1,_string,c_midgray,0.8 );
				break;		
			case eButtonState.enabled: default:
				draw_text_flatcolour( X+1,Y+1,_string,colour3,0.8 );
				draw_text_flatcolour( X,Y,_string,colour,1 );
				break;		
			case eButtonState.pressed:
				draw_text_flatcolour( X+1,Y+1,_string,colour3,0.8 );
				draw_text_flatcolour( X,Y+1,_string,colour2,1 );
				break;		
			case eButtonState.mouseover:
				draw_text_flatcolour( X+1,Y+1,_string,colour3,0.8 );
				draw_text_flatcolour( X,Y,_string,colour2,1 );
				break;			
			};
		break;
	//==========================================================================
	case "Outline": case "Outlined":
	//=[Outlined Buttons]=(Colour=Body, Colour2=Rollover, Colour3=Outline)======
		switch ( state ) {	
			case eButtonState.disabled:
				draw_text_outline_coloured( X,Y+1,_string,c_midgray,c_darkgray );
				break;		
			case eButtonState.enabled: default:
				draw_text_outline_coloured( X,Y+1,_string,colour,colour3 );
				draw_text_outline_coloured( X,Y,_string,colour,colour3 );
				break;		
			case eButtonState.pressed:
				draw_text_outline_coloured( X,Y+1,_string,colour,colour3 );
				break;		
			case eButtonState.mouseover:
				draw_text_outline_coloured( X,Y+1,_string,colour2,colour3 );
				draw_text_outline_coloured( X,Y,_string,colour2,colour3 );
				break;		
			};
		break;
	//==========================================================================
	};