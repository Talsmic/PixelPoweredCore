///_opposite(direction);
/// @arg direction {integer}

switch ( argument0 ) {
	case UP:			return DOWN;		
	case RIGHT:			return LEFT;	
	case DOWN:			return UP;		
	case LEFT:			return RIGHT;
	case VERTICAL:		return HORIZONTAL;
	case HORIZONTAL:	return VERTICAL;
	case UP_RIGHT:		return DOWN_LEFT;
	case DOWN_RIGHT:	return UP_LEFT;
	case DOWN_LEFT:		return UP_RIGHT;
	case UP_LEFT:		return DOWN_RIGHT;
	};

return 0;