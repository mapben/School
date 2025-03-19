/// @description Insert description here
// You can write your code in this editor


if(global.school_budget == 41000)
	show_debug_message("ok");

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

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



var admissions_button_x = display_get_gui_width() - 250;
var admissions_button_y = display_get_gui_height() - 200;
var admissions_cost = 10000;

var hire_faculty_button_x = display_get_gui_width() - 250;
var hire_faculty_button_y = display_get_gui_height() - 250;
var hire_faculty_cost = 3000;


if (mouse_check_button_pressed(mb_left) &&
	mx > admissions_button_x && mx < admissions_button_x + 180 &&
    my > admissions_button_y && my < admissions_button_y + 40) {
    
    if (global.school_budget >= admissions_cost) {
        global.school_budget -= admissions_cost;
        obj_game_control.enroll_new_students();
		obj_game_control.calculate_weekly_income();
    } else {
		audio_play_sound(sound_error, 15, false);
        show_message("Not enough funds to host admissions!");
    }
}
else if (mouse_check_button_pressed(mb_left) &&
	mx > hire_faculty_button_x && mx < hire_faculty_button_x + 180 &&
    my > hire_faculty_button_y && my < hire_faculty_button_y + 40) {
    
    if (global.school_budget >= hire_faculty_cost) {
        global.school_budget -= hire_faculty_cost;
        obj_game_control.add_faculty();
		obj_game_control.calculate_weekly_expenses();
    } else {
		audio_play_sound(sound_error, 15, false);
        show_message("Not enough funds to host admissions!");
    }
}



if (keyboard_check_pressed(vk_up) || mouse_wheel_up()) {
    scroll_offset = max(scroll_offset - 1, 0);
}

if (keyboard_check_pressed(vk_down) || mouse_wheel_down()) {
    scroll_offset = min(scroll_offset + 1, max(0, array_length(global.students) - max_visible_entries));
}

if(global.school_budget == 40000)
	show_debug_message("ok");

