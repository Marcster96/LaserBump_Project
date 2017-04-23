/// @description CountSecoundsToIncreseLevel
if(GameStarted){
	Steps += 1;
	if (Steps >= room_speed)
	{
		Steps = 0;
		Seconds += 1;
	}

	if(Seconds >= 60)
	{
		Seconds = 0;
		Minutes += 1;
	}
}else{
	Steps += 1
	if(Steps >= room_speed){
		Steps = 0;
		Seconds += 1;
		event_perform(ev_draw,0)
	}
}