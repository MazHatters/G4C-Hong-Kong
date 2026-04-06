// Draw the box sprite
draw_self();

// Position text relatively to the box (Top Right)
// Assuming origin is top-right or adjusted in draw
if (instance_exists(oController))
{
	draw_set_font(Font1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text(x, y, string(oController.approvals_remaining));
}
