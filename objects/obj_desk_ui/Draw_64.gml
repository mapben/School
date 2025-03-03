var panel_x = 150;
var panel_y = 100;
var panel_width = 400;
var panel_height = 300;

// School Information
draw_set_color(c_white);
draw_text(panel_x - 20, panel_y + 30, "Overall Student Grade: " + global.overall_student_grade);
draw_text(panel_x - 20, panel_y + 60, "School Facility Grade: " + global.facility_grade);
draw_text(panel_x - 20, panel_y + 90, "School Budget: $" + string(global.school_budget));
draw_text(panel_x - 20, panel_y + 120, "Weekly Income: $" + string(global.weekly_income));
draw_text(panel_x - 20, panel_y + 150, "Weekly Expenses: $" + string(global.weekly_expense));
draw_text(panel_x - 20, panel_y + 180, "Tuition per Student: $" + string(global.student_tuition));
draw_text(panel_x - 20, panel_y + 210, "Faculty Salaries: $" + string(global.faculty_salaries));
draw_text(panel_x - 20, panel_y + 240, "Maintenance Costs: $" + string(array_length(global.facilities) * 1200));


// Student Drop-Down Toggle
draw_set_color(c_white);
draw_text(panel_x - 20, panel_y + 280, "Students [expand]");

// Faculty Drop-Down Toggle
draw_text(panel_x - 20, panel_y + 310, "Faculty [expand]");


// If students list is expanded, show all students
var y_offset = 250;
if (global.show_students) {
    for (var i = 0; i < array_length(global.students); i++) {
        y_offset += 20;
        draw_text(panel_x + 250, y_offset, global.students[i].name + " - Grade: " + string(global.students[i].grade) + 
                  " - Happiness: " + string(global.students[i].happiness) + "%");
    }
}

// If faculty list is expanded, show all faculty members
if (global.show_faculty) {
    y_offset += 30; // Add spacing
    for (var j = 0; j < array_length(global.faculty); j++) {
        y_offset += 20;
        draw_text(panel_x + 250, y_offset, global.faculty[j].name + " - Happiness: " + string(global.faculty[j].happiness) + "%");
    }
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
