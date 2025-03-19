/// @description Insert description here
// You can write your code in this editor
var menu_x = display_get_gui_width() / 2 - 100;
var menu_y = display_get_gui_height() / 2 - 75;

draw_set_color(c_white);
draw_rectangle(menu_x, menu_y, menu_x + 300, menu_y + 300, false); // Background

var color_ping_pong_table = array_contains(global.facilities, "ping pong table") ? make_color_rgb(150, 150, 150) : c_black;
var color_piano = array_contains(global.facilities, "piano") ? make_color_rgb(150, 150, 150) : c_black;
var color_soccer_field = array_contains(global.facilities, "soccer field") ? make_color_rgb(150, 150, 150) : c_black;
var color_swimming_pool = array_contains(global.facilities, "swimming pool") ? make_color_rgb(150, 150, 150) : c_black;
var color_gym = array_contains(global.facilities, "gym") ? make_color_rgb(150, 150, 150) : c_black;


draw_set_color(c_black);
draw_text(menu_x + 20, menu_y + 20, "Select Facility:");

draw_set_color(color_ping_pong_table);
draw_text(menu_x + 40, menu_y + 50, "[Ping Pong Table] - $500");
draw_set_color(color_piano);
draw_text(menu_x + 40, menu_y + 80, "[Piano] - $1,500");
draw_set_color(color_soccer_field);
draw_text(menu_x + 40, menu_y + 110, "[Soccer Field] - $10,000");
draw_set_color(color_swimming_pool);
draw_text(menu_x + 40, menu_y + 140, "[Swimming Pool] - $30,000");
draw_set_color(color_gym);
draw_text(menu_x + 40, menu_y + 170, "[Gym] - $50,000");
draw_text(menu_x + 40, menu_y + 200, "[Cancel]");
