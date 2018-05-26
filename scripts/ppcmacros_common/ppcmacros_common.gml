//Beats
	#macro POSITIVE		1
	#macro NEGATIVE		-1
	
	enum eBeat {	
		value, count, speed, amount, size, direction	};

//Directions and Angles
	#macro NONE			0

	#macro STOP			0
	#macro LEFT			1
	#macro UP			2
	#macro RIGHT		3
	#macro DOWN			4
	
	#macro LEFT_DOWN	8
	#macro LEFT_UP		5
	#macro UP_LEFT		5
	#macro UP_RIGHT		6
	#macro RIGHT_UP		6
	#macro RIGHT_DOWN	7
	#macro DOWN_RIGHT	7
	#macro DOWN_LEFT	8
	
	#macro TOP			2
	#macro BOTTOM		4
	#macro HORIZONTAL	9
	#macro VERTICAL		10
	
	#macro ANGLE_UP			0
	#macro ANGLE_RIGHT		90
	#macro ANGLE_DOWN		180
	#macro ANGLE_LEFT		270
	#macro ANGLE_LEFT_DOWN	225
	#macro ANGLE_LEFT_UP	315
	#macro ANGLE_UP_LEFT	315
	#macro ANGLE_UP_RIGHT	45
	#macro ANGLE_RIGHT_UP	45
	#macro ANGLE_RIGHT_DOWN	135
	#macro ANGLE_DOWN_RIGHT	135
	#macro ANGLE_DOWN_LEFT	225
	
	enum eDirection {	
		stop, left, up, right, down, leftup, rightup, rightdown, leftdown	};
	enum eAngle {	
		up =		0, 
		rightup =	45, 
		right =		90, 
		rightdown = 135, 
		down =		180, 
		leftdown =	225,	
		left =		270,
		leftup =	315 
		};

//Button States
	enum eButtonState { 
		disabled, enabled, mouseover, pressed, focus, detect	};

//Other

	enum eR { //region
		x1, y1, x2, y2, w, h };
	enum eCorner {
		topL, topR, botL, botR };
	enum eFontStyle {
		normal, bold, strong, thin, italic, condensed, squished };
		
	#macro	TESTSTRING	"The quick brown fox jumps over the lazy dog"
	#macro	TESTSTRING2 "The|1 quick|2 brown|3 fox|4 jumps|5 over|6 the|7 lazy|8 dog|9"
	#macro	TESTSTRING3 "The. quick, brown! fox? jumps: over; the' lazy# dog$"
	#macro	TESTSTRING4 "The.|1 quick,|2 brown!|3 fox?|4 jumps:|5 over;|6 the'|7 lazy#|8 dog$|9"
	#macro	TESTSTRING5 "The|bold quick|2, brown|bold fox|4? jumps|condensed over|6; the|squished lazy|8# dog|2|b"