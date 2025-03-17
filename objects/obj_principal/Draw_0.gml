/// @description Insert description here
// You can write your code in this editor
// Draw the principal sprite
draw_self();

// Draw the name above the principal
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(x, y - 140, global.player_name);
draw_set_halign(fa_left);

for (var i = 1; i <= global.num_co_principals; i++) {
    var offset_x = obj_principal.x - (i * 50);
    var offset_y = obj_principal.y;

    draw_sprite_ext(sprite_index, image_index, offset_x, offset_y, 1, 1, 0, c_white, 1);
}
