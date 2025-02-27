/// @description Insert description here
// You can write your code in this editor
// Draw the dog sprite
draw_self();

// Draw the name above the dog
draw_set_halign(fa_center);
draw_set_color(c_white); // White for visibility

// Draw the text slightly above the dog
draw_text(x, y - 70, dog_name);
draw_set_halign(fa_left);