///masterdrawer_storearguments(count);
/// @arg count {integer}
var count = argument0;

for ( var i=0; i<count; ++i ) {
	Arg_Integer[i] = i;
	Arg_Real[i] = i+0.5;
	Arg_String[i] = "Test String #"+string(i)+string(i)+string(i);
	Arg_Boolean[i] = false;
	
	Arg_ColourCode[i] = findColour(i);
	
	Arg_Integer_X[i] = 20+20*i;
	Arg_Integer_Y[i] = 20+20*i;
	Arg_Integer_Width[i] = 50+20*i;
	Arg_Integer_Height[i] = 40+20*i;
	Arg_Integer_ImageID[i] = 0;
	Arg_Integer_Size[i] = 3+i;
	
	Arg_Real_Alpha[i] = 1 - 0.2*i
	
	Arg_SpriteID[i] = spr_genomestar;
	}; 