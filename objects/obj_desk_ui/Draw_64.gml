var panel_x = 30;
var panel_y = 30;
var panel_width = 400;
var panel_height = 300;

// Draw Panel Background
draw_set_color(make_color_rgb(230, 230, 230));
draw_rectangle(panel_x, panel_y, panel_x + panel_width, panel_y + panel_height, false);

// Title Bar
draw_set_color(make_color_rgb(50, 50, 50));
draw_rectangle(panel_x, panel_y, panel_x + panel_width, panel_y + 40, false);
draw_set_color(c_white);
draw_text(panel_x + 10, panel_y + 10, "Principal's Desk");

// School Information
draw_set_color(c_black);
draw_text(panel_x + 10, panel_y + 60, "School Facility Grade: " + global.facility_grade);
draw_text(panel_x + 10, panel_y + 90, "Overall Student Grade: " + global.overall_student_grade);
draw_text(panel_x + 10, panel_y + 120, "School Budget: $" + string(global.school_budget));

// Student Drop-Down Toggle
draw_set_color(c_black);
draw_text(panel_x + 10, panel_y + 160, "Students [expand]");

// Faculty Drop-Down Toggle
draw_text(panel_x + 10, panel_y + 190, "Faculty [expand]");


// If students list is expanded, show all students
var y_offset = 180;
if (global.show_students) {
    for (var i = 0; i < array_length(global.students); i++) {
        y_offset += 20;
        draw_text(panel_x + 180, y_offset, global.students[i].name + " - Grade: " + string(global.students[i].grade) + 
                  " - Happiness: " + string(global.students[i].happiness) + "%");
    }
}

// If faculty list is expanded, show all faculty members
if (global.show_faculty) {
    y_offset += 30; // Add spacing
    for (var j = 0; j < array_length(global.faculty); j++) {
        y_offset += 20;
        draw_text(panel_x + 180, y_offset, global.faculty[j].name + " - Happiness: " + string(global.faculty[j].happiness) + 
                  " - Happiness: " + string(global.faculty[j].happiness) + "%");
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
