/// @description Insert description here
// You can write your code in this editor
if (global.event == 0){
	x = obj_helicopter.x - 60;
	y = obj_helicopter.y - 100;
}
if (global.event == 1){
		y += 10;
	if (y >= 1200){
		global.event++;
	}
}
if (global.event == 2){
	view_wport[0] = 1200;
    view_hport[0] = 800;
	sprite_index = spr_chair_down;
	y += 4;
	if (y >= 1420){
		global.event++;
	}
}
if (global.event == 3){
	sprite_index = spr_chair_left;
	x -= 4;
	if (x <= 1360){
		global.event++;
		sprite_index = spr_chair;
	}
}
if (global.event == 4){
	instance_create_layer(display_get_gui_width() / 2, display_get_gui_height() / 2, "Instances", obj_chair_interaction);
	global.event += 0.5;
}
if (global.event == 5){
	audio_stop_sound(sound_chair_intro);
	instance_create_layer(x,y, "Instances", obj_stage);
	obj_principal_animation_big.image_alpha = 1;
	global.event++;
}


