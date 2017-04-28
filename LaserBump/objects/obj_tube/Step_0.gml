/// @description 
if(Forward){
	if(Steps < StepsToWalk){
		speed = 5;
		Steps += 1;
	}else{
		speed = 0;
		if(!AlarmSet){
			alarm_set(0,TubeAlive*room_speed);
			AlarmSet = true;
		}
	}
}else{
	if(Steps < StepsToWalk){
		speed = -5;
		Steps += 1;
	}else{			
		instance_destroy()
	}
}

