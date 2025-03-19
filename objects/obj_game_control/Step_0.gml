/// @description Insert description here
// You can write your code in this editor
for (var i = 0; i < array_length(global.tasks); i++) {
    if (!global.tasks[i].completed && global.tasks[i].condition()) {
		show_message("Congrats! You've finished a task for a reward of $"+ string(global.tasks[i].reward) + "!");
        global.tasks[i].completed = true;
        global.school_budget += global.tasks[i].reward; // Grant reward immediately
        array_push(global.task_notifications, "Task Complete: " + global.tasks[i].name + " (+$" + string(global.tasks[i].reward) + ")");
    }
}

// Limit notifications to recent 3 messages
if (array_length(global.task_notifications) > 3) {
    array_delete(global.task_notifications, 0, array_length(global.task_notifications) - 3);
}

if (global.interaction_cooldown > 0) {
    global.interaction_cooldown -= 1;
}

if (global.return_from_chair == true) {
	show_message("The board is satisfied and donated $50,000! Meanwhile, everyone is less happy and grades drop!")
	global.school_budget += 50000;
	apply_bad_event_impact();
	global.return_from_chair = false;
}