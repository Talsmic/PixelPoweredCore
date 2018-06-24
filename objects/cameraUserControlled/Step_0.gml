//Move
if ( keyboard_check( ord("A") ) ) {	x -= MovementSpeed; image_angle = 90;	};
if ( keyboard_check( ord("D") ) ) {	x += MovementSpeed; image_angle = 270;	};
if ( keyboard_check( ord("W") ) ) {	y -= MovementSpeed; image_angle = 0;	};
if ( keyboard_check( ord("S") ) ) {	y += MovementSpeed; image_angle = 180;	};

//Snap
if ( x < 16 ) { x = 16 };
if ( x > room_width - 16 ) { x = room_width - 16 };
if ( y < 16 ) { y = 16 };
if ( y > room_height - 16 ) { y = room_height - 16 };