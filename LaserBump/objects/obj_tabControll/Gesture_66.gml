/// @description Insert description here

DragStartPoint_x = mouse_x;
DragStartPoint_y = mouse_y;


draw_set_color(c_red);
draw_circle(mouse_x,mouse_y,10,true)

event_perform(ev_draw,0);