/// @description Insert description here
// You can write your code in this editor
if (keyboard_lastkey > 31 && keyboard_lastkey < 127) { // Only allow readable characters
    if (string_length(global.player_name) < max_length) {
        global.player_name += chr(keyboard_lastkey);
    }
}

if (keyboard_lastkey == vk_backspace && string_length(global.player_name) > 0) {
    global.player_name = string_delete(global.player_name, string_length(global.player_name), 1);
}

if(keyboard_lastkey == 13) {
	if (string_length(global.player_name) > 0) {
		room_goto(rm_school); // Start the game
	} 
	else {
		show_message("Please enter a name!");
	}
}