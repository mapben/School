/// @description 114
// You can write your code in this editor
// Initialize Global Variables

randomise();

global.current_week = 1; // Tracks the current game week
global.school_budget = 50000; // Starting money for the school
global.weekly_income = 10000; // Revenue per week
global.weekly_expenses = 8000; // Base weekly expenses
global.special_event = ""; // Stores random events that occur
global.notification_list = []; // Stores game notifications
global.facilities = []; // Stores purchased facilities
global.overall_student_grade = "F"; // Default grade
global.facility_grade = "F"; // Default grade

global.dog_spawn_area = {
    x_min: 200,  // Left boundary
    x_max: 3800,  // Right boundary
    y_min: 200,  // Top boundary
    y_max: 3800   // Bottom boundary
};
global.spawned_dogs = []; // Stores active dog instances

draw_text(x, y, "Week: " + string(global.current_week));

function scr_spawn_dogs() {
    // Remove previously spawned dogs
    for (var i = 0; i < array_length(global.spawned_dogs); i++) {
        if (instance_exists(global.spawned_dogs[i])) {
            instance_destroy(global.spawned_dogs[i]);
        }
    }
    global.spawned_dogs = [];

    var student_count = array_length(global.students);
    
    for (var i = 0; i < student_count; i++) {
        var spawn_x = irandom_range(global.dog_spawn_area.x_min, global.dog_spawn_area.x_max);
        var spawn_y = irandom_range(global.dog_spawn_area.y_min, global.dog_spawn_area.y_max);
        
        var dog_type = global.students[i].type; // Retrieve stored type
        
        var new_dog = instance_create_layer(spawn_x, spawn_y, "Instances", dog_type);
        new_dog.dog_name = global.students[i].name; // Assign name to instance
        
        array_push(global.spawned_dogs, new_dog);
    }
}


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

global.available_dog_names = ["Buddy", "Max", "Charlie", "Bella", "Luna", "Rocky", "Daisy", "Milo", "Cooper", "Bailey", "Teddy", "Lucy", "Willow", "Bear"];

function add_student() {
    
    // Assign a random name
    var name_index = irandom(array_length(global.available_dog_names) - 1);
    var selected_name = global.available_dog_names[name_index];
    array_delete(global.available_dog_names, name_index, 1);

    // Assign a random type
    var dog_type = choose(obj_dog1, obj_dog2);

    // Create the student
    var student = {
        id: global.next_student_id,
        name: selected_name,
        grade: irandom_range(50, 100),
        happiness: irandom_range(60, 100),
        type: dog_type // Store the appearance type
    };
    
    array_push(global.students, student);
    global.next_student_id += 1;

    scr_spawn_dogs(); // Refresh campus visuals
}

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
        scr_spawn_dogs(); // Refresh campus visuals
    }
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


function calculate_overall_student_grade() {
    if (global.current_week mod 5 != 0 and global.current_week > 1) {
		return; // Only update on exam weeks
	}

    if (array_length(global.students) == 0) {
        global.overall_student_grade = "N/A";
        return;
    }
	
    var total_grades = 0;
    for (var i = 0; i < array_length(global.students); i++) {
        total_grades += global.students[i].grade;
    }

    var avg_grade = total_grades / array_length(global.students);

    if (avg_grade >= 90) global.overall_student_grade = "A";
    else if (avg_grade >= 80) global.overall_student_grade = "B";
    else if (avg_grade >= 70) global.overall_student_grade = "C";
    else if (avg_grade >= 60) global.overall_student_grade = "D";
    else global.overall_student_grade = "F";
}


// Add some initial students and faculty
for (var i = 0; i < 5; i++) add_student();
for (var j = 0; j < 2; j++) add_faculty();



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

function enroll_new_students() {
    var new_students = irandom_range(3, 6); // Random number of new dogs
    for (var i = 0; i < new_students; i++) {
        add_student();
    }
    show_message(string(new_students) + " new dogs have joined the school!");
}

function improve_happiness() {
    for (var i = 0; i < array_length(global.students); i++) {
        global.students[i].happiness += irandom_range(5, 15); // Happiness boost
        global.students[i].happiness = clamp(global.students[i].happiness, 0, 100);
    }
    
    for (var j = 0; j < array_length(global.faculty); j++) {
        global.faculty[j].happiness += irandom_range(5, 15); // Faculty also benefits
        global.faculty[j].happiness = clamp(global.faculty[j].happiness, 0, 100);
    }
}

global.tasks = [
    { name: "Enroll 5 Students", condition: function() { return array_length(global.students) >= 5; }, reward: 1000, completed: false },
    { name: "Reach a Facility Grade of B", condition: function() { return global.facility_grade == "B" || global.facility_grade == "A"; }, reward: 1500, completed: false },
    { name: "Hold 3 Exams", condition: function() { return global.current_week >= 15; }, reward: 500, completed: false }
];

global.task_notifications = []; // Stores active task updates
