/// @description Insert description here
// You can write your code in this editor
var btn_x = display_get_gui_width() - 180; // 180px from the right
var btn_y = display_get_gui_height() - 80; // 80px from the bottom

draw_set_color(c_blue);
draw_roundrect(btn_x, btn_y, btn_x + 150, btn_y + 50, false);
draw_set_color(c_orange);
draw_text(btn_x + 20, btn_y + 15, "Go to Desk");
