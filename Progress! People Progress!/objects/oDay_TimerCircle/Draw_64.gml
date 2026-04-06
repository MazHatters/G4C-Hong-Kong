// Draw the timer circle sprite
draw_self();

// Set text properties
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(fDialog);
draw_set_colour(c_white);

if (instance_exists(oController))
{
	// Convert frames to seconds for display
	var _seconds = ceil(oController.day_timer / 60);
	draw_text(x, y, "Time:\n" + string(_seconds));
}

// Reset alignment (good practice)
draw_set_halign(fa_left);
draw_set_valign(fa_top);
