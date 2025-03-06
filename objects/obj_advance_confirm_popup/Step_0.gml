/// @description Insert description here
// You can write your code in this editor
// Get GUI coordinates for popup box
var popup_x = display_get_gui_width() / 2 - 100;
var popup_y = display_get_gui_height() / 2 - 50;
var popup_w = 200;
var popup_h = 100;

// Get mouse position in GUI space
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Detect left-click
if (mouse_check_button_pressed(mb_left)) {

    // Clicked "YES"
    if (mx > popup_x + 50 && mx < popup_x + 90 && my > popup_y + 70 && my < popup_y + 90) {
        with (obj_game_control) event_user(0); // Advance the week
        instance_destroy(); // Close popup
    }

    // Clicked "NO"
    if (mx > popup_x + 130 && mx < popup_x + 170 && my > popup_y + 70 && my < popup_y + 90) {
        instance_destroy(); // Close popup without changing anything
    }

}

if (keyboard_check_pressed(ord("Y"))) {
    with (obj_game_control) event_user(0); // Calls the week advancement function
    instance_destroy(); // Closes the popup
}

if (keyboard_check_pressed(ord("N"))) {
    instance_destroy(); // Closes the popup without advancing
}
