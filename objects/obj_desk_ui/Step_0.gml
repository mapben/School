/// @description Insert description here
// You can write your code in this editor



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
var admissions_cost = 7500;

if (mouse_check_button_pressed(mb_left) &&
	mx > admissions_button_x && mx < admissions_button_x + 180 &&
    my > admissions_button_y && my < admissions_button_y + 40) {
    
    if (global.school_budget >= admissions_cost) {
        global.school_budget -= admissions_cost;
        obj_game_control.enroll_new_students();
		obj_game_control.calculate_weekly_income();
    } else {
		audio_play_sound(sound_error, 15, false);
        display_message("Not enough funds to host admissions!");
    }
}



var hire_faculty_button_x = display_get_gui_width() - 250;
var hire_faculty_button_y = display_get_gui_height() - 250;
var hire_faculty_cost = 3000;

if (mouse_check_button_pressed(mb_left) &&
	mx > hire_faculty_button_x && mx < hire_faculty_button_x + 180 &&
    my > hire_faculty_button_y && my < hire_faculty_button_y + 40) {
    
    if (global.school_budget >= hire_faculty_cost) {
        global.school_budget -= hire_faculty_cost;
        obj_game_control.add_faculty();
		obj_game_control.calculate_weekly_expenses();
    } else {
		audio_play_sound(sound_error, 15, false);
        display_message("Not enough funds to host admissions!");
    }
}
