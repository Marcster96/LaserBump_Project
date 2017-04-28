randomize()
var tubeX
var tubeY
var rangeOutsideTheWall = irandom_range(10,40)
var angle 
var angleToChange = irandom_range(-30,30)

var top = 150
var bottom = 2070
var left = 150
var right = 1230

var wallNr = irandom_range(1,4)
switch(wallNr){
	case 1: // rechts
		tubeX = right;
		tubeY = irandom_range(300 + sprite_get_height(spr_header),1920)
		angle = 180;
		break;
	case 2: // links
		tubeX = left;
		tubeY = irandom_range(300 + sprite_get_height(spr_header),1920)
		angle = 0;
		break;
	case 3: // oben
		tubeY = top + sprite_get_height(spr_header);
		tubeX = irandom_range(300,1080)
		angle = 270
		break;
	case 4: // unten
		tubeY = bottom;
		tubeX = irandom_range(300,1080)
		angle = 90
		break;
}

var foundCollision = false
var range = 100
for(var i = 0; i < 100;i++){
	if(position_meeting(tubeX + i,tubeY,obj_tube)){
		foundCollision = true;
		break;
	}
	
	if(position_meeting(tubeX,tubeY+i,obj_tube)){
		foundCollision = true;
		break;
	}
	
	if(position_meeting(tubeX - i, tubeY,obj_tube)){
		foundCollision = true;
		break;
	}
	
	if(position_meeting(tubeX,tubeY-i,obj_tube)){
		foundCollision = true;
		break;
	}
}

if(foundCollision){
	return false
}

var tube = instance_create_layer(tubeX,tubeY,"Tubes",obj_tube)
with(tube){
	
	switch(angle){
		case 90: 
			Orientation = orientation.bottom
			break;
		case 0:
			Orientation = orientation.left
			break;
		case 180:
			Orientation = orientation.right
			break;
		case 270:
			Orientation = orientation.top
			break;
	}
	
	StepsToWalk = rangeOutsideTheWall
	image_angle = angle
	direction = angle
}

return true