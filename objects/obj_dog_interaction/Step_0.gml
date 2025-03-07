/// @description Insert description here
// You can write your code in this editor
if (global.current_dog == noone) exit; // No interaction if not near a dog

// Navigate options
if (keyboard_check_pressed(vk_up)) {
    global.selected_option = max(global.selected_option - 1, 0);
}
if (keyboard_check_pressed(vk_down)) {
    global.selected_option = min(global.selected_option + 1, array_length(global.interaction_options) - 1);
}

// Confirm selection
if (keyboard_check_pressed(vk_enter)) {
    apply_dog_interaction(global.current_dog, global.selected_option);
	global.occupied = false;
	instance_destroy(obj_dialogue_box);
    instance_destroy(); // Close menu
}

// Cancel interaction
if (keyboard_check_pressed(vk_escape)) {
	global.occupied = false;
	instance_destroy(obj_dialogue_box);
    instance_destroy(); // Close menu without doing anything
}