/// @description Insert description here
// You can write your code in this editor
global.build_x = other.x;
global.build_y = other.y;
instance_destroy(other);
global.choosing = true;
instance_create_layer(x, y, "Instances", obj_facility_menu);