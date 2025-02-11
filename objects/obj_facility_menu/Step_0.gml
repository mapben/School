/// @description Insert description here
// You can write your code in this editor
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var menu_x = display_get_gui_width() / 2 - 100;
var menu_y = display_get_gui_height() / 2 - 75;

if (mouse_check_button_pressed(mb_left)) {
    if (mx > menu_x + 40 && mx < menu_x + 160) {
        if (my > menu_y + 50 && my < menu_y + 70 && global.school_budget >= 20000) {
            instance_create_layer(global.build_x, global.build_y, "Instances", obj_new_building);
            global.school_budget -= 20000;
			var new_facility = { type: "classroom" };
			array_push(global.facilities, new_facility);
			calculate_facility_grade();
			instance_create_layer(x, y, "Instances", obj_new_building);
			instance_destroy();

        }
        if (my > menu_y + 80 && my < menu_y + 100 && global.school_budget >= 30000) {
            instance_create_layer(global.build_x, global.build_y, "Instances", obj_new_building);
            global.school_budget -= 30000;
			var new_facility = { type: "gym" };
			array_push(global.facilities, new_facility);
			calculate_facility_grade();
			instance_create_layer(x, y, "Instances", obj_new_building);
			instance_destroy();
        }
        if (my > menu_y + 110 && my < menu_y + 130) {
            instance_destroy(); // Cancel
        }
    }
}
