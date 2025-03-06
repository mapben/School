/// @description Insert description here
// You can write your code in this editor
var popup_x = display_get_gui_width() / 2 - 150;
var popup_y = display_get_gui_height() / 2 - 50;

// Draw background
draw_set_color(c_yellow);
draw_rectangle(popup_x - 300, popup_y - 300, popup_x + 600, popup_y + 400, false);

// Display text
draw_set_color(c_black);
draw_text_ext(popup_x + 20, popup_y + 20, message_text + "\n[Press Enter to Continue]", 20, 300);