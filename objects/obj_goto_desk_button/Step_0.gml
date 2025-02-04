/// @description Insert description here
// You can write your code in this editor
var btn_x = display_get_gui_width() - 180;
var btn_y = display_get_gui_height() - 80;
var btn_w = 150;
var btn_h = 50;

if (mouse_check_button_pressed(mb_left)) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    if (mx > btn_x && mx < btn_x + btn_w && my > btn_y && my < btn_y + btn_h) {
        room_goto(rm_desk);
    }
}
