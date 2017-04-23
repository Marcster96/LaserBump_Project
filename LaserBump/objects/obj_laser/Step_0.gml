/// @description CollisionChecks
if(StartingInWall == true){
	if(!place_meeting(x,y,obj_wall)){
		StartingInWall = false
	}	
}else{
	if(place_meeting(x,y,obj_wall)){
		instance_destroy()
	}
}