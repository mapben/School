/// @description Insert description here
// You can write your code in this editor
if(image_alpha == 0) exit;

for (var i = global.num_co_principals; i > 0; i--) {
	var offset_x;
	if(i % 2 == 1) offset_x = obj_principal_animation_big.x - ((i + 1) / 2 * 150);
	else offset_x = obj_principal_animation_big.x + (i / 2 * 150);
    var offset_y = obj_principal_animation_big.y;

    draw_sprite_ext(sprite_index, image_index, offset_x, offset_y, 3, 3, 0, c_white, 1);
}

// Draw the principal sprite
draw_self();