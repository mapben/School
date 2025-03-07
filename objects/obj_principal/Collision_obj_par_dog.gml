/// @description Insert description here
// You can write your code in this editor
// Check if a dialogue box already exists
if (!instance_exists(obj_dialogue_box)) {
    var dialogue = [
        "Woof! Principal, can we have more treats?",
        "Woof! I'm studying hard!",
        "Woof! Do you think I'll pass the next exam?",
        "Woof! This school sucks!",
        "Woof! Can we have better facilities?"
    ];

    // Create the dialogue box
    var box = instance_create_layer(x, y - 40, "Instances", obj_dialogue_box);
	randomDialogue = irandom(array_length(dialogue)-1);
    box.message = dialogue[randomDialogue]; // Random message
	
	var dogSound = [sound_dog_1, sound_dog_2, sound_dog_3, sound_dog_4]
	randomSound = irandom(array_length(dogSound)-1);
	audio_play_sound(dogSound[randomSound], 10, false);
	
    instance_create_layer(display_get_gui_width() / 2, display_get_gui_height() / 2, "Instances", obj_dog_interaction);
	global.current_dog = other; // Store the dog being interacted with
}
