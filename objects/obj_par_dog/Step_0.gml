/// @description Insert description here
// You can write your code in this editor
// Move the dog left or right
x += move_speed * walking_direction;

// If reaching walk limit, turn around
if (walking_direction == 1 && x >= target_x) {
    walking_direction = -1;
    image_xscale = -1; // Flip sprite left
} 
else if (walking_direction == -1 && x <= start_x) {
    walking_direction = 1;
    image_xscale = 1; // Flip sprite right
}
