// Draw at our locked GUI coordinates
draw_sprite(sprite_index, image_index, gui_x, gui_y);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(Font1);
draw_set_colour(c_white);
//draw_text(gui_x, gui_y, text);

// Reset for other GUI elements
draw_set_halign(fa_left);
draw_set_valign(fa_top);