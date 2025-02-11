/// @description Insert description here
// You can write your code in this editor

// Advance the week
global.current_week += 1;

// Update school budget (assuming tuition income and faculty salaries)
global.school_budget += global.weekly_income - global.weekly_expenses;

// Improve student grades slightly each week
for (var i = 0; i < array_length(global.students); i++) {
    global.students[i].grade += irandom_range(1, 3);
    global.students[i].grade = clamp(global.students[i].grade, 0, 100);
}

// Recalculate overall student grade
calculate_overall_student_grade();

// Recalculate facility grade every week
calculate_facility_grade();

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

