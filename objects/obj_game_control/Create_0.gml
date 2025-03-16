/// @description 114
// You can write your code in this editor
// Initialize Global Variables

randomise();

global.current_week = 1; // Tracks the current game week
global.school_budget = 50000;
global.weekly_expense = 5000; // Base expense per week
global.student_tuition = 1000; // Earnings per studentglobal.tuition_per_student = 1000; // Fixed tuition fee per student
global.faculty_salary = 3000;      // Fixed salary per faculty member
global.maintenance_per_facility = 1200; // Fixed maintenance fee per facility
global.special_event = ""; // Stores random events that occur
global.notification_list = []; // Stores game notifications
global.facilities = []; // Stores purchased facilities
global.overall_student_grade = "F"; // Default grade
global.facility_grade = "F"; // Default grade

global.board_chair_response_given = true;
global.interaction_cooldown = 0; // Starts at 0, allowing interactions immediately


global.dog_spawn_area = {
    x_min: 500,  // Left boundary
    x_max: 3500,  // Right boundary
    y_min: 500,  // Top boundary
    y_max: 3500   // Bottom boundary
};
global.spawned_dogs = []; // Stores active dog instances

draw_text(x, y, "Week: " + string(global.current_week));

function scr_spawn_dogs() {
	if(room != rm_school)
		return;
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
        new_dog.dog_id = global.students[i].dog_id;
		
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
global.next_student_id = 0; // Unique ID for new students
global.next_faculty_id = 0;  // Unique ID for new faculty members

global.available_dog_names = ["Buddy", "Max", "Charlie", "Bella", "Luna", "Rocky", "Daisy", "Milo", "Cooper", "Bailey", "Teddy", "Lucy", "Willow", "Bear"];

function add_student() {
    
    // Assign a random name
    var name_index = irandom(array_length(global.available_dog_names) - 1);
    var selected_name = global.available_dog_names[name_index];
    array_delete(global.available_dog_names, name_index, 1);

    // Assign a random type
    var dog_type = choose(obj_dog1, obj_dog2, obj_dog3, obj_dog4);

    // Create the student
    var student = {
        dog_id: global.next_student_id,
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
for (var i = 0; i < 3; i++) add_student();
for (var j = 0; j < 2; j++) add_faculty();
calculate_overall_student_grade();


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
            case "piano": total_score += 3; break;
            case "gym": total_score += 20; break;
            case "soccer field": total_score += 10; break;
            case "ping pong table": total_score += 2; break;
            case "swimming tpool": total_score += 12; break;
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
    var avg_student_happiness = 0;
    
    if (array_length(global.students) > 0) {
        for (var i = 0; i < array_length(global.students); i++) {
            avg_student_happiness += global.students[i].happiness;
        }
        avg_student_happiness /= array_length(global.students);
    }

    var new_students = 1; // Base enrollment

    if (avg_student_happiness >= 80) new_students += irandom_range(3, 5); // More students enroll when happiness is high
    else if (avg_student_happiness >= 60) new_students += irandom_range(1, 3);
    else if (avg_student_happiness < 40) new_students -= irandom_range(1, 2); // Students drop out if morale is low

    for (var i = 0; i < max(0, new_students); i++) {
        add_student();
    }

    show_message(string(new_students) + " new students have enrolled due to student happiness level.");
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

function apply_bad_event_impact() {
    var happiness_loss = irandom_range(5, 15); // Random decrease
    var grade_loss = irandom_range(3, 10);

    // Reduce student happiness & grades
    for (var i = 0; i < array_length(global.students); i++) {
        global.students[i].happiness -= happiness_loss;
        global.students[i].happiness = clamp(global.students[i].happiness, 0, 100);
        
        global.students[i].grade -= grade_loss;
        global.students[i].grade = clamp(global.students[i].grade, 0, 100);
    }

    // Reduce faculty happiness
    for (var j = 0; j < array_length(global.faculty); j++) {
        global.faculty[j].happiness -= happiness_loss;
        global.faculty[j].happiness = clamp(global.faculty[j].happiness, 0, 100);
    }

}


function show_board_chair_event() {
    show_message("The CHAIR of the School's Board is visiting the school!");
	room_goto(rm_chair_animation);
}

function calculate_weekly_income() {
    global.weekly_income = array_length(global.students) * global.student_tuition;
}


function calculate_weekly_expenses() {
    global.weekly_expense = (array_length(global.faculty) * global.faculty_salary) + (array_length(global.facilities) * global.maintenance_per_facility);
}

function apply_faculty_impact() {
    var faculty_threshold = 60; // Below this, faculty might quit
    var quitting_faculty = 0;

    for (var j = array_length(global.faculty) - 1; j >= 0; j--) {
        var faculty = global.faculty[j];
        var quit_chance = 0;

        if (faculty.happiness < faculty_threshold) {
            quit_chance = (faculty_threshold - faculty.happiness) * 2; // Increase probability as happiness drops
            if (irandom(100) < quit_chance) {
                array_delete(global.faculty, j, 1);
                quitting_faculty += 1;
            }
        }
    }

    if (quitting_faculty > 0) {
        show_message(string(quitting_faculty) + " faculty members quit due to low happiness!");
        calculate_weekly_expenses(); // Update budget
    }
}


function check_student_dropout() {
    var dropout_threshold = 60; // Students below this happiness level might drop out
    var unhappy_students = 0;

    for (var i = array_length(global.students) - 1; i >= 0; i--) {
        var student = global.students[i];

        if (student.happiness < dropout_threshold) {
            var dropout_chance = (dropout_threshold - student.happiness) * 2; // Increases as happiness gets lower
            if (irandom(100) < dropout_chance) { // Probability check
                array_delete(global.students, i, 1);
                unhappy_students += 1;
            }
        }
    }

    if (unhappy_students > 0) {
        show_message(string(unhappy_students) + " students dropped out due to low happiness!");
        calculate_weekly_income(); // Update revenue
    }
}

calculate_weekly_income();
calculate_weekly_expenses();

function display_message(text) {
    var popup = instance_create_layer(display_get_gui_width() / 2, display_get_gui_height() / 2, "Instances", obj_message_popup);
    popup.message_text = text;
}

function apply_dog_interaction(dog, choice) {
    switch (choice) {
        case 0: // Pet
            global.students[dog.dog_id].happiness += 5;
            display_message("The dog wags its tail! (+5 Happiness)");
            break;
		case 1:
			global.students[dog.dog_id].happiness -= 5;
			display_message("The dog weeps! (-5 Happiness)");
			break;
    }

    global.students[dog.dog_id].happiness = clamp(global.students[dog.dog_id].happiness, 0, 100);
    global.students[dog.dog_id].grade = clamp(global.students[dog.dog_id].grade, 0, 100);
	
}
