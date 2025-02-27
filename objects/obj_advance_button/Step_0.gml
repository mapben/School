/// @description Insert description here
// You can write your code in this editor
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var btn_x = display_get_gui_width() - 150;
var btn_y = display_get_gui_height() - 150;
var btn_width = 130;
var btn_height = 40;

// Detect if the player clicks the button
if (mouse_check_button_pressed(mb_left) &&
    mx > btn_x && mx < btn_x + btn_width &&
    my > btn_y && my < btn_y + btn_height) {
    
	instance_create_layer(x, y, "Instances", obj_advance_confirm_popup);
}
