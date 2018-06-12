_align = [fa_top, fa_left, 0, 0]

array1d = [1,2,3,4,5,6,7,8,9,10]
for ( var i=10 ; i > 0 ; --i ) {
	for ( var j=10 ; j > 0 ; --j ) {
		array2d[i,j] = i*10+j;
		};
	};

check1A = _arrayRowAsArray(array1d,0,3,7);
check2A = _arrayRowAsArray(array2d,5,4,8);
check1B = _arrayColumnAsArray(array1d,5);
check2B = _arrayColumnAsArray(array2d,5,2,5);






values = _dsMapCreate([	"test",				60, 
						"test2",			8.9,
						"testies",			TESTSTRING			]);
uibox = uiBox_Create()//([	"Heading_Text",		"dsMap Contents", 
						//"Heading_Draw",		 true				]);

alarm[0] = 5;