/// @description Insert description here
// You can write your code in this editor
if (variable_instance_exists(self, "message")) {
    var box_x = display_get_gui_width() / 2 - 150;
    var box_y = display_get_gui_height() - 100;

    // Draw dialogue background
    draw_set_color(make_color_rgb(50, 50, 50));
    draw_rectangle(box_x, box_y, box_x + 400, box_y + 60, false);

    // Draw text
    draw_set_color(c_white);
    draw_text(box_x + 10, box_y + 20, message);
}
