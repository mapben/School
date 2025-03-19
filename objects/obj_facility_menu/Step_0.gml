/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
// Get GUI coordinates for popup box
var menu_x = display_get_gui_width() / 2 - 100;
var menu_y = display_get_gui_height() / 2 - 50;
var menu_w = 200;
var menu_h = 100;

// Get mouse position in GUI space
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Detect left-click
if (mouse_check_button_pressed(mb_left)) {
    // Clicked "YES"
    if (mx > menu_x + 50 && mx < menu_x + 90 && my > menu_y + 70 && my < menu_y + 90) {
        if(global.school_budget < global.current_price) {
			audio_play_sound(sound_error, 10, false);
			show_message("Not enough money!");
		}
		else {
			for (var i = 0; i < instance_number(obj_par_environment); i++) {
				var cur_facility = instance_find(obj_par_environment, i);
				if(cur_facility.x == global.build_x and cur_facility.y == global.build_y) {
					cur_facility.draw_alpha = 1;
				}
			}
            global.school_budget -= global.current_price;
			var new_facility = {
			    x: global.build_x,
			    y: global.build_y,
			    type: global.build_object
			};
			array_push(global.facilities, new_facility);
			obj_game_control.calculate_facility_grade();
			instance_destroy();
			global.occupied = false;
		}
    }

    // Clicked "NO"
    if (mx > menu_x + 130 && mx < menu_x + 170 && my > menu_y + 70 && my < menu_y + 90) {
		global.occupied = false;
        instance_destroy(); // Close popup without changing anything
    }
}

if (keyboard_check_pressed(ord("Y"))) {
	for (var i = 0; i < instance_number(obj_par_environment); i++) {
		var cur_facility = instance_find(obj_par_environment, i);
		if(cur_facility.x == global.build_x and cur_facility.y == global.build_y) {
			cur_facility.draw_alpha = 1;
		}
	}
    global.school_budget -= global.current_price;
	var new_facility = {
		x: global.build_x,
		y: global.build_y,
		type: global.build_object
	};
	array_push(global.facilities, new_facility);
	obj_game_control.calculate_facility_grade();
	instance_destroy();
	global.occupied = false;
}
if (keyboard_check_pressed(ord("N"))) {
	global.occupied = false;
    instance_destroy(); // Close popup without changing anything
}