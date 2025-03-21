/// @description Insert description here
// You can write your code in this editor

// Check keys for movement

if(global.occupied)
{
	return;
}

moveRight = keyboard_check(vk_right);
moveUp = keyboard_check(vk_up);
moveLeft = keyboard_check(vk_left);
moveDown = keyboard_check(vk_down);

if keyboard_check(ord("W"))
{
    moveUp = 1;
}
if keyboard_check(ord("A"))
{
    moveLeft = 1;
}
if keyboard_check(ord("S"))
{
    moveDown = 1;

}if keyboard_check(ord("D"))
{
    moveRight = 1;
}

// Calculate movement
vx = ((moveRight - moveLeft) * walkSpeed);
vy = ((moveDown - moveUp) * walkSpeed);

// If Idle
if (vx == 0 && vy == 0) {
	// Change idle Sprite based on last direction
	switch dir {
		case 0: sprite_index = spr_principal_idle_right; break;
		case 1: sprite_index = spr_principal_idle_back; break;
		case 2: sprite_index = spr_principal_idle_left; break;
		case 3: sprite_index = spr_principal_idle_front; break;
	}
}

// If moving
if (vx != 0 || vy != 0) {
	if(place_meeting(x + vx, y + vy, obj_piano)) {
		if(instance_place(x + vx, y + vy, obj_piano).draw_alpha != 1) {
			global.build_x = instance_place(x + vx, y + vy, obj_piano).x;
			global.build_y = instance_place(x + vx, y + vy, obj_piano).y;
			global.build_object = "piano";
			global.occupied = true;
			instance_create_layer(x, y, "Instances", obj_facility_menu);
		}
		vx = 0;
		vy = 0;
	}
	else if(place_meeting(x + vx, y + vy, obj_ping_pong_table)) {
		if(instance_place(x + vx, y + vy, obj_ping_pong_table).draw_alpha != 1) {
			global.build_x = instance_place(x + vx, y + vy, obj_ping_pong_table).x;
			global.build_y = instance_place(x + vx, y + vy, obj_ping_pong_table).y;
			global.build_object = "ping pong table";
			global.occupied = true;
			instance_create_layer(x, y, "Instances", obj_facility_menu);
		}
		vx = 0;
		vy = 0;
	}
	else if(place_meeting(x + vx, y + vy, obj_soccer_field)) {
		if(instance_place(x + vx, y + vy, obj_soccer_field).draw_alpha != 1) {
			global.build_x = instance_place(x + vx, y + vy, obj_soccer_field).x;
			global.build_y = instance_place(x + vx, y + vy, obj_soccer_field).y;
			global.build_object = "soccer field";
			global.occupied = true;
			instance_create_layer(x, y, "Instances", obj_facility_menu);
		}
		vx = 0;
		vy = 0;
	}
	else if(place_meeting(x + vx, y + vy, obj_swimming_pool)) {
		if(instance_place(x + vx, y + vy, obj_swimming_pool).draw_alpha != 1) {
			global.build_x = instance_place(x + vx, y + vy, obj_swimming_pool).x;
			global.build_y = instance_place(x + vx, y + vy, obj_swimming_pool).y;
			global.build_object = "swimming pool";
			global.occupied = true;
			instance_create_layer(x, y, "Instances", obj_facility_menu);
		}
		vx = 0;
		vy = 0;
	}
	x += vx;
	y += vy;
	// Change walking Sprite based on direction
	if (vx > 0) {
		sprite_index = spr_principal_right;
		dir = 0;
	}
	if (vx < 0) {
		sprite_index = spr_principal_left;
		dir = 2;
	}
	if (vy > 0) {
		sprite_index = spr_principal_front;
		dir = 3;
	}
	if (vy < 0) {
		sprite_index = spr_principal_back;
		dir = 1;
	}
}

// Depth sorting
depth = -y;

// Keep Camera Centered on the Player
var cam = view_camera[0]; // Get the camera ID
var cam_width = camera_get_view_width(cam);
var cam_height = camera_get_view_height(cam);

// Center the camera on the player's position
camera_set_view_pos(cam, x - cam_width / 2, y - cam_height / 2);