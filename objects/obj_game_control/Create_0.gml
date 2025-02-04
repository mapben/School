/// @description Insert description here
// You can write your code in this editor
// Initialize Global Variables
global.current_week = 1; // Tracks the current game week
global.school_budget = 50000; // Starting money for the school
global.weekly_income = 10000; // Revenue per week
global.weekly_expenses = 8000; // Base weekly expenses
global.special_event = ""; // Stores random events that occur
global.notification_list = []; // Stores game notifications

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

// Function to add a student
function add_student() {
    var student = {
        id: global.next_student_id,
        name: "Student " + string(global.next_student_id),
        grade: irandom_range(50, 100)
    };
    array_push(global.students, student);
    global.next_student_id += 1;
}

// Function to add a faculty member
function add_faculty() {
    var faculty = {
        id: global.next_faculty_id,
        name: "Faculty " + string(global.next_faculty_id),
        satisfaction: irandom_range(60, 100)
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

