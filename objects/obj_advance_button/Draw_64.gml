/// @description Insert description here
// You can write your code in this editor
var btn_x = display_get_gui_width() - 150; // Position on the right
var btn_y = display_get_gui_height() - 150;
var btn_width = 130;
var btn_height = 40;

// Draw semi-transparent button background
draw_set_alpha(0.8);
draw_set_color(c_blue);
draw_rectangle(btn_x, btn_y, btn_x + btn_width, btn_y + btn_height, false);
draw_set_alpha(1);

// Draw button text
draw_set_color(c_orange);
draw_text(btn_x + 20, btn_y + 12, "Next Week");
