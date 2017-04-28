/// @description Insert description here

DragEndPoint_x = mouse_x;
DragEndPoint_y = mouse_y;

draw_set_color(c_red);
draw_circle(mouse_x,mouse_y,10,true)


event_perform(ev_draw,0);

scr_spawnLaser(DragStartPoint_x,DragStartPoint_y,DragEndPoint_x,DragEndPoint_y);
