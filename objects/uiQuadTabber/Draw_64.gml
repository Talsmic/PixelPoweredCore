/// @desc Draw Tabs
if Hidden exit;//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>

var _x = 50;
var _y = 30;
var width = 150;
var height = 150;

Tabset_X[1] = _x+5;
Tabset_Y[1] = _y;
Tabset_X[2] = _x;
Tabset_Y[2] = _y+5;
Tabset_X[3] = _x+width;
Tabset_Y[3] = _y+5;
Tabset_X[4] = _x+5;
Tabset_Y[4] = _y+height;

drawSimplebox(_x,_y,width,height);

uiTabset_Draw(1);
uiTabset_Draw(2);
uiTabset_Draw(3);
uiTabset_Draw(4);