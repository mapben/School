/// @description Insert description here
// You can write your code in this editor

// Check keys for movement
moveRight = keyboard_check(vk_right);
moveUp = keyboard_check(vk_up);
moveLeft = keyboard_check(vk_left);
moveDown = keyboard_check(vk_down);

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
	if !collision_point(x + vx, y, obj_par_environment, true, true) {
		x += vx;
	}
	if !collision_point(x , y + vy, obj_par_environment, true, true) {
		y += vy;
	}
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
depth =-y;

// Keep Camera Centered on the Player
var cam = view_camera[0]; // Get the camera ID
var cam_width = camera_get_view_width(cam);
var cam_height = camera_get_view_height(cam);

// Center the camera on the player's position
camera_set_view_pos(cam, x - cam_width / 2, y - cam_height / 2);