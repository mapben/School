/// @description Insert description here
// You can write your code in this editor
// Get GUI coordinates for popup box
var popup_x = display_get_gui_width() / 2 - 100;
var popup_y = display_get_gui_height() / 2 - 50;

// Draw the popup background
draw_set_color(c_white);
draw_rectangle(popup_x, popup_y, popup_x + 250, popup_y + 100, false);

// Draw the text
draw_set_color(c_black);
draw_text(popup_x + 20, popup_y + 20, "Advance to next week?");
draw_text(popup_x + 50, popup_y + 70, "[YES]");
draw_text(popup_x + 130, popup_y + 70, "[NO]");
