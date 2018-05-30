var c = 1;
repeat 6 {
	var yy = 42;
	_drawPlane(c*40-5,yy,10,32,find_colour_shadowed(c));
	yy += 16;
	buttonFramed(c*40-20,yy,spr_icon_24_frame,spr_icon_24,55,find_colour_shadowed(c),find_colour_shadowed(c),1,-1);
	yy += 16;
	_drawPlane(c*40-5,yy,10,32,find_colour(c));
	yy += 16;
	buttonFramed(c*40-20,yy,spr_icon_24_frame,spr_icon_24,55,find_colour(c),find_colour(c),1,-1);
	yy += 16;
	_drawPlane(c*40-5,yy,10,32,find_colour_light(c));
	yy += 16;
	buttonFramed(c*40-20,yy,spr_icon_24_frame,spr_icon_24,55,find_colour_light(c),find_colour_light(c),1,-1);
	c++;
	}; 
	
/*
var c = 1;
repeat 5 {
	var yy = 182;
	_drawPlane(c*40-5,yy,10,32,find_colour_dark(c+10));
	yy += 16;
	buttonFramed(c*40-20,yy,spr_icon_24_frame,spr_icon_24,55,find_colour_dark(c+10),find_colour_dark(c+10),1,-1);
	yy += 16;
	_drawPlane(c*40-5,yy,10,32,find_colour(c+10));
	yy += 16;
	buttonFramed(c*40-20,yy,spr_icon_24_frame,spr_icon_24,55,find_colour(c+10),find_colour(c+10),1,-1);
	yy += 16;
	_drawPlane(c*40-5,yy,10,32,find_colour_light(c+10));
	yy += 16;
	buttonFramed(c*40-20,yy,spr_icon_24_frame,spr_icon_24,55,find_colour_light(c+10),find_colour_light(c+10),1,-1);
	c++;
	}; 