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


// Calculate Weekly Income & Expenses
global.weekly_income = array_length(global.students) * global.student_tuition;
global.weekly_expense = global.faculty_salaries + (array_length(global.facilities) * 500); // More facilities = more costs

global.school_budget += global.weekly_income - global.weekly_expense; // Update budget

// Show financial summary
var finance_summary = "Weekly Report:\n" +
                      "Tuition Income: $" + string(global.weekly_income) + "\n" +
                      "Total Expenses: $" + string(global.weekly_expense) + "\n" +
                      "Remaining Budget: $" + string(global.school_budget);
show_message(finance_summary);

// Trigger a warning if budget is below $2000 but still positive
if (global.school_budget > 0 && global.school_budget < 2000) {
    show_message("Warning! The school is running low on funds. Consider improving grades to increase tuition!");
}

// If the budget is negative, trigger game over
if (global.school_budget < 0) {
    show_message("The school has gone bankrupt! Game Over.");
    game_end(); // Ends the game
}

if (irandom(100) < 20) { 
    show_board_chair_event();
}

if (irandom(100) < 15) { // 15% chance per week
    var expense_amount = irandom_range(500, 3000);
    global.school_budget -= expense_amount;
    show_message("Something broke! The school had to pay $" + string(expense_amount) + " for emergency repairs!");
}


function update_faculty_retention() {
    var avg_faculty_happiness = 0;
    
    if (array_length(global.faculty) > 0) {
        for (var i = 0; i < array_length(global.faculty); i++) {
            avg_faculty_happiness += global.faculty[i].happiness;
        }
        avg_faculty_happiness /= array_length(global.faculty);
    }

    // If faculty happiness is low, some may quit
    if (avg_faculty_happiness < 40 && array_length(global.faculty) > 0) {
        var faculty_leaving = irandom_range(1, 2);
        for (var i = 0; i < faculty_leaving; i++) {
            remove_faculty(global.faculty[0].id);
        }
        show_message("Some faculty members have resigned due to low morale!");
    }

    // If happiness is high, faculty stays, and new members join
    if (avg_faculty_happiness > 80) {
        add_faculty();
        show_message("A new faculty member has joined due to positive work conditions!");
    }
}

function calculate_weekly_income() {
    var avg_student_happiness = 0;
    
    if (array_length(global.students) > 0) {
        for (var i = 0; i < array_length(global.students); i++) {
            avg_student_happiness += global.students[i].happiness;
        }
        avg_student_happiness /= array_length(global.students);
    }

    // Reduce tuition based on happiness more aggressively
    var tuition_modifier = (avg_student_happiness - 50) / 5; // More severe drop-off if students are unhappy
    global.student_tuition = max(400, 1000 + (1000 * (tuition_modifier / 100))); // Lower base tuition

    global.weekly_income = array_length(global.students) * global.student_tuition;
}


function calculate_weekly_expenses() {
    var avg_faculty_happiness = 0;
    
    if (array_length(global.faculty) > 0) {
        for (var i = 0; i < array_length(global.faculty); i++) {
            avg_faculty_happiness += global.faculty[i].happiness;
        }
        avg_faculty_happiness /= array_length(global.faculty);
    }

    // Increased faculty salary scaling
    var salary_modifier = (80 - avg_faculty_happiness) / 5; // More severe impact of low happiness
    global.faculty_salaries = max(4000, 5000 + (5000 * (salary_modifier / 100))); // Base salary increased

    // Increased facility maintenance costs
    global.weekly_expense = global.faculty_salaries + (array_length(global.facilities) * 1200); // More expensive to maintain
}


calculate_weekly_income();
calculate_weekly_expenses();
update_faculty_retention();
