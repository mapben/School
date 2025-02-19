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

    // Optional: Automatically close after a few seconds
    box.alarm[0] = room_speed * 3; // 3 seconds
}
