// Draw the box sprite
draw_self();

// Position text relatively to the box (Top Right)
// Assuming origin is top-right or adjusted in draw
if (instance_exists(oController))
{
	draw_set_font(fDialog);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	
	// Center text on the sprite regardless of origin
	var _bw = sprite_get_width(sprite_index);
	var _bh = sprite_get_height(sprite_index);
	var _ox = sprite_get_xoffset(sprite_index);
	var _oy = sprite_get_yoffset(sprite_index);
	
	draw_text(x - _ox + _bw/2, y - _oy + _bh/2, "Approvals left:\n" + string(oController.approvals_remaining));
}
