var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

if (state == "TALKING" || state == "DECIDING" || state == "RESPONSE")
{
	layer_set_visible("Dialogue_box", true);
	draw_set_alpha(1);

	draw_set_color(c_black);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(40, _gui_h - box_height + 30, identity + ":");

	var _print_text = string_copy(full_text, 1, floor(char_count));
	draw_text_ext(40, _gui_h - box_height + 60, _print_text, 25, _gui_w - 80);
}

else
	layer_set_visible("Dialogue_box", false);