/// @description Insert description here
// You can write your code in this editor
draw_text(50, 50, "Week: " + string(global.current_week));
draw_text(50, 80, "School Budget: $" + string(global.school_budget));
draw_text(50, 110, "School Facility Grade: " + global.facility_grade);

// Display students (dogs)
var y_offset = 120;
draw_text(50, y_offset, "Dogs (Students):");
for (var i = 0; i < array_length(global.students); i++) {
    draw_text(50, y_offset + (i * 20), global.students[i].name + " - Grade: " + string(global.students[i].grade) +
              " - Happiness: " + string(global.students[i].happiness));
}

y_offset += array_length(global.students) * 20 + 20; 

// Display faculty (trainers)
draw_text(50, y_offset, "Trainers (Faculty):");
for (var j = 0; j < array_length(global.faculty); j++) {
    draw_text(50, y_offset + 20 + (j * 20), global.faculty[j].name +
              " - Happiness: " + string(global.faculty[j].happiness));
}
