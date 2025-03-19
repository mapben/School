/// @description Insert description here
// You can write your code in this editor
if (room == rm_school) {
    scr_spawn_dogs();
	for (var i = 0; i < instance_number(obj_empty_land); i++) {
		var land = instance_find(obj_empty_land, i);
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
            instance_destroy(land);
        }
    }
    for (var i = 0; i < array_length(global.facilities); i++) {
        var facility = global.facilities[i];
        var facility_obj;
        switch(facility.type) {
			case "piano":
				facility_obj = obj_piano
			break;
			
			case "ping pong table":
				facility_obj = obj_ping_pong_table
			break;
			
			case "soccer field":
				facility_obj = obj_soccer_field
			break;
			
			case "swimming pool":
				facility_obj = obj_swimming_pool
			break;
			
			case "gym":
				facility_obj = obj_new_building
			break;
			
		}
        instance_create_layer(facility.x, facility.y, "Instances", facility_obj);
    }
}
