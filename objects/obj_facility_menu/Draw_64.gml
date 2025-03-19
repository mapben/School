/// @description Insert description here
// You can write your code in this editor
var menu_x = display_get_gui_width() / 2 - 100;
var menu_y = display_get_gui_height() / 2 - 50;

draw_set_color(c_white);
draw_rectangle(menu_x, menu_y, menu_x + 450, menu_y + 100, false);

var global.current_price = 0;
if(global.build_object == "ping pong table") global.current_price = 500;
else if(global.build_object == "piano") global.current_price = 1500;
else if(global.build_object == "soccer field") global.current_price = 10000;
else if(global.build_object == "swimming pool") global.current_price = 30000;

draw_set_color(c_black);
draw_text(menu_x + 20, menu_y + 20, "Purchase this " + global.build_object + " for $" + string(global.current_price) + "?");
draw_text(menu_x + 50, menu_y + 70, "[Y] Yes");
draw_text(menu_x + 130, menu_y + 70, "[N] No");

