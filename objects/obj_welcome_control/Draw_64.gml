/// @description Insert description here
// You can write your code in this editor
var screen_width = display_get_gui_width();
var screen_height = display_get_gui_height();

draw_set_color(make_color_rgb(230, 230, 230)); // Background
draw_rectangle(screen_width/2 - 150, screen_height/2 - 50, screen_width/2 + 150, screen_height/2 + 50, false);

draw_set_color(c_white);
draw_text(screen_width/2 - 140, screen_height/2 - 80, "Enter Your Name:");

draw_set_color(make_color_rgb(50, 50, 50));
draw_text(screen_width/2 - 140, screen_height/2 - 20, global.player_name + "_");

// Start Button
var btn_x = screen_width/2 - 50;
var btn_y = screen_height/2 + 30;
draw_set_color(make_color_rgb(100, 100, 255)); // Blue button
draw_rectangle(btn_x, btn_y, btn_x + 150, btn_y + 40, false);
draw_set_color(c_white);
draw_text(btn_x + 15, btn_y + 12, "Start Game");
