/// @description Insert description here
// You can write your code in this editor

draw_set_alpha(1)
draw_set_color(c_orange)
draw_set_halign(fa_center)
//draw_text(x,y,string(x)+","+string(y))
draw_self()
if selected {
	draw_text(x,y,string(id)+"S\n"+string(x)+","+string(y))
}
else draw_text(x,y,string(id)+"U\n"+string(x)+","+string(y))
