/// @description CollisionChecks

if(StartingInWall == true){
	if(!place_meeting(x,y,obj_wall)){
		StartingInWall = false
	}	
}else{
	if(SetDestroying == false &&  IsBouncing == false &&  place_meeting(x,y,obj_bouncingWall)){
		var collision = instance_place(x,y,obj_bouncingWall);
		
		if(collision.object_index == obj_tube && collision.TubeHit == false){ // Collision mit einer tube
			//Checking Collision with Laser
			if(collision.Orientation == orientation.left){ // Wenn die Röhre links rauskommt
				var rightEdge = collision.bbox_right + 12; //rand der geprüft werden muss
				var leftEdge = collision.bbox_right - 50;
				var topEdge = collision.bbox_top + 8;
				var bottomEdge = collision.bbox_bottom - 8;
			}else if(collision.Orientation == orientation.right){
				var rightEdge = collision.bbox_left + 50;
				var leftEdge = collision.bbox_left - 12; //rand der geprüft werden muss
				var topEdge = collision.bbox_top + 8;
				var bottomEdge = collision.bbox_bottom - 8;
			}else if(collision.Orientation == orientation.top){
				var topEdge = collision.bbox_bottom - 50;
				var bottomEdge = collision.bbox_bottom + 12; //rand der geprüft werden muss
				var rightEdge = collision.bbox_right - 8;
				var leftEdge = collision.bbox_left + 8;
			}else if(collision.Orientation == orientation.bottom){
				var topEdge = collision.bbox_top - 12; //rand der geprüft werden muss
				var bottomEdge = collision.bbox_top + 50;
				var rightEdge = collision.bbox_right - 8;
				var leftEdge = collision.bbox_left + 8;
			}

	
			
		 
			var currX = LastX
			var currY = LastY

			
			var diffX = (x - LastX) / 100
			var diffY = (y - LastY) / 100
			
			
			//Falls der Winkel zu spitz ist, werden die schritte abgezogen die zugehen sind sobald der Laser mit der Wand kollidiert
			var bDiffX = 0
			var bDiffY = 0
			
			
			var counterToCheck = 8
			
			if(sign(diffX) == -1){
				bDiffX = diffX * -1
			}else{
				bDiffX = diffX
			}
			
			if(sign(diffY) == -1){
				bDiffY = diffY * -1
			}else{
				bDiffY = diffY
			}
			
			if(bDiffX * 0.40  > bDiffY){
				counterToCheck = 4
			}
			
			if(bDiffY * 0.40 > bDiffX){
				counterToCheck = 4
			}
			//Ende Winkelberechnung
			
			
			//Hier wird Schritt für schritt ausgerechnet, ob der Laser im Rechteck getroffen hat oder einen umweg über ein nicht Rechteck-Wert
			var isInRectangle = true
			var oldPointIsReached = false
			
			show_debug_message("Letzten Koordinaten:" + string(LastX) + "/" + string(LastY) + " Jetztige Koordinaten:" + string(x) + "/" + string(y) + " Diff:" + string(diffX) + "/" + string(diffY))
			var counter = 0;
			while(!oldPointIsReached){
				currX += diffX
				currY += diffY
				if(place_meeting(currX,currY,obj_tube)){			
					counter +=1
				
					show_debug_message(string(currX) + "/" +string(currY) + " Konditionen: " + "InTube?" + string(place_meeting(currX,currY,obj_tube)) + " Noch im Rectangle?" + string(point_in_rectangle(currX,currY,leftEdge,topEdge,rightEdge,bottomEdge)) + " Rectangle:" + string(leftEdge) + "/" + string(topEdge) + "|" + string(rightEdge) + "/" + string(bottomEdge))
					if(!point_in_rectangle(currX,currY,leftEdge,topEdge,rightEdge,bottomEdge)){
						isInRectangle = false
						break;
					}
				
					if(currX == LastX && currY == LastY){
						oldPointIsReached = true
					}
				
					if(counter == counterToCheck){
						break;
					}
				}
			}
			
			
			
			if(isInRectangle){ // Punkt wurde erreicht !
				var bounces = BounceCounter
				show_debug_message("Collision deteced - Punkt + 1")
				with(instance_find(obj_scoreControll,0))Score += bounces			
				
				with(collision){
					Forward = false
					TubeHit = true
					Steps = 0
				}
				part_emitter_destroy(part_sys,part_emit)
				
				instance_destroy()
				
				exit;
			}else{ // Der Spieler hat gegen die Röhre getroffen
				show_debug_message("Gegen Tube geflogen")
				
				if(BounceCounter == 3){
					SetDestroying = true
				}else{
					BounceCounter +=1
					IsBouncing = true
					move_bounce_solid(true)
					image_angle = direction
				}
			}
			
		}else{ // Collision mit irgendeiner wand.
			show_debug_message("Gegen die Wand geflogen")
			
			
			if(BounceCounter == 3){
				SetDestroying = true
			}else{
				BounceCounter +=1
				move_bounce_solid(true)
				image_angle = direction
				IsBouncing = true
			}
		}
	}
}


if(SetDestroying && place_meeting(bbox_left,bbox_top + (bbox_bottom - bbox_top) / 2,obj_bouncingWall)){
	
	part_emitter_destroy(part_sys,part_emit)
	
	instance_destroy()
}


if(IsBouncing && !place_meeting(x,y,obj_bouncingWall)){
	//Bouncing ausführen
	IsBouncing = false
}

part_emitter_region(part_sys,part_emit,LastX-20,LastX+20,LastY-20,LastY+20,ps_shape_ellipse,ps_distr_gaussian);
part_type_gravity(partStandard,0.009,image_angle);
LastX = x
LastY = y
