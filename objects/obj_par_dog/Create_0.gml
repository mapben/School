/// @description Insert description here
// You can write your code in this editor
// Define walking distance range
walk_distance = irandom_range(200, 300); // Randomize path length
start_x = x; // Save starting position
target_x = x + walk_distance; // Set rightmost walk point
move_speed = 1.5; // Walking speed
walking_direction = 1; // 1 = right, -1 = left
depth = -y;
name = "";
dog_id = -1;