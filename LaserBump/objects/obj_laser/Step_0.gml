/// @description CollisionChecks

if(StartingInWall == true){
	if(!place_meeting(x,y,obj_wall)){
		StartingInWall = false
	}	
}else{
	if(place_meeting(x,y,obj_bouncingWall)){
		var collision = instance_place(x,y,obj_bouncingWall);
		
		if(collision.object_index == obj_tube){ // Collision mit einer tube
			//Checking Collision with Laser
			if(collision.Orientation == orientation.left){ // Wenn die Röhre links rauskommt
				var rightEdge = collision.bbox_right;
				var leftEdge = collision.bbox_right - 40;
				var topEdge = collision.bbox_top + 8;
				var bottomEdge = collision.bbox_bottom - 8;
			}else if(collision.Orientation == orientation.right){
				var rightEdge = collision.bbox_left + 40;
				var leftEdge = collision.bbox_left;
				var topEdge = collision.bbox_top + 8;
				var bottomEdge = collision.bbox_bottom - 8;
			}else if(collision.Orientation == orientation.top){
				var topEdge = collision.bbox_bottom - 40;
				var bottomEdge = collision.bbox_bottom;
				var rightEdge = collision.bbox_right - 8;
				var leftEdge = collision.bbox_left + 8;
			}else if(collision.Orientation == orientation.bottom){
				var topEdge = collision.bbox_top ;
				var bottomEdge = collision.bbox_top + 40;
				var rightEdge = collision.bbox_right - 8;
				var leftEdge = collision.bbox_left + 8;
			}

			show_debug_message("Laser Werte: (X:" + string(x) + "/Y:" + string(y) + "|| Rectangle: " + " LeftEdge:" + string(leftEdge) + " RightEdge:" + string(rightEdge) + " TopEdge:" + string(topEdge) + " BottomEdge:" + string(bottomEdge));
			
			
		 
			
			if(){
				show_debug_message("Collision deteced - Punkt + 1")
				with(instance_find(obj_scoreControll,0))Score += 1
				instance_destroy()
				exit;
			}else{
				show_debug_message("Gegen Tube geflogen")
				instance_destroy();
			}
			
		}else{ // Collision mit irgendeiner wand.
			show_debug_message("Gegen die Wand geflogen")
			instance_destroy();
		}
	}
}


if(IsBouncing){
	//Bouncing ausführen
}


LastX = x
LastY = y

show_debug_message("(" + string(LastX) + "/" + string(y) + ")")