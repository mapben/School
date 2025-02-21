/// @description Insert description here
// You can write your code in this editor
var panel_x = display_get_gui_width() - 400;
var panel_y = 30;
var panel_width = 400;
var panel_height = 250;

// Draw panel background
draw_set_alpha(0.6); // Set transparency (0 = fully transparent, 1 = fully opaque)
draw_set_color(make_color_rgb(50, 50, 50));
draw_rectangle(panel_x, panel_y, panel_x + panel_width, panel_y + panel_height, false);
draw_set_alpha(1); // Reset transparency

// Draw task list title
draw_set_color(c_white);
draw_text(panel_x + 10, panel_y + 10, "Active Tasks:");

// Display incomplete tasks
var y_offset = panel_y + 30;
for (var i = 0; i < array_length(global.tasks); i++) {
    if (!global.tasks[i].completed) {
        draw_text(panel_x + 10, y_offset, "- " + global.tasks[i].name);
        y_offset += 20;
    }
}

// Show completed task notifications
draw_text(panel_x + 10, panel_y + panel_height - 100, "Notifications:");
for (var j = 0; j < array_length(global.task_notifications); j++) {
    draw_text(panel_x + 10, panel_y + panel_height - 85 + (j * 15), global.task_notifications[j]);
}
