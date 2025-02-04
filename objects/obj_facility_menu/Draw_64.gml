/// @description Insert description here
// You can write your code in this editor
var menu_x = display_get_gui_width() / 2 - 100;
var menu_y = display_get_gui_height() / 2 - 75;

draw_set_color(c_white);
draw_rectangle(menu_x, menu_y, menu_x + 200, menu_y + 150, false); // Background

draw_set_color(c_black);
draw_text(menu_x + 20, menu_y + 20, "Select Facility:");
draw_text(menu_x + 40, menu_y + 50, "[Classroom] - $20,000");
draw_text(menu_x + 40, menu_y + 80, "[Gym] - $30,000");
draw_text(menu_x + 40, menu_y + 110, "[Cancel]");
