if ( keyboard_check_released(vk_tab) ) { 
	Instance = _upto(Instance, instance_number(_wanderer)-1, 1, eUpto.zero);
	CameraFollowObject = instance_find(_wanderer, Instance);
	};