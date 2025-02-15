/// @description 114
// You can write your code in this editor
// Initialize Global Variables
global.player_name = "";

global.current_week = 1; // Tracks the current game week
global.school_budget = 50000; // Starting money for the school
global.weekly_income = 10000; // Revenue per week
global.weekly_expenses = 8000; // Base weekly expenses
global.special_event = ""; // Stores random events that occur
global.notification_list = []; // Stores game notifications
global.facilities = []; // Stores purchased facilities
global.overall_student_grade = "F"; // Default grade
global.facility_grade = "F"; // Default grade

draw_text(x, y, "Week: " + string(global.current_week));

function array_average(arr) {
    var sum = 0;
    var len = array_length(arr);
    if (len == 0) return 0;
    for (var i = 0; i < len; i++) {
        sum += arr[i];
    }
    return sum / len;
}

global.students = []; // Stores student objects
global.faculty = [];  // Stores faculty objects
global.next_student_id = 1; // Unique ID for new students
global.next_faculty_id = 1;  // Unique ID for new faculty members

function add_student() {
    var student = {
        id: global.next_student_id,
        name: "Dog " + string(global.next_student_id),
        grade: irandom_range(50, 100),
        happiness: irandom_range(60, 100) // Happiness starts between 60-100
    };
    array_push(global.students, student);
    global.next_student_id += 1;
}

function add_faculty() {
    var faculty = {
        id: global.next_faculty_id,
        name: "Trainer " + string(global.next_faculty_id),
        happiness: irandom_range(60, 100) // Faculty happiness starts between 60-100
    };
    array_push(global.faculty, faculty);
    global.next_faculty_id += 1;
}


// Add some initial students and faculty
for (var i = 0; i < 10; i++) add_student();
for (var j = 0; j < 5; j++) add_faculty();


// Function to remove a student by ID
function remove_student(student_id) {
    var index = -1;
    for (var i = 0; i < array_length(global.students); i++) {
        if (global.students[i].id == student_id) {
            index = i;
            break;
        }
    }
    if (index != -1) {
        array_delete(global.students, index, 1);
    }
}

// Function to remove a faculty member by ID
function remove_faculty(faculty_id) {
    var index = -1;
    for (var j = 0; j < array_length(global.faculty); j++) {
        if (global.faculty[j].id == faculty_id) {
            index = j;
            break;
        }
    }
    if (index != -1) {
        array_delete(global.faculty, index, 1);
    }
}

function calculate_facility_grade() {
    var total_score = 0;

    // Assign a score for each facility type
    for (var i = 0; i < array_length(global.facilities); i++) {
        switch (global.facilities[i].type) {
            case "classroom": total_score += 3; break;
            case "gym": total_score += 4; break;
            case "vet_clinic": total_score += 5; break;
            case "playground": total_score += 2; break;
            case "swimming_pool": total_score += 4; break;
            default: total_score += 1; break;
        }
    }

    // Convert score into a letter grade
    if (total_score >= 20) global.facility_grade = "A";
    else if (total_score >= 15) global.facility_grade = "B";
    else if (total_score >= 10) global.facility_grade = "C";
    else if (total_score >= 5) global.facility_grade = "D";
    else global.facility_grade = "F";
}

function calculate_overall_student_grade() {
    if (array_length(global.students) == 0) {
        global.overall_student_grade = "N/A"; // No students
        return;
    }

    var total_grades = 0;
    for (var i = 0; i < array_length(global.students); i++) {
        total_grades += global.students[i].grade;
    }

    var avg_grade = total_grades / array_length(global.students);

    // Convert to a letter grade
    if (avg_grade >= 90) global.overall_student_grade = "A";
    else if (avg_grade >= 80) global.overall_student_grade = "B";
    else if (avg_grade >= 70) global.overall_student_grade = "C";
    else if (avg_grade >= 60) global.overall_student_grade = "D";
    else global.overall_student_grade = "F";
}

calculate_overall_student_grade();
