var _bound = MovementSpeed * EventSpeed;

switch ( Event ) {
	case 1:		x -= MovementSpeed; image_angle = 90;	break;
	case 2:		x += MovementSpeed; image_angle = 270;	break;
	case 3:		y -= MovementSpeed; image_angle = 0;	break;
	case 4:		y += MovementSpeed; image_angle = 180;	break;
	};

//Snap
if ( x < _bound ) { x = _bound };
if ( x > room_width - _bound ) { x = room_width - _bound };
if ( y < _bound ) { y = _bound };
if ( y > room_height - _bound ) { y = room_height - _bound };