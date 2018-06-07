///_gameIntitialise()

//Required for [align]:
global.AlignX =		fa_left;
global.AlignY =		fa_top;
global.AlignXo =	0;
global.AlignYo =	0;

//Required for [beat]:
global.GameBeat =	0;
global.ScrollBeat = 0;

//Required for [font]:
global.Font =		ft_Pixis07;
global.BaseFont =	ft_Pixis07;

//Create _globalController
instance_create_depth(0,0,0,_globalController);