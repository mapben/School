/// @description Insert description here
// You can write your code in this editor
global.awaiting_response = true; // Prevent other interactions
global.board_chair_sprite = instance_create_layer(display_get_gui_width() / 2, display_get_gui_height() / 2, "Instances", obj_chair);

// Request user input asynchronously (this waits for player response)
global.board_dialog_id = get_string_async("What would you do for the Chair? Option: 1. give a performance", "");