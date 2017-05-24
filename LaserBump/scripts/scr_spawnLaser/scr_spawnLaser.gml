///scr_spawnLaser(x1,y1,x2,y2)


//Declare Vars
var x1 = argument0
var y1 = argument1

var x2 = argument2
var y2 = argument3

var laser

var isInfinit = x2 - x1;
if(isInfinit == 0){
	isInfinit = true
}else{
	isInfinit = false
}

if(!isInfinit){

	//var m = (y2 - y1) / (x2 - x1)
	//show_debug_message("Steigung: " + string(m))
	var wallIsReached = false
	var diffX = (x2 - x1) / 100
	var diffY = (y2 - y1) / 100
	var calcX = 0;
	var calcY = 0;
	

 
	
	calcX = x1
	calcY = y1
		
	while(!wallIsReached){
		calcX -= diffX
		calcY -= diffY
			
		if(instance_position(calcX,calcY,obj_wall)){
			wallIsReached = true
		}
	}
		
	laser = instance_create_layer(floor(calcX),floor(calcY),"Laser",obj_laser)
	
}else{
	show_debug_message("Unendlich")
	
	if(y1 < y2){
		show_debug_message("Nach Oben")
		laser = instance_create_layer(x1,150,"Laser",obj_laser)
	}else{
		show_debug_message("Nach Unten")
		laser = instance_create_layer(x2,2070,"Laser",obj_laser)
	}	
}


with(laser){
	direction = point_direction(x,y,x1,y1)
	speed = 50
	image_angle = direction;
}