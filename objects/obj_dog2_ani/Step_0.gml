/// @description Insert description here
// You can write your code in this editor


if (walking_direction == 1) {
    image_xscale = 3; // Flip sprite left
} 
else if (walking_direction == -1) {
    image_xscale = -3; // Flip sprite right
}
if (global.event == 6){
	x += 5 * walking_direction;
}
if (global.event == 7){
	image_index = 1;
	y += jumpy;
	count += 1;
	if (count >= 25){
		jumpy = -jumpy;
		count = 0;
	}
}
		