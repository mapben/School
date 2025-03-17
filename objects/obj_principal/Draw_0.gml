/// @description Insert description here
// You can write your code in this editor

// Draw the name above the principal
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(x, y - 140, global.player_name);
draw_set_halign(fa_left);

for (var i = global.num_co_principals; i > 0; i--) {
	var offset_x;
	if(i % 2 == 1) offset_x = obj_principal.x - ((i + 1) / 2 * 50);
	else offset_x = obj_principal.x + (i / 2 * 50);
    var offset_y = obj_principal.y;

    draw_sprite_ext(sprite_index, image_index, offset_x, offset_y, 1, 1, 0, c_white, 1);
}

// Draw the principal sprite
draw_self();