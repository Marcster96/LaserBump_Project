/// @description Draw HUD

var leftEdge = Header.bbox_left;
var rightEdge = Header.bbox_right;
var topEdge = Header.bbox_top;
var bottomEdge = Header.bbox_bottom;


draw_set_font(fnt_Headertext)
draw_set_color(c_white)


var minutes = "";
var seconds = "";

if(string_length(string(Minutes)) == 1){
	minutes = "0" + string(Minutes);
}else{
	minutes = string(Minutes);
}

if(string_length(string(Seconds)) == 1){
	seconds = "0" + string(Seconds)
}else{
	seconds= string(Seconds)	
}

if(Minutes == 0){
	minutes = "00";
}

if(Seconds == 0){
	seconds = "00";
}

var time = string(minutes) + ":" + string(seconds);

draw_text(leftEdge + ((rightEdge - leftEdge)/4),bottomEdge - ((bottomEdge - topEdge)/2),"Dein Punktestand:\n" + string(Score))
draw_text(leftEdge + ((rightEdge - leftEdge)/4) * 3,bottomEdge - ((bottomEdge - topEdge)/2),"Spielzeit:\n" + string(time))
