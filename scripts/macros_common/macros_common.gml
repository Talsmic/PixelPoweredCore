//Beats
	#macro POSITIVE		1
	#macro NEGATIVE		-1
	enum eBeat {	
		value, count, speed, amount, size, direction	};

//Directions and Angles
	#macro NONE			0

	#macro UP			1
	#macro TOP			1
	#macro RIGHT		2
	#macro DOWN			3
	#macro BOTTOM		3
	#macro LEFT			4
	#macro VERTICAL		5
	#macro HORIZONTAL	6
	#macro ANGLE_UP		0
	#macro UP_RIGHT		7
	#macro DOWN_RIGHT	8
	#macro DOWN_LEFT	9
	#macro UP_LEFT		10
	#macro ANGLE_RIGHT 90
	#macro ANGLE_DOWN 180
	#macro ANGLE_LEFT 270
	enum eDirection {	
		stop, up, right, down, left, forward, backward	};

//Extra alignments
	#macro fa_topleft		11
	#macro fa_topcenter		12
	#macro fa_topright		13
	#macro fa_middleleft	21
	#macro fa_truecenter	22
	#macro fa_truemiddle	22
	#macro fa_middleright	23
	#macro fa_bottomleft	31
	#macro fa_bottomcenter	32
	#macro fa_bottomright	33

	//Button States
	enum eButtonState { 
		disabled, enabled, mouseover, pressed, focus, detect	};
	enum eSkillButtonState { 
		disabled, enabled, mouseover, pressed, focus, detect,
		disabled_energy, disabled_recharge	};

//Other
	enum eDepthLayer {
		background, standard, GUI, debug};
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