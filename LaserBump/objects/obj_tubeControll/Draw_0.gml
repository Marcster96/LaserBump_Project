/// @description DrawCountdown

if(!GameStarted){
	draw_set_font(fnt_counterFont)
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_text(room_width / 2,room_height/2,string(3 - Seconds))
}