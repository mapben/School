/// @description Insert description here
// You can write your code in this editor
var menu_x = display_get_gui_width() / 2 - 150;
var menu_y = display_get_gui_height() / 2 - 100;
var menu_width = 300;
var menu_height = 200; // Increased height for explanation text
var chair_options = ["Yes", "YESSSSSS!!!"]

// Draw background
draw_set_color(make_color_rgb(50, 50, 50));
draw_rectangle(menu_x, menu_y, menu_x + menu_width, menu_y + menu_height, false);

// Draw explanation text
draw_set_color(c_white);
draw_text(menu_x + 20, menu_y + 10, "Will you do a performance for the chair?");

// Display options
for (var i = 0; i < array_length(chair_options); i++) {
    draw_set_color(c_white);
    
    if (i == global.selected_option) {
        draw_set_color(make_color_rgb(255, 200, 0)); // Highlight selected option
    }

    draw_text(menu_x + 20, menu_y + 30 + (i * 20), chair_options[i]);
}

