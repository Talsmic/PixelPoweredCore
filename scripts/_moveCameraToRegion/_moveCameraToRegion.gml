///_moveCameraToRegion(camera,region,[x_speed],[y_speed],[boundary],[speed_multiplier],[speed_interval]);
/// @arg camera				#camera_id#
/// @arg region				#region#	
/// @arg [x_speed]			{real}		
/// @arg [y_speed]			{real}	
/// @arg boundary			#region#	
/// @arg [speed_multiplier]	{real}		
/// @arg [speed_interval]	{real}	
#region Arguments & Variables
//Arguments
var _camera =		argument[0];
var _region =		_validateRegion(argument[1]);
var _x_speed =		argument_count > 2 ? argument[2] : -1; //-1 = instant
var _y_speed =		argument_count > 3 ? argument[3] : -1; //-1 = instant
var _boundary =		argument_count > 4 ? _validateRegion(argument[4]) : _roomRegion();
var _smultipler =	argument_count > 5 ? argument[5] : 2; //-1 = instant
var _sinterval =	argument_count > 6 ? argument[6] : 1; //-1 = instant
//Other Variables
var _camera_region = _cameraRegion(_camera);
var _x =			_camera_region[aR.x1];
var _y =			_camera_region[aR.y1];
if ( _sinterval > 0 ) { 
	var _x_intervals = floor(_region[aR.w] * _sinterval);
	var _y_intervals = floor(_region[aR.h] * _sinterval);
	};
#endregion

//Move X
if ( _region[aR.x1] < _camera_region[aR.x1] ) { 
	//Instant Movement (x_speed = -1)
	if ( _x_speed == -1 ) { var _x = _region[aR.x1] }
	
	if ( _x_speed > 0 )   { 
		//If checking intervals, adjust speed by the multiplier
		if ( _sinterval > 0 ) { 
			var _intervals = (_camera_region[aR.x1] - _region[aR.x1]) div _x_intervals;
			if ( _intervals > 0  ) { _x_speed = round(_x_speed * (_smultipler*_intervals)) };
			};
		//Move Left
		var _x = clamp(_camera_region[aR.x1]-_x_speed, _boundary[aR.x1], _boundary[aR.x2]) 		
		};
	};
if ( _region[aR.x2] > _camera_region[aR.x2] ) { 
	//Instant Movement (x_speed = -1)
	if ( _x_speed == -1 ) { var _x = _region[aR.x2] - _camera_region[aR.w]  };
	
	if ( _x_speed > 0 )   { 
		//If checking intervals, adjust speed by the multiplier
		if ( _sinterval > 0 ) { 
			var _intervals = (_region[aR.x2] - _camera_region[aR.x2]) div _x_intervals;
			if ( _intervals > 0  ) { _x_speed = round(_x_speed * (_smultipler*_intervals)) };
			};
		//Move Right
		var _x = clamp(_camera_region[aR.x1]+_x_speed, _boundary[aR.x1], _boundary[aR.x2]) 		
		};
	};

//Move Y
if ( _region[aR.y1] < _camera_region[aR.y1] ) { 
	//Instant Movement (y_speed = -1)
	if ( _y_speed == -1 ) { var _y = _region[aR.y1] }
	
	if ( _y_speed > 0 )   { 
		//If checking intervals, adjust speed by the multiplier
		if ( _sinterval > 0 ) { 
			var _intervals = (_camera_region[aR.y1] - _region[aR.y1]) div _y_intervals;
			if ( _intervals > 0  ) { _y_speed = round(_y_speed * (_smultipler*_intervals)) };
			};
		//Move Up
		var _y = clamp(_camera_region[aR.y1]-_y_speed, _boundary[aR.y1], _boundary[aR.y2]) 		
		};
	};
if ( _region[aR.y2] > _camera_region[aR.y2] ) { 
	//Instant Movement (y_speed = -1)
	if ( _y_speed == -1 ) { var _y = _region[aR.y2] - _camera_region[aR.h]  };
	
	if ( _y_speed > 0 )   { 
		//If checking intervals, adjust speed by the multiplier
		if ( _sinterval > 0 ) { 
			var _intervals = (_region[aR.y2] - _camera_region[aR.y2]) div _y_intervals;
			if ( _intervals > 0  ) { _y_speed = round(_y_speed * (_smultipler*_intervals)) };
			};
		//Move Down
		var _y = clamp(_camera_region[aR.y1]+_y_speed, _boundary[aR.y1], _boundary[aR.y2]) 		
		};
	};

//Update Camera
camera_set_view_pos(_camera, _x, _y);