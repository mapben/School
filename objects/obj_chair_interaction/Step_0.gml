/// @description Insert description here
// You can write your code in this editor

// Navigate options
if (keyboard_check_pressed(vk_up)) {
    global.chair_selected = max(global.chair_selected - 1, 0);
}
if (keyboard_check_pressed(vk_down)) {
    global.chair_selected = min(global.chair_selected + 1, array_length(global.chair_options) - 1);
}

// Confirm selection
if (keyboard_check_pressed(vk_enter)) {
	global.event += 0.5;
	instance_destroy(obj_dialogue_box);
    instance_destroy(); // Close menu
}
