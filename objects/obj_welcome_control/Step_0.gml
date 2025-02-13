/// @description Insert description here
// You can write your code in this editor
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var btn_x = display_get_gui_width()/2 - 50;
var btn_y = display_get_gui_height()/2 + 30;
var btn_width = 100;
var btn_height = 40;

// Detect button click
if (mouse_check_button_pressed(mb_left) &&
    mx > btn_x && mx < btn_x + btn_width &&
    my > btn_y && my < btn_y + btn_height) {
    
    if (string_length(global.player_name) > 0) {
        room_goto(rm_campus); // Start the game
    } else {
        show_message("Please enter a name!");
    }
}
