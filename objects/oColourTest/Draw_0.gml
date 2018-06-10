var c = 1;
repeat 6 {
	var yy = 42;
	drawPlane(c*40-5,yy,10,32,findColour_Shadowed(c));
	yy += 16;
	drawButton_Framed(c*40-20,yy,spr_icon_24_frame,spr_icon_24,55,findColour_Shadowed(c),findColour_Shadowed(c),1,-1);
	yy += 16;
	drawPlane(c*40-5,yy,10,32,findColour(c));
	yy += 16;
	drawButton_Framed(c*40-20,yy,spr_icon_24_frame,spr_icon_24,55,findColour(c),findColour(c),1,-1);
	yy += 16;
	drawPlane(c*40-5,yy,10,32,findColour_Light(c));
	yy += 16;
	drawButton_Framed(c*40-20,yy,spr_icon_24_frame,spr_icon_24,55,findColour_Light(c),findColour_Light(c),1,-1);
	c++;
	}; 
	
/*
var c = 1;
repeat 5 {
	var yy = 182;
	drawPlane(c*40-5,yy,10,32,findColour_dark(c+10));
	yy += 16;
	drawButton_Framed(c*40-20,yy,spr_icon_24_frame,spr_icon_24,55,findColour_dark(c+10),findColour_dark(c+10),1,-1);
	yy += 16;
	drawPlane(c*40-5,yy,10,32,findColour(c+10));
	yy += 16;
	drawButton_Framed(c*40-20,yy,spr_icon_24_frame,spr_icon_24,55,findColour(c+10),findColour(c+10),1,-1);
	yy += 16;
	drawPlane(c*40-5,yy,10,32,findColour_Light(c+10));
	yy += 16;
	drawButton_Framed(c*40-20,yy,spr_icon_24_frame,spr_icon_24,55,findColour_Light(c+10),findColour_Light(c+10),1,-1);
	c++;
	}; 