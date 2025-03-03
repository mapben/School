/// @description Insert description here
// You can write your code in this editor
var response = async_load[? "result"];

// Trim spaces and standardize input case
response = string_lower(string_trim(response));

// Keep asking until the player provides the correct response
if (response == "give a performance" or response == "1") {
    show_message("You led all students and faculties to give a grand performance. The Chair is impressed and donates $50000! Everyone is less happy and grades drop");
    global.board_chair_response_given = true;
	global.school_budget += 50000;
	apply_bad_event_impact();
	    
    // Destroy the board chair sprite
    instance_destroy(obj_chair);
} else {
	show_message("You didn't enter a valid choice. Try again!");
	show_board_chair_event();
}