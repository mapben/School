/// @description Insert description here
// You can write your code in this editor
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var panel_x = 30;
var panel_y = 30;

// Detect clicks on the student drop-down
if (mouse_check_button_pressed(mb_left) && mx > panel_x + 10 && mx < panel_x + 200 && my > panel_y + 160 && my < panel_y + 180) {
    global.show_students = !global.show_students; // Toggle
}

// Detect clicks on the faculty drop-down
if (mouse_check_button_pressed(mb_left) && mx > panel_x + 10 && mx < panel_x + 200 && my > panel_y + 190 && my < panel_y + 210) {
    global.show_faculty = !global.show_faculty; // Toggle
}

var btn_x = 150;
var btn_y = display_get_gui_height() - 50;
var btn_width = 200;
var btn_height = 40;

// Detect if the player clicks the button
if (mouse_check_button_pressed(mb_left) &&
    mx > btn_x && mx < btn_x + btn_width &&
    my > btn_y && my < btn_y + btn_height) {
    
    room_goto(rm_school); // Switch back to the campus room
}
