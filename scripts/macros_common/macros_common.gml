

		


//Button States
	enum eButtonState { 
		disabled, enabled, mouseover, pressed, focus, detect	};


		
	#macro	GLYPHSTRING_BasicLatin " !\"#$%&'()*+,-./  \n0123456789:;<=>?  \n@ABCDEFGHIJKLMNO  \nPQRSTUVWXYZ[\\]^_  \n`abcdefghijklmno  \npqrstuvwxyz{|}~"
	#macro	TESTSTRING	"abcdef ABCDEF\n0123456789 .,<>\"'&!?\nthe quick brown fox jumps over the lazy dog\nTHE QUICK BROWN FOX JUMPS OVER THE LAZY DOG"
	#macro	TESTSTRINGA	"the quick brown fox jumps over the lazy dog"
	#macro	TESTSTRINGB	"THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG"
	#macro	TESTSTRING2 "The|1 quick|2 brown|3 fox|4 jumps|5 over|6 the|7 lazy|8 dog|9"
	#macro	TESTSTRING3 "The. quick, brown! fox? jumps: over; the' lazy# dog$"
	#macro	TESTSTRING4 "The.|1 quick,|2 brown!|3 fox?|4 jumps:|5 over;|6 the'|7 lazy#|8 dog$|9"
	#macro	TESTSTRING5 "The|bold quick|2, brown|bold fox|4? jumps|condensed over|6; the|squished lazy|8# dog|2|b"