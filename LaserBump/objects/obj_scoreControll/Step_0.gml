/// @description 

Steps += 1
if(Steps >= room_speed){
	Steps = 0;
	Seconds += 1;
}

if(Seconds == 60){
	Minutes += 1;
	Seconds = 0;
}