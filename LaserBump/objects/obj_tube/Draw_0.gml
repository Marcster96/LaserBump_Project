/// @description DrawCollisionBox


draw_self()

if(Orientation == orientation.left){ // Wenn die Röhre links rauskommt
	var rightEdge = bbox_right;
	var leftEdge = bbox_right - 40;
	var topEdge = bbox_top + 8;
	var bottomEdge = bbox_bottom- 8;
}else if(Orientation == orientation.right){
	var rightEdge = bbox_left + 40;
	var leftEdge = bbox_left;
	var topEdge = bbox_top + 8;
	var bottomEdge = bbox_bottom - 8;
}else if(Orientation == orientation.top){
	var topEdge = bbox_bottom - 40;
	var bottomEdge = bbox_bottom;
	var rightEdge = bbox_right - 8;
	var leftEdge = bbox_left + 8;
}else if(Orientation == orientation.bottom){
	var topEdge = bbox_top;
	var bottomEdge = bbox_top + 40;
	var rightEdge = bbox_right - 8;
	var leftEdge = bbox_left + 8;
}

draw_set_color(c_red)
draw_rectangle(leftEdge,topEdge,rightEdge,bottomEdge,false)
draw_set_color(c_green)
draw_rectangle(leftEdge,topEdge,rightEdge,bottomEdge,true)
draw_line_width(rightEdge,topEdge,leftEdge,bottomEdge,2)
draw_line_width(leftEdge,topEdge,rightEdge,bottomEdge,2)