/// @description Insert description here
// You can write your code in this editor
var panel_x = 20;
var panel_y = 20;
var panel_width = 250;
var panel_height = 120; // Increased height to fit the week info

// Draw semi-transparent background
draw_set_alpha(0.6);
draw_set_color(make_color_rgb(50, 50, 50));
draw_rectangle(panel_x, panel_y, panel_x + panel_width, panel_y + panel_height, false);
draw_set_alpha(1);

// Display stats
draw_set_color(c_white);
draw_text(panel_x + 10, panel_y + 10, "Current Week: " + string(global.current_week));
draw_text(panel_x + 10, panel_y + 30, "Student Grade: " + global.overall_student_grade);
draw_text(panel_x + 10, panel_y + 50, "Facility Grade: " + global.facility_grade);
draw_text(panel_x + 10, panel_y + 70, "Budget: $" + string(global.school_budget));
