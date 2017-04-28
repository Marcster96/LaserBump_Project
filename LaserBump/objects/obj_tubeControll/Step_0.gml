/// @description CountSecoundsToIncreseLevel
if(!GameStarted){
	Steps += 1
	if(Steps >= room_speed){
		Steps = 0;
		Seconds += 1;
		event_perform(ev_draw,0)
	}
}