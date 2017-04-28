/// @description Draw HUD

var leftEdge = Header.bbox_left;
var rightEdge = Header.bbox_right;
var topEdge = Header.bbox_top;
var bottomEdge = Header.bbox_bottom;


draw_set_font(fnt_Headertext)
draw_set_color(c_white)


draw_text(leftEdge + ((rightEdge - leftEdge)/4),bottomEdge - ((bottomEdge - topEdge)/2),"Dein Punktestand:\n" + string(Score))
