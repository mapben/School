/// @description Insert description here
// You can write your code in this editor
draw_text(50, 50, "Week: " + string(global.current_week));
draw_text(50, 80, "School Budget: $" + string(global.school_budget));

// Display students
var y_offset = 120;
draw_text(50, y_offset, "Students:");
for (var i = 0; i < array_length(global.students); i++) {
    draw_text(50, y_offset + (i * 20), global.students[i].name + " - Grade: " + string(global.students[i].grade));
}

y_offset += array_length(global.students) * 20 + 20; // Adjust spacing

// Display faculty
draw_text(50, y_offset, "Faculty:");
for (var j = 0; j < array_length(global.faculty); j++) {
    draw_text(50, y_offset + 20 + (j * 20), global.faculty[j].name + " - Satisfaction: " + string(global.faculty[j].satisfaction));
}
