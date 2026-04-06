var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

if (state == "TALKING" || state == "DECIDING" || state == "RESPONSE")
{
	layer_set_visible("Dialogue_box", true);
	draw_set_alpha(1);

	draw_set_color(c_black);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
    
    // Use Italic Font for Name (Placeholder: Font1_italic should be created in GMS2)
    if (asset_get_index("Font_Italic") != -1) draw_set_font(Font_Italic);
	draw_text(40, _gui_h - box_height + 30, identity + ":");
    draw_set_font(Font1); // Reset for dialogue

	var _print_text = string_copy(full_text, 1, floor(char_count));
	draw_text_ext(40, _gui_h - box_height + 60, _print_text, 25, _gui_w - 80);
}

else
	layer_set_visible("Dialogue_box", false);