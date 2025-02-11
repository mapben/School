/// @description Insert description here
// You can write your code in this editor

// Advance the week
global.current_week += 1;

// Update school budget (assuming tuition income and faculty salaries)
global.school_budget += global.weekly_income - global.weekly_expenses;

// Update each student's grade dynamically
for (var i = 0; i < array_length(global.students); i++) {
    global.students[i].grade += irandom_range(1, 3);
    global.students[i].grade = clamp(global.students[i].grade, 0, 100);
	global.students[i].happiness += irandom_range(-5, 3); // Slight mood changes
    global.students[i].happiness = clamp(global.students[i].happiness, 0, 100);
}

// Update each faculty member's satisfaction dynamically
for (var j = 0; j < array_length(global.faculty); j++) {
    if (global.weekly_income < global.weekly_expenses) {
        global.faculty[j].satisfaction -= irandom_range(1, 5);
    }
    global.faculty[j].satisfaction = clamp(global.faculty[j].satisfaction, 0, 100);
	global.faculty[j].happiness += irandom_range(-5, 3);
    global.faculty[j].happiness = clamp(global.faculty[j].happiness, 0, 100);
}