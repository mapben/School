/// @description Insert description here
// You can write your code in this editor
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var menu_x = display_get_gui_width() / 2 - 100;
var menu_y = display_get_gui_height() / 2 - 75;

if (mouse_check_button_pressed(mb_left)) {
    if (mx > menu_x + 40 && mx < menu_x + 160) {
        if (my > menu_y + 50 && my < menu_y + 70 && global.school_budget >= 500 && !array_contains(global.facilities, "ping pong table")) {
            instance_create_layer(global.build_x, global.build_y, "Instances", obj_ping_pong_table);
            global.school_budget -= 500;
			var new_facility = { type: "ping pong table" };
			array_push(global.facilities, new_facility);
			obj_game_control.calculate_facility_grade();
			instance_destroy();
			global.occupied = false;
        }
        if (my > menu_y + 80 && my < menu_y + 100 && global.school_budget >= 1500 && !array_contains(global.facilities, "piano")) {
            instance_create_layer(global.build_x, global.build_y, "Instances", obj_piano);
            global.school_budget -= 1500;
			var new_facility = { type: "piano" };
			array_push(global.facilities, new_facility);
			obj_game_control.calculate_facility_grade();
			instance_destroy();
			global.occupied = false;
        }
		if (my > menu_y + 110 && my < menu_y + 130 && global.school_budget >= 10000 && !array_contains(global.facilities, "soccer field")) {
            instance_create_layer(global.build_x, global.build_y, "Instances", obj_soccer_field);
            global.school_budget -= 10000;
			var new_facility = { type: "soccer field" };
			array_push(global.facilities, new_facility);
			obj_game_control.calculate_facility_grade();
			instance_destroy();
			global.occupied = false;
        }
		if (my > menu_y + 140 && my < menu_y + 160 && global.school_budget >= 30000 && !array_contains(global.facilities, "swimming pool")) {
            instance_create_layer(global.build_x, global.build_y, "Instances", obj_swimming_pool);
            global.school_budget -= 30000;
			var new_facility = { type: "swimming pool" };
			array_push(global.facilities, new_facility);
			obj_game_control.calculate_facility_grade();
			instance_destroy();
			global.occupied = false;
        }
		if (my > menu_y + 170 && my < menu_y + 190 && global.school_budget >= 50000 && !array_contains(global.facilities, "gym")) {
            instance_create_layer(global.build_x, global.build_y, "Instances", obj_new_building);
            global.school_budget -= 50000;
			var new_facility = { type: "gym" };
			array_push(global.facilities, new_facility);
			obj_game_control.calculate_facility_grade();
			instance_destroy();
			global.occupied = false;
        }
		
        if (my > menu_y + 200 && my < menu_y + 230) {
            instance_create_layer(global.build_x, global.build_y, "Instances", obj_empty_land);
            instance_destroy();
			global.occupied = false;
        }
    }
}
