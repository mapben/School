/// @description Insert description here
// You can write your code in this editor

// Advance the week
global.current_week += 1;

if (global.current_week mod 5 == 0) {
    for (var i = 0; i < array_length(global.students); i++) {
        var happiness_factor = (global.students[i].happiness + array_length(global.faculty) * 3 - 50) / 5;
        
        // Reduce grades significantly for unhappy students
        var grade_change = irandom_range(-10, 10) + round(happiness_factor * 2);
        global.students[i].grade += grade_change;
        global.students[i].grade = clamp(global.students[i].grade, 0, 100);
    }

    show_message("Exams were held! Student grades have been updated.");
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
    var grade_effect = 0;
    // Apply happiness changes based on grade performance
    if (global.students[i].grade >= 90) {
        grade_effect = 5; // High grades = extra happiness boost
    } else if (global.students[i].grade >= 70) {
        grade_effect = 3; // Decent grades = slight boost
    } else if (global.students[i].grade < 60) {
        grade_effect = -3; // Low grades = loss in happiness
    } else if (global.students[i].grade < 40) {
        grade_effect = -5; // Very poor grades = severe happiness drop
	}
    // Apply grade-based happiness effect
    global.students[i].happiness += grade_effect;
	global.students[i].happiness = clamp(global.students[i].happiness, 0, 100);
}


global.school_budget += global.weekly_income - global.weekly_expense; // Update budget

// Show financial summary
var finance_summary = "Weekly Report:\n" +
                      "Tuition Income: $" + string(global.weekly_income) + "\n" +
                      "Total Expenses: $" + string(global.weekly_expense) + "\n" +
                      "Remaining Budget: $" + string(global.school_budget);

display_message(finance_summary);

// Trigger a warning if budget is below $2000 but still positive
if (global.school_budget > 0 && global.school_budget < 2000) {
    show_message("Warning! The school is running low on funds. Consider improving grades to increase tuition!");
}

// If the budget is negative, trigger game over
if (global.school_budget < 0) {
    show_message("The school has gone bankrupt! Game Over.");
    game_end(); // Ends the game
}

if (irandom(100) < 5) {
    var expense_amount = irandom_range(500, 3000);
    global.school_budget -= expense_amount;
	show_message("A student broke something! The school has to pay $" + string(expense_amount) + " for repairs!");
}

calculate_weekly_income();
calculate_weekly_expenses();
apply_faculty_impact();
check_student_dropout();

var chair_happened = false;

if (irandom(100) < 5) { 
    show_board_chair_event();
	chair_happened = true;
}

if (irandom(100) < 5 and chair_happened == false) {
    assign_co_principal();
}

// Update UI immediately after calculations
if(room == rm_desk) 
{
	instance_destroy(obj_desk_ui);
	instance_create_layer(0, 0, "Instances", obj_desk_ui);
}