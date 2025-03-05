var panel_x = 120;
var panel_y = 120;
var panel_width = 400;
var panel_height = 250 + (array_length(global.students) + array_length(global.faculty)) * 20; // Dynamic height

// Display key stats
draw_set_color(c_white);
draw_text(panel_x + 10, panel_y + 10, "Week: " + string(global.current_week));
draw_text(panel_x + 10, panel_y + 30, "Overall Student Grade: " + global.overall_student_grade);
draw_text(panel_x + 10, panel_y + 50, "Facility Grade: " + global.facility_grade);
draw_text(panel_x + 10, panel_y + 70, "Budget: $" + string(global.school_budget));
draw_text(panel_x + 10, panel_y + 90, "Weekly Income: $" + string(global.weekly_income));
draw_text(panel_x + 10, panel_y + 110, "Weekly Expenses: $" + string(global.weekly_expense));

draw_text(panel_x + 10, panel_y + 140, "Dropout & Resignation Risks:");

// Display each student’s dropout probability
var y_offset = panel_y + 160;
var dropout_threshold = 60;
for (var i = 0; i < array_length(global.students); i++) {
    var student = global.students[i];
    var dropout_chance = 0;

    if (student.happiness < dropout_threshold) {
        dropout_chance = (dropout_threshold - student.happiness) * 2;
    }

    var dropout_text = student.name + " - Happiness: " + string(student.happiness) + "% - Dropout Chance: " + string(dropout_chance) + "%";
    draw_text(panel_x + 10, y_offset, dropout_text);
    y_offset += 20;
}

// Display each faculty’s resignation probability
for (var j = 0; j < array_length(global.faculty); j++) {
    var faculty = global.faculty[j];
    var quit_chance = 0;

    if (faculty.happiness < dropout_threshold) {
        quit_chance = (dropout_threshold - faculty.happiness) * 2;
    }

    var faculty_text = faculty.name + " - Happiness: " + string(faculty.happiness) + "% - Quit Chance: " + string(quit_chance) + "%";
    draw_text(panel_x + 10, y_offset, faculty_text);
    y_offset += 20;
}


// Draw the "Return to Campus" button
var btn_x = 150;
var btn_y = display_get_gui_height() - 50;
var btn_width = 200;
var btn_height = 40;

draw_set_color(make_color_rgb(100, 100, 255)); // Blue button
draw_rectangle(btn_x, btn_y, btn_x + btn_width, btn_y + btn_height, false);

draw_set_color(c_white);
draw_text(btn_x + 25, btn_y + 13, "Return to Campus");

draw_text(-50, -30, "Principal: " + global.player_name);

draw_set_color(c_white);
var weeks_until_exam = 5 - (global.current_week mod 5);
var weeks_until_break = 10 - (global.current_week mod 10);
var weeks_until_admissions = 20 - (global.current_week mod 20);

draw_text(400, 120, "Next Exam in: " + string(weeks_until_exam) + " weeks");
draw_text(400, 140, "Next Break in: " + string(weeks_until_break) + " weeks");
draw_text(400, 160, "Next Admissions Week in: " + string(weeks_until_admissions) + " weeks");
