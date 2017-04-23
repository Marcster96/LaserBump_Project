/// @description PlaceFirstRushTubes

while(!scr_createTube()){
	show_debug_message("tube getroffen neu kalkulieren")
}

alarm_set(0,CurrentSecs*room_speed)

if(GameStarted == false){
	GameStarted = true
	Steps = 0
	Seconds = 0
}