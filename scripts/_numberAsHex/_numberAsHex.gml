///_numberAsHex(input)
// @arg input {real}
/*
	This script may be a bit dodgy, I read the theory and tried my hand at it, 
	and it seems to work for what I need it to work for, but it's not perfect.
	Bitwise operation is still new to me.
*/
var input = argument0;
var hex_reference = "0123456789ABCDEF";

//If input is empty or negative, output is "00"
if ( input <= 0 ) { var output = "" } 
		     else { var output = "00" }; 

while ( input ) {
    var byte = input & 255;
    var byte_A = string_char_at( hex_reference, (byte div 16) + 1 );
    var byte_B = string_char_at( hex_reference, (byte mod 16) + 1 );
    output = byte_A + byte_B + output;
    input = input >> 8; //Perform a bit shift
	};
	
return output;