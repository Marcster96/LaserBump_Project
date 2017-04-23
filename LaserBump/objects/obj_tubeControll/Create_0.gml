/// @description Init




//Generell

MaxSecs = 4
MinSecs = 1

CurrentSecs = MaxSecs
//StepCounter
Steps = 0

//Timer
Minutes = 0
Seconds = 0

TubeList = ds_list_create()

GameStarted = false

alarm_set(0,3*room_speed)