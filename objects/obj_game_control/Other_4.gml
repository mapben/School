/// @description Insert description here
// You can write your code in this editor
if (room == rm_school) {
    scr_spawn_dogs();
	for (var i = 0; i < instance_number(obj_par_environment); i++) {
		var land = instance_find(obj_par_environment, i);
	    var occupied = false;

        // Check if this land has a purchased facility
        for (var j = 0; j < array_length(global.facilities); j++) {
            if (global.facilities[j].x == land.x && global.facilities[j].y == land.y) {
                occupied = true;
                break;
            }
        }

        // If no facility is built here, recreate the empty land slot
        if (occupied) {
			land.draw_alpha = 1;
        }
    }
}
