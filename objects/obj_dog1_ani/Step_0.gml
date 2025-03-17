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
	if (x <= 1500){
		global.event++;
		audio_play_sound(sound_love, 10, false, 1, 14);
		obj_principal_animation_big.count = 0;
		obj_principal_animation_big.jumpy = 4;
	}
}
if (global.event == 7){
	if(not audio_is_playing(sound_love)) {
		room_goto(rm_school);
		global.return_from_chair = true;
	}
	image_index = 1;
	y += jumpy;
	count += 1;
	if (count >= 25){
		jumpy = -jumpy;
		count = 0;
	}
}
		