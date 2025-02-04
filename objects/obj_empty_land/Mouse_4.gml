/// @description Insert description here
// You can write your code in this editor
if (global.school_budget >= 20000) { // Example cost
    global.school_budget -= 20000;
    global.build_x = x;
	global.build_y = y;
	instance_create_layer(x, y, "Instances", obj_facility_menu);
    instance_destroy(); // Remove empty land
} else {
    show_message("Not enough funds!");
}
