/// @description Insert description here
// You can write your code in this editor
// Draw the principal sprite
draw_self();

// Draw the name above the principal
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(x, y - 140, global.player_name);
draw_set_halign(fa_left);
