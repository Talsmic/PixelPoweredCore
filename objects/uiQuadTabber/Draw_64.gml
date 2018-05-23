/// @desc Draw Tabs
if Hidden exit;//[!Break!]~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>

var _x = 50;
var _y = 30;
var width = 150;
var height = 150;

TabSet_X[1] = _x+5;
TabSet_Y[1] = _y;
TabSet_X[2] = _x;
TabSet_Y[2] = _y+5;
TabSet_X[3] = _x+width;
TabSet_Y[3] = _y+5;
TabSet_X[4] = _x+5;
TabSet_Y[4] = _y+height;

draw_simplebox(_x,_y,width,height);

ui_TabSet_draw(1);
ui_TabSet_draw(2);
ui_TabSet_draw(3);
ui_TabSet_draw(4);