/// @description Insert description here
// You can write your code in this editor

// Advance the week
global.current_week += 1;

// Exams take place every 5 weeks
if (global.current_week mod 5 == 0) {
    for (var i = 0; i < array_length(global.students); i++) {
        var happiness_factor = (global.students[i].happiness - 50) / 10;
        var grade_change = irandom_range(-5, 10) + round(happiness_factor);
        global.students[i].grade += grade_change;
        global.students[i].grade = clamp(global.students[i].grade, 0, 100);
    }
    show_message("Exams were held this week! Student grades have been updated.");
    calculate_overall_student_grade();
}

// Break happens after every two exams (every 10 weeks)
if (global.current_week mod 10 == 0) {
    show_message("It's break week! Everyone is happier.");
    improve_happiness();
    scr_spawn_dogs(); // Ensure campus is empty during break
} else {
    scr_spawn_dogs(); // Re-spawn dogs when break ends
}

// Admissions Week happens every 20 weeks (New students join, but no one graduates)
if (global.current_week mod 20 == 0) {
    show_message("Admissions Week! New students are enrolling.");
    enroll_new_students();
}


// Happiness modifiers based on facility grade
var happiness_boost = 0;
switch (global.facility_grade) {
    case "A": happiness_boost = 5; break;
    case "B": happiness_boost = 3; break;
    case "C": happiness_boost = 1; break;
    case "D": happiness_boost = -2; break;
    case "F": happiness_boost = -5; break;
}

// Update student happiness
for (var i = 0; i < array_length(global.students); i++) {
    global.students[i].happiness += happiness_boost + irandom_range(-5, 5); // Random fluctuation
    global.students[i].happiness = clamp(global.students[i].happiness, 0, 100);
}

// Update faculty happiness
for (var j = 0; j < array_length(global.faculty); j++) {
    global.faculty[j].happiness += happiness_boost + irandom_range(-5, 5);
    global.faculty[j].happiness = clamp(global.faculty[j].happiness, 0, 100);
}

