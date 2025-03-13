/// @description Insert description here
// You can write your code in this editor
var _yincre = 10;
_yincre += 10;
if (global.event == 0){
	x = obj_helicopter.x;
	y = obj_helicopter.y - 200;
	_yincre = 1;
}
if (global.event == 1){
		y += _yincre;
	if (y >= 1200){
		global.event++;
	}
}
if (global.event == 2){
	view_wport[0] = 1200;
    view_hport[0] = 800;
	//i wanna zoom in idk how to do it ;( above code doesnt work
	sprite_index = spr_chair_down;
	y += 2;
	if (y >= 1420){
		global.event++;
	}
}
if (global.event == 3){
	sprite_index = spr_chair_left;
	x -= 2;
	if (x <= 1360){
		global.event++;
		sprite_index = spr_chair;
	}
}
if (global.event == 4){
	instance_create_layer(display_get_gui_width() / 2, display_get_gui_height() / 2, "Instances", obj_chair_interaction);
}
	